#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# watchdog_batch.sh — 监控 batch_scan.sh 所在的 tmux 会话，退出时自动重启
#
# 用法:
#   ./scripts/watchdog_batch.sh                  # 前台运行
#   ./scripts/watchdog_batch.sh -d               # 后台守护模式
#   ./scripts/watchdog_batch.sh -n 60            # 每 60 秒检查一次（默认 30）
#   ./scripts/watchdog_batch.sh -s               # 停止后台 watchdog
#
# batch_scan.sh 天然支持断点续跑（标记文件），所以崩溃/退出后直接重跑即可。
# ---------------------------------------------------------------------------

set -u

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

TMUX_SESSION="${TMUX_SESSION:-spechunter}"
CHECK_INTERVAL=30
COOLDOWN=30
LOG_FILE="/tmp/spechunter-watchdog.log"
DAEMON=false
PID_FILE="/tmp/spechunter-watchdog.pid"

# batch_scan.sh arguments
WORKERS="${WORKERS:-3}"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"
}

usage() {
    cat <<'EOF'
watchdog_batch.sh — 监控 spechunter batch tmux 会话，自动重启

用法:
  ./scripts/watchdog_batch.sh [选项]

选项:
  -d                后台守护模式
  -s                停止后台运行的 watchdog（也会关闭 tmux 会话）
  -n SECONDS        检查间隔（默认 30 秒）
  -w N              batch_scan.sh worker 数量（默认 3）
  -h                显示帮助

日志: /tmp/spechunter-watchdog.log

EOF
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        -d) DAEMON=true; shift ;;
        -s)
            if [[ -f "$PID_FILE" ]]; then
                pid=$(cat "$PID_FILE")
                if kill -0 "$pid" 2>/dev/null; then
                    kill "$pid"
                    rm -f "$PID_FILE"
                    echo "watchdog (PID: $pid) 已停止"
                else
                    rm -f "$PID_FILE"
                    echo "watchdog 进程已不存在"
                fi
            else
                echo "未找到 PID 文件"
            fi
            if tmux has-session -t "$TMUX_SESSION" 2>/dev/null; then
                # Kill all running batch_scan.sh and spechunter processes first
                # so they don't become orphans when the tmux session dies.
                local pane_pid
                pane_pid=$(tmux list-panes -t "$TMUX_SESSION" -F '#{pane_pid}' 2>/dev/null | head -1 || true)
                if [[ -n "$pane_pid" ]]; then
                    echo "关闭子进程树 (pane_pid=$pane_pid)..."
                    pkill -P "$pane_pid" 2>/dev/null || true
                    kill "$pane_pid" 2>/dev/null || true
                    sleep 2
                fi
                tmux kill-session -t "$TMUX_SESSION"
                echo "tmux 会话 '$TMUX_SESSION' 已关闭"
            fi
            exit 0
            ;;
        -n) CHECK_INTERVAL="$2"; shift 2 ;;
        -w) WORKERS="$2"; shift 2 ;;
        -h) usage; exit 0 ;;
        *) echo "未知选项: $1"; usage; exit 1 ;;
    esac
done

if [[ "$DAEMON" == true ]]; then
    nohup "$0" -n "$CHECK_INTERVAL" -w "$WORKERS" >>"$LOG_FILE" 2>&1 &
    echo "$!" > "$PID_FILE"
    echo "watchdog 已后台启动 (PID: $!)，日志: $LOG_FILE"
    echo "停止: $0 -s"
    exit 0
fi

# ---------------------------------------------------------------------------
# helpers
# ---------------------------------------------------------------------------

get_last_line() {
    tmux capture-pane -t "$TMUX_SESSION" -p -S -10 2>/dev/null \
        | grep -v '^$' | tail -1 || true
}

# Detect shell prompt: ends with $ or # (not ❯ since spechunter doesn't use aris)
is_shell_prompt() {
    local line="$1"
    # Typical bash prompt: "user@host:~/path$ " or just "$ " or "# "
    if echo "$line" | grep -qE '[#$]\s*$'; then
        return 0
    fi
    # Also detect "batch complete" in the output — means it finished cleanly
    if echo "$line" | grep -q 'Batch complete'; then
        return 0
    fi
    return 1
}

is_script_running() {
    local pane_pid
    pane_pid=$(tmux list-panes -t "$TMUX_SESSION" -F '#{pane_pid}' 2>/dev/null | head -1)
    if [[ -z "$pane_pid" ]]; then
        return 1
    fi
    # Check if any python/spechunter process is running under this pane
    local children
    children=$(pgrep -P "$pane_pid" 2>/dev/null) || true
    for child in $children; do
        local comm
        comm=$(cat "/proc/$child/comm" 2>/dev/null) || true
        if [[ "$comm" == "python" ]] || [[ "$comm" == "bash" ]]; then
            return 0
        fi
    done
    return 1
}

launch_batch() {
    log "启动 batch_scan.sh (workers=$WORKERS)"
    tmux send-keys -t "$TMUX_SESSION" "clear" Enter
    sleep 1
    tmux send-keys -t "$TMUX_SESSION" \
        "cd $ROOT_DIR && ./scripts/batch_scan.sh --workers $WORKERS" Enter
    LAST_LAUNCH=$(date +%s)
}

cleanup_stale_markers() {
    local running_files
    running_files=$(find "$ROOT_DIR/spec" -maxdepth 3 -name ".spechunter_running" -type f 2>/dev/null)
    if [[ -n "$running_files" ]]; then
        local count
        count=$(echo "$running_files" | wc -l)
        log "清理 $count 个残留的 .spechunter_running 标记文件"
        echo "$running_files" | while IFS= read -r f; do
            rm -f "$f"
            log "  删除: ${f#$ROOT_DIR/spec/}"
        done
    fi
}

# ---------------------------------------------------------------------------
# startup
# ---------------------------------------------------------------------------

log "=== spechunter watchdog 启动 ==="
echo "$$" > "$PID_FILE"

cleanup() {
    log "收到信号，清理退出"
    rm -f "$PID_FILE"
    log "=== watchdog 退出 ==="
    exit 0
}
trap cleanup SIGTERM SIGINT

log "  tmux 会话: $TMUX_SESSION"
log "  检查间隔: ${CHECK_INTERVAL}s"
log "  workers: $WORKERS"

# Clean up stale .spechunter_running markers from previous crashed runs
cleanup_stale_markers

# Ensure tmux session exists
if ! tmux has-session -t "$TMUX_SESSION" 2>/dev/null; then
    log "创建 tmux 会话 '$TMUX_SESSION'"
    tmux new-session -d -s "$TMUX_SESSION" -c "$ROOT_DIR"
fi

# If session is fresh (shell prompt), launch batch_scan.sh immediately
last_line=$(get_last_line)
if is_shell_prompt "$last_line" || ! is_script_running; then
    log "会话空闲，首次启动 batch_scan.sh"
    launch_batch
fi

# ---------------------------------------------------------------------------
# main loop
# ---------------------------------------------------------------------------

LAST_LAUNCH=0
CONSECUTIVE_ERRORS=0
MAX_ERRORS=3

while true; do
    sleep "$CHECK_INTERVAL" || true

    # Ensure tmux session still exists
    if ! tmux has-session -t "$TMUX_SESSION" 2>/dev/null; then
        log "tmux 会话丢失，重建"
        tmux new-session -d -s "$TMUX_SESSION" -c "$ROOT_DIR"
        sleep 2
    fi

    # Cooldown: don't act too soon after last launch
    now=$(date +%s)
    if [[ $LAST_LAUNCH -gt 0 ]] && [[ $((now - LAST_LAUNCH)) -lt $COOLDOWN ]]; then
        continue
    fi

    last_line=$(get_last_line)

    if is_script_running; then
        CONSECUTIVE_ERRORS=0
        continue
    fi

    # No script running — check if we're back at shell prompt
    if is_shell_prompt "$last_line"; then
        log "检测到 shell 提示符，batch_scan.sh 已退出"
        if echo "$last_line" | grep -q 'Batch complete'; then
            log "batch_scan.sh 正常完成，等待 5 分钟后重启新一轮扫描"
            sleep 300 || true
        fi
        cleanup_stale_markers
        launch_batch
        CONSECUTIVE_ERRORS=0
    else
        # Shell prompt not yet visible — maybe still exiting, wait
        CONSECUTIVE_ERRORS=$((CONSECUTIVE_ERRORS + 1))
        if [[ $CONSECUTIVE_ERRORS -ge $MAX_ERRORS ]]; then
            log "连续 $MAX_ERRORS 次未检测到脚本运行且无 shell 提示符，强制重启"
            tmux send-keys -t "$TMUX_SESSION" C-c
            sleep 2
            cleanup_stale_markers
            launch_batch
            CONSECUTIVE_ERRORS=0
        fi
    fi
done
