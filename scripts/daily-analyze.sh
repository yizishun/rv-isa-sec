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

# ---- 步骤 2: 生成新文件摘要 ----
echo "=== Step 2: Building summary for Claude ==="

echo "# specHunter Daily Scan — ${TODAY}" > "$SUMMARY_FILE"
echo "New output files: ${STAGED_COUNT}" >> "$SUMMARY_FILE"
echo "" >> "$SUMMARY_FILE"

echo "$STAGED" | while IFS= read -r f; do
  overall=$(jq -r '.overall_severity // "unknown"' "$f" 2>/dev/null || echo "parse_error")
  consequence=$(jq -r '.security_spec.security_consequence // "N/A"' "$f" 2>/dev/null || echo "N/A")
  spec=$(echo "$f" | cut -d'/' -f2)
  pr=$(echo "$f" | cut -d'/' -f3)
  target=$(basename "$f" .json)
  echo "[$overall] $spec / $pr / $target → $consequence" >> "$SUMMARY_FILE"
done

# ---- 步骤 3: 调用 Claude 分析并生成报告 ----
echo "=== Step 3: Claude analysis ==="

claude -p "$(cat <<PROMPT
你是 specHunter 扫描器的每日分析员。specHunter 对 RISC-V ISA 规范 PR 进行安全扫描，检查各开源实现（Linux、QEMU、OpenSBI、FreeBSD、XiangShan）是否符合规范的安全要求。

## 任务

1. 阅读 /tmp/spechunter-summary-${TODAY}.txt 了解今天新扫出的文件
2. 对于标记为 "bug_confirmed" 或 "potential_risk" 的条目，读取对应的 JSON 文件以理解细节
3. 生成报告写入 ${REPORT_FILE}

## 报告格式（中文）

\`\`\`markdown
# 每日扫描报告 — ${TODAY}

## 概览
| 严重程度 | 数量 |
|----------|------|
| bug_confirmed | N |
| potential_risk | N |
| compliant | N |

## 确认 Bug（bug_confirmed）
对每个 bug:
- **Spec / PR / Target**: 哪个规范、哪个 PR、哪个项目
- **后果**: info_leak / privilege_escape / denial_of_service / function_loss
- **描述**: 2-3 句中简述问题

## 潜在风险（potential_risk）
同上

## 值得关注的跨 spec 模式
如果今天有多个 PR 涉及同一类硬件机制（CSR 访问控制、计时器、调试安全等），在此标注。
\`\`\`

## 重要约束
- 只写入 ${REPORT_FILE}，不要修改其他文件
- 用中文写，技术术语保留英文
- 报告简洁，作为早上快速浏览用
- ${STAGED_COUNT} 个新文件中只挑 bug_confirmed 和 potential_risk 的深入分析，compliant 的仅统计不计入详细分析
PROMPT
)" --model sonnet --output-format text --dangerously-skip-permissions

echo "=== Complete ==="
echo "Report: $REPORT_FILE"
