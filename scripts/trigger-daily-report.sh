#!/usr/bin/env bash
set -euo pipefail

# 改时间: 编辑 ~/.config/systemd/user/daily-report-trigger.timer 的 OnCalendar=
#         每天 08:00 和 20:00 各触发一次
#         然后 systemctl --user daemon-reload && systemctl --user restart daily-report-trigger.timer
# token:  ~/.config/daily-report/gh-token
REPO="yizishun/rv-isa-sec"

if [ -z "${GITHUB_TOKEN:-}" ]; then
  echo "Error: GITHUB_TOKEN not set"
  echo "Usage: GITHUB_TOKEN='ghp_xxx' bash scripts/trigger-daily-report.sh"
  exit 1
fi

curl -s -L -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${GITHUB_TOKEN}" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/repos/${REPO}/actions/workflows/daily-report.yml/dispatches" \
  -d '{"ref":"master"}'

echo ""
echo "Workflow dispatch sent to ${REPO}"
