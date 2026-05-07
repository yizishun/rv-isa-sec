#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# batch_scan.sh — scan all spec PRs with 3 concurrent SpecHunter workers.
#
# Usage:
#   ./scripts/batch_scan.sh [--workers N]
#
# All spechunter settings (model, timeouts, targets, prompts) are read from
# spechunter.yaml.  Only the number of concurrent shell workers is controlled
# here.
#
# Marker files (written into each spec/<repo>/pr-NNNN/):
#   .spechunter_running   created before scan starts (prevents double-run)
#   .spechunter_done      created after scan finishes successfully
#   .spechunter_failed    created if scan exits non-zero
#
# Logs are written to spec/<repo>/pr-NNNN/logs/{target}.log via --log-dir
# ---------------------------------------------------------------------------

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

PYTHON="${PYTHON:-$ROOT_DIR/.venv/bin/python}"
WORKERS="${WORKERS:-3}"

# Overridable via argv
while [[ $# -gt 0 ]]; do
    case "$1" in
        --workers) WORKERS="$2"; shift 2 ;;
        *) echo "Unknown arg: $1" >&2; exit 2 ;;
    esac
done

RUNNING=".spechunter_running"
DONE=".spechunter_done"
FAILED=".spechunter_failed"

# ---- helpers ------------------------------------------------------------------

now() { date "+%Y-%m-%d %H:%M:%S"; }

log_info()  { echo "[$(now)] [batch] $*"; }

# Build CLI args for a single PR dir.
# --pr-dir is mandatory; everything else comes from spechunter.yaml.
# Per-target logs go to {log_dir}/{target}.log via --log-dir.
build_cmd() {
    local pr_dir="$1"
    local log_dir="$2"
    local cmd="$PYTHON -m spechunter.cli --pr-dir $pr_dir --log-dir $log_dir"
    if [[ -n "${TARGETS+x}" ]] && [[ ${#TARGETS[@]} -gt 0 ]]; then
        for t in "${TARGETS[@]}"; do
            cmd="$cmd --target $t"
        done
    fi
    echo "$cmd"
}

# Try to atomically claim *pr_dir*.  Returns 0 on success.
claim_pr() {
    local pr_dir="$1"

    if [[ -f "$pr_dir/$DONE" ]] || [[ -f "$pr_dir/$FAILED" ]] || [[ -f "$pr_dir/$RUNNING" ]]; then
        return 1
    fi

    # Atomic create with noclobber: only one process can create the file.
    if (set -C && echo "$$ $(now)" > "$pr_dir/$RUNNING") 2>/dev/null; then
        return 0
    fi
    return 1
}

# Scan a single PR.  Called by each worker.
scan_pr() {
    local pr_dir="$1"
    local rel="${pr_dir#$ROOT_DIR/spec/}"
    local log_dir="$pr_dir/logs"

    log_info "[$rel] starting scan"

    local cmd
    cmd=$(build_cmd "$pr_dir" "$log_dir")

    local exit_code=0
    cd "$ROOT_DIR" && $cmd || exit_code=$?

    if [[ $exit_code -eq 0 ]]; then
        mv "$pr_dir/$RUNNING" "$pr_dir/$DONE"
        log_info "[$rel] ✓ done"
    else
        mv "$pr_dir/$RUNNING" "$pr_dir/$FAILED"
        log_info "[$rel] ✗ failed (exit=$exit_code)"
    fi
}

# ---- discover PRs -------------------------------------------------------------

log_info "Discovering PR directories under spec/ ..."
mapfile -t PR_DIRS < <(find "$ROOT_DIR/spec" -maxdepth 3 -type d -name "pr-*" | sort)
log_info "Found ${#PR_DIRS[@]} PR directories."

# ---- worker loop --------------------------------------------------------------

# Each worker scans the full list.  claim_pr() is atomic (set -C) so only one
# worker will win each PR — the rest skip it.  Work-stealing without a counter.
worker() {
    local wid="$1"
    local scanned=0
    for pr_dir in "${PR_DIRS[@]}"; do
        if claim_pr "$pr_dir"; then
            scan_pr "$pr_dir"
            ((scanned++)) || true
        fi
    done
    log_info "worker $wid finished (scanned $scanned)"
}

# ---- launch workers -----------------------------------------------------------

log_info "Launching $WORKERS workers..."
declare -a WORKER_PIDS=()

for i in $(seq 1 "$WORKERS"); do
    worker "$i" &
    WORKER_PIDS+=($!)
done

# Kill all workers (and their children) on exit, so orphan processes
# don't keep running when the parent shell is killed (e.g. tmux session dies).
_cleanup_workers() {
    log_info "Shutting down workers... (PIDs: ${WORKER_PIDS[*]})"
    for pid in "${WORKER_PIDS[@]}"; do
        pkill -P "$pid" 2>/dev/null || true
        kill "$pid" 2>/dev/null || true
    done
    wait "${WORKER_PIDS[@]}" 2>/dev/null || true
}
trap _cleanup_workers EXIT
trap 'exit 143' TERM HUP

wait

# ---- summary ------------------------------------------------------------------

TOTAL=${#PR_DIRS[@]}
DONE_COUNT=$(find "$ROOT_DIR/spec" -maxdepth 3 -name "$DONE" | wc -l)
FAIL_COUNT=$(find "$ROOT_DIR/spec" -maxdepth 3 -name "$FAILED" | wc -l)
SKIP_COUNT=$(( TOTAL - DONE_COUNT - FAIL_COUNT ))

log_info "=============================================="
log_info "Batch complete."
log_info "  Total:  $TOTAL"
log_info "  Done:   $DONE_COUNT"
log_info "  Failed: $FAIL_COUNT"
log_info "  Skipped:$SKIP_COUNT"
