#!/usr/bin/env bash
set -euo pipefail

REPO="/home/yzs/riscv/rv-isa-sec"
TIMESTAMP=$(date +%F-%H)
REPORT_FILE="$REPO/reports/${TIMESTAMP}.md"
SUMMARY_FILE="/tmp/spechunter-summary-${TIMESTAMP}.txt"

mkdir -p "$REPO/reports"
cd "$REPO"

# ---- 步骤 1: 暂存所有新产出 ----
echo "=== Step 1: Staging all new output ==="

git add output/

STAGED=$(git diff --cached --name-only -- output/ | grep '\.json$' || true)
STAGED_COUNT=$(echo "$STAGED" | grep -c . 2>/dev/null || echo 0)

if [ "$STAGED_COUNT" -eq 0 ]; then
  echo "No new output files. Done."
  exit 0
fi

echo "New JSON files staged: $STAGED_COUNT"

# 暂存对应的 spec 标记文件和 log 目录
echo "$STAGED" | while IFS= read -r f; do
  [ -z "$f" ] && continue
  spec_dir=$(echo "$f" | sed 's|^output/|spec/|' | xargs dirname)
  if [ -d "$spec_dir" ]; then
    git add "$spec_dir"/.spechunter_done "$spec_dir"/.spechunter_failed "$spec_dir"/.spechunter_running 2>/dev/null || true
    if [ -d "$spec_dir/logs" ]; then
      git add "$spec_dir/logs/"
    fi
  fi
done

# ---- 步骤 2: 提交所有文件 ----
echo "=== Step 2: Committing all new files ==="

git commit -m "wip: staged daily scan output for ${TIMESTAMP}" || true
echo "Committed."

# ---- 步骤 3: 分类并生成摘要 ----
echo "=== Step 3: Categorizing and building summary ==="

BUG_COUNT=0
RISK_COUNT=0
COMPLIANT_COUNT=0
OTHER_COUNT=0
SUMMARY_BODY=""

while IFS= read -r f; do
  overall=$(jq -r '.overall_severity // "unknown"' "$f" 2>/dev/null || echo "parse_error")
  consequence=$(jq -r '.security_spec.security_consequence // "N/A"' "$f" 2>/dev/null || echo "N/A")

  case "$overall" in
    bug_confirmed)
      BUG_COUNT=$((BUG_COUNT + 1))
      SUMMARY_BODY+="[$overall] ${REPO}/$f -> $consequence"$'\n'
      ;;
    potential_risk)
      RISK_COUNT=$((RISK_COUNT + 1))
      SUMMARY_BODY+="[$overall] ${REPO}/$f -> $consequence"$'\n'
      ;;
    compliant)
      COMPLIANT_COUNT=$((COMPLIANT_COUNT + 1))
      ;;
    *)
      OTHER_COUNT=$((OTHER_COUNT + 1))
      ;;
  esac
done <<< "$STAGED"

echo "BUG=$BUG_COUNT RISK=$RISK_COUNT COMPLIANT=$COMPLIANT_COUNT OTHER=$OTHER_COUNT"

cat > "$SUMMARY_FILE" <<EOF
# specHunter Daily Scan — ${TIMESTAMP}
Total: ${STAGED_COUNT} | bug_confirmed: ${BUG_COUNT} | potential_risk: ${RISK_COUNT} | compliant: ${COMPLIANT_COUNT}
EOF
if [ -n "$SUMMARY_BODY" ]; then
  echo "$SUMMARY_BODY" >> "$SUMMARY_FILE"
else
  echo "(none)" >> "$SUMMARY_FILE"
fi

if [ "$BUG_COUNT" -eq 0 ] && [ "$RISK_COUNT" -eq 0 ]; then
  echo "=== Nothing to analyze. Finalizing. ==="
  git commit --amend -m "$(cat <<EOF
daily: scan report for ${TIMESTAMP}

Co-Authored-By: Claude (via Claude Code) <noreply@anthropic.com>
EOF
  )" || true
  echo "=== Complete ==="
  exit 0
fi

# ---- 步骤 4: Claude 分析 ----
echo "=== Step 4: Claude analysis ==="

CLAUDE_WORKDIR=$(mktemp -d)
cp "$SUMMARY_FILE" "$CLAUDE_WORKDIR/summary.txt"

SUMMARY_CONTENT=$(cat "$SUMMARY_FILE")

PROMPT_TEXT=$(cat <<PROMPT
你是 specHunter 扫描器的每日分析员。

## 摘要
${SUMMARY_CONTENT}

## 任务
对每个条目（路径已在摘要中）读取对应 JSON 获取细节。条目超过 15 个时务必用 Agent subagent 并行读取。生成中文报告写入 ${REPORT_FILE}。

## 报告格式

\`\`\`markdown
# 每日扫描报告 — ${TIMESTAMP}

## 概览
| 严重程度 | 数量 |
|----------|------|
| bug_confirmed | ${BUG_COUNT} |
| potential_risk | ${RISK_COUNT} |
| compliant | ${COMPLIANT_COUNT} |

## 确认 Bug
每个 bug:
- **Spec / PR / Target**
- **后果**: info_leak / privilege_escape / denial_of_service / function_loss / data_corruption / race_condition
- **描述**: 2-3 句简述

## 潜在风险
同上。

## 跨 Spec 模式
涉及同类硬件机制（CSR 访问控制、计时器、调试安全等）的 PR，在此标注。
\`\`\`

## Constraints
- 中文撰写，术语保留英文
- 只写 ${REPORT_FILE}，不改其他文件
- 简洁，晨间快扫用
- 读 JSON 关注: overall_severity, security_spec.*, diff_analysis.modifications[].security_impact
PROMPT
)

cd "$CLAUDE_WORKDIR"

claude -p "$PROMPT_TEXT" \
  --model opus \
  --output-format text \
  --bare \
  --dangerously-skip-permissions \
  --system-prompt "你是一个安全分析助手，只读文件写报告。条目多时用 subagent 并行分析。回复简洁。"

# ---- 步骤 5: amend report into commit ----
echo "=== Step 5: Amending with report ==="

cd "$REPO"

if [ -f "$REPORT_FILE" ]; then
  git add "$REPORT_FILE"
  git commit --amend -m "$(cat <<EOF
daily: scan report for ${TIMESTAMP}

Co-Authored-By: Claude (via Claude Code) <noreply@anthropic.com>
EOF
  )" || true
  echo "Amended with report."
else
  echo "WARNING: Report not generated, skipping amend."
fi

rm -rf "$CLAUDE_WORKDIR"

echo "=== Complete ==="
echo "Report: $REPORT_FILE"