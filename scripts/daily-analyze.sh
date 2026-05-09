#!/usr/bin/env bash
set -euo pipefail

REPO="/home/yzs/riscv/rv-isa-sec"
TODAY=$(date +%F)
REPORT_FILE="$REPO/reports/${TODAY}.md"
SUMMARY_FILE="/tmp/spechunter-summary-${TODAY}.txt"

mkdir -p "$REPO/reports"

cd "$REPO"

# ---- 步骤 1: 收集新产出 (只 stage，不 commit) ----
echo "=== Step 1: Staging new output ==="

git add output/

STAGED=$(git diff --cached --name-only -- output/ | grep '\.json$' || true)
STAGED_COUNT=$(echo "$STAGED" | grep -c . 2>/dev/null || echo 0)

if [ "$STAGED_COUNT" -eq 0 ]; then
  echo "No new output files. Done."
  exit 0
fi

echo "New JSON files staged: $STAGED_COUNT"

# ---- 步骤 1b: 同步 stage 对应的 spec/ 标记文件和 logs/ ----
echo "=== Step 1b: Staging spec/ markers and logs for new outputs ==="

echo "$STAGED" | while IFS= read -r f; do
  # output/<spec>/pr-<N>/<target>.json -> spec/<spec>/pr-<N>/
  spec_dir=$(echo "$f" | sed 's|^output/|spec/|' | xargs dirname)
  if [ -d "$spec_dir" ]; then
    git add "$spec_dir"/.spechunter_done "$spec_dir"/.spechunter_failed "$spec_dir"/.spechunter_running 2>/dev/null || true
    if [ -d "$spec_dir/logs" ]; then
      git add "$spec_dir/logs/"
    fi
  fi
done

echo "Spec markers and logs staged."

# ---- 步骤 2: 统计并生成非 compliant 摘要 ----
echo "=== Step 2: Building summary for Claude ==="

BUG_COUNT=0
RISK_COUNT=0
COMPLIANT_COUNT=0
PARSE_ERR_COUNT=0

SUMMARY_BODY=""

while IFS= read -r f; do
  overall=$(jq -r '.overall_severity // "unknown"' "$f" 2>/dev/null || echo "parse_error")

  case "$overall" in
    bug_confirmed)  BUG_COUNT=$((BUG_COUNT + 1)) ;;
    potential_risk) RISK_COUNT=$((RISK_COUNT + 1)) ;;
    compliant)      COMPLIANT_COUNT=$((COMPLIANT_COUNT + 1)); continue ;;
    *)              PARSE_ERR_COUNT=$((PARSE_ERR_COUNT + 1)); continue ;;
  esac

  consequence=$(jq -r '.security_spec.security_consequence // "N/A"' "$f" 2>/dev/null || echo "N/A")
  spec=$(echo "$f" | cut -d'/' -f2)
  pr=$(echo "$f" | cut -d'/' -f3)
  target=$(basename "$f" .json)
  SUMMARY_BODY+="[$overall] $spec / $pr / $target -> $consequence"$'\n'
done <<< "$STAGED"

cat > "$SUMMARY_FILE" <<EOF
# specHunter Daily Scan — ${TODAY}
Total: ${STAGED_COUNT} | bug_confirmed: ${BUG_COUNT} | potential_risk: ${RISK_COUNT} | compliant: ${COMPLIANT_COUNT}
EOF

if [ -n "$SUMMARY_BODY" ]; then
  echo "$SUMMARY_BODY" >> "$SUMMARY_FILE"
else
  echo "(none)" >> "$SUMMARY_FILE"
fi

echo "  DEBUG: BUG_COUNT=$BUG_COUNT RISK_COUNT=$RISK_COUNT COMPLIANT_COUNT=$COMPLIANT_COUNT PARSE_ERR_COUNT=$PARSE_ERR_COUNT"
echo "  DEBUG: SUMMARY_BODY lines=$(echo "$SUMMARY_BODY" | wc -l)"
echo "  DEBUG: SUMMARY_FILE=$(wc -c < "$SUMMARY_FILE") bytes, $(wc -l < "$SUMMARY_FILE") lines"

# ---- 步骤 3: 调用 Claude 分析并生成报告 ----
if [ "$BUG_COUNT" -eq 0 ] && [ "$RISK_COUNT" -eq 0 ]; then
  echo "=== Step 3: Skipped (nothing to analyze) ==="
  echo "=== Complete ==="
  exit 0
fi
echo "=== Step 3: Claude analysis ==="

PROMPT_TEXT=$(cat <<PROMPT
你是 specHunter 扫描器的每日分析员。

## 任务

1. 阅读 /tmp/spechunter-summary-${TODAY}.txt，内有今天所有 bug_confirmed 和 potential_risk 条目及统计
2. 读取对应 JSON 文件理解细节
3. 生成报告写入 ${REPORT_FILE}

## 报告格式（中文）

\`\`\`markdown
# Daily Scan Report — ${TODAY}

## Overview
| Severity | Count |
|----------|-------|
| bug_confirmed | N |
| potential_risk | N |
| compliant | N |

## Confirmed Bugs
For each bug:
- **Spec / PR / Target**
- **Consequence**: info_leak / privilege_escape / denial_of_service / function_loss
- **Description**: 2-3 sentence summary

## Potential Risks
Same format as above.

## Cross-Spec Patterns
Note any common hardware mechanisms across multiple PRs today.
\`\`\`

## Constraints
- Write only to ${REPORT_FILE}, do not modify other files
- Be concise, for morning quick-scan use
- Total ${STAGED_COUNT} new files, ${BUG_COUNT} bug_confirmed + ${RISK_COUNT} potential_risk need deep analysis
- compliant entries have been pre-filtered out of the summary
PROMPT
)
echo "  DEBUG: PROMPT_TEXT=$(echo "$PROMPT_TEXT" | wc -c) bytes, $(echo "$PROMPT_TEXT" | wc -l) lines"

claude -p "$PROMPT_TEXT" --model opus --output-format text --dangerously-skip-permissions --add-dir "$REPO" --add-dir /tmp --system-prompt "You are a security analysis assistant. You read files and write reports. Keep responses concise."

echo "=== Complete ==="
echo "Report: $REPORT_FILE"