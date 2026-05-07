#!/bin/bash
# ============================================================================
# Fetch a specific issue from a RISC-V spec repository.
#
# Usage:
#   ./fetch_issue.sh riscv-isa-manual 1234
#   export GITHUB_TOKEN="ghp_xxx" && ./fetch_issue.sh riscv-isa-manual 1234
#
# Resume: safe to re-run. Already-fetched issues are auto-skipped.
# ============================================================================
set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE="${BASE:-$SCRIPT_DIR/../spec}"
GITHUB_API="https://api.github.com"

# ── Auth ──────────────────────────────────────────────────────────────────
if [ -n "${GITHUB_TOKEN:-}" ]; then
    AUTH=(-H "Authorization: Bearer $GITHUB_TOKEN")
    RATE_LIMIT=5000
else
    AUTH=()
    RATE_LIMIT=55
    echo "══════════════════════════════════════════════════════════════"
    echo "  No GITHUB_TOKEN set — rate limit is 60 requests/hour"
    echo "  With a token: 5000 req/hr. Create one at:"
    echo "  https://github.com/settings/tokens → classic → public_repo"
    echo "  Then: export GITHUB_TOKEN=ghp_xxx && ..."
    echo "══════════════════════════════════════════════════════════════"
    echo ""
fi

# ── Rate-limit lock file ─────────────────────────────────────────────────
RL_LOCK="/tmp/rv_isa_rl.lock"
RL_STATE="/tmp/rv_isa_rl.state"

init_rate_state() {
    if [ ! -f "$RL_STATE" ]; then
        echo "$RATE_LIMIT 0" > "$RL_STATE"
    fi
}

rate_acquire() {
    while true; do
        (
            flock -x 200
            read -r remaining reset_ts < "$RL_STATE" 2>/dev/null || { echo "1000 0" > "$RL_STATE"; remaining=1000; reset_ts=0; }
            local now=$(date +%s)
            if [ "$remaining" -lt 3 ] 2>/dev/null; then
                local wait=$((reset_ts - now + 5))
                if [ "$wait" -gt 0 ] && [ "$wait" -lt 3600 ]; then
                    local reset_time=$(date -d "@$reset_ts" '+%H:%M:%S' 2>/dev/null || echo "@$reset_ts")
                    echo "[$$] rate limit: ${remaining}/${RATE_LIMIT} left, sleeping ${wait}s (reset $reset_time)" >&2
                    echo "$remaining $reset_ts" > "$RL_STATE"
                    flock -u 200
                    sleep "$wait"
                    continue
                fi
            fi
            if [ "$((now % 30))" -eq 0 ] 2>/dev/null || [ "$remaining" -lt 10 ] 2>/dev/null; then
                local headers
                headers=$(curl -sI "${AUTH[@]}" "$GITHUB_API/rate_limit" 2>/dev/null || true)
                local actual_rem actual_reset
                actual_rem=$(echo "$headers" | grep -i "x-ratelimit-remaining:" | awk '{print $2}' | tr -d '\r')
                actual_reset=$(echo "$headers" | grep -i "x-ratelimit-reset:" | awk '{print $2}' | tr -d '\r')
                if [ -n "$actual_rem" ]; then
                    remaining=$actual_rem
                    reset_ts=$actual_reset
                fi
            fi
            remaining=$((remaining - 1))
            echo "$remaining $reset_ts" > "$RL_STATE"
            flock -u 200
        ) 200>"$RL_LOCK"
        return 0
    done
}

api_get() {
    local url="$1" accept="${2:-application/vnd.github.v3+json}"
    rate_acquire
    local tmpfile="/tmp/rv_isa_resp_${RANDOM}_${BASHPID:-$$}.json"
    local http_code
    http_code=$(curl -s -o "$tmpfile" -w '%{http_code}' "${AUTH[@]}" -H "Accept: $accept" "$url")
    if [ "$http_code" = "403" ] || [ "$http_code" = "429" ]; then
        (
            flock -x 200
            echo "0 $(date +%s)" > "$RL_STATE"
        ) 200>"$RL_LOCK"
        echo "   ! HTTP $http_code on $url" >&2
        jq -r '.message // "no message"' "$tmpfile" 2>/dev/null
        rm -f "$tmpfile"
        return 1
    fi
    cat "$tmpfile"
    rm -f "$tmpfile"
}

# ── Skip detection ───────────────────────────────────────────────────────
REQUIRED_FILES=(metadata.json body.md comments.json labels.txt)

is_issue_done() {
    local issue_dir="$1"
    for f in "${REQUIRED_FILES[@]}"; do
        if [ ! -f "$issue_dir/$f" ]; then
            return 1
        fi
    done
    return 0
}

# ── Fetch issue ──────────────────────────────────────────────────────────

fetch_issue_detail() {
    local repo="$1" short="$2" issue_num="$3"
    local issue_dir="$BASE/$short/issue-$issue_num"
    mkdir -p "$issue_dir"

    if is_issue_done "$issue_dir"; then
        echo "  ✓ $short#issue-$issue_num: already fetched, skip"
        return 0
    fi

    rm -rf "$issue_dir" && mkdir -p "$issue_dir"

    # 1. Metadata
    if ! api_get "$GITHUB_API/repos/$repo/issues/$issue_num" > "$issue_dir/metadata.json" 2>/dev/null; then
        echo "   ✗ $short#issue-$issue_num: metadata fetch failed" >&2
        return 0
    fi

    local title state
    title=$(jq -r '.title // ""' "$issue_dir/metadata.json" 2>/dev/null || echo "?")
    state=$(jq -r '.state // "?"' "$issue_dir/metadata.json" 2>/dev/null || echo "?")
    local is_pr
    is_pr=$(jq -r '.pull_request // null' "$issue_dir/metadata.json" 2>/dev/null)
    local flag=" "
    [ "$state" = "open" ] && flag="O"
    [ "$state" = "closed" ] && flag="C"
    [ "$is_pr" != "null" ] && flag="⚠PR"

    echo "  $flag $short#issue-$issue_num: ${title:0:80} [$state]"

    # 2. Body
    jq -r '.body // ""' "$issue_dir/metadata.json" > "$issue_dir/body.md" 2>/dev/null || true

    # 3. Comments
    api_get "$GITHUB_API/repos/$repo/issues/$issue_num/comments?per_page=100" > "$issue_dir/comments.json" 2>/dev/null || true

    # 4. Labels
    jq -r '[.labels[].name] | join(",")' "$issue_dir/metadata.json" > "$issue_dir/labels.txt" 2>/dev/null || true
}

# ── Repo list (shared with fetch_all_prs.sh) ─────────────────────────────
declare -A REPO_MAP=(
    ["riscv-isa-manual"]="riscv/riscv-isa-manual"
    ["riscv-sbi-doc"]="riscv-non-isa/riscv-sbi-doc"
    ["riscv-elf-psabi-doc"]="riscv-non-isa/riscv-elf-psabi-doc"
    ["riscv-toolchain-conventions"]="riscv-non-isa/riscv-toolchain-conventions"
    ["riscv-uefi"]="riscv-non-isa/riscv-uefi"
    ["riscv-acpi-ffh"]="riscv-non-isa/riscv-acpi-ffh"
    ["riscv-acpi-rimt"]="riscv-non-isa/riscv-acpi-rimt"
    ["riscv-device-tree-doc"]="riscv-non-isa/riscv-device-tree-doc"
    ["riscv-aia"]="riscv/riscv-aia"
    ["riscv-plic-spec"]="riscv/riscv-plic-spec"
    ["riscv-fast-interrupt"]="riscv/riscv-fast-interrupt"
    ["riscv-smmtt"]="riscv/riscv-smmtt"
    ["riscv-svvptc"]="riscv/riscv-svvptc"
    ["riscv-iommu"]="riscv-non-isa/riscv-iommu"
    ["riscv-iopmp"]="riscv-non-isa/riscv-iopmp"
    ["riscv-memory-protection-hypervisor"]="riscv/riscv-memory-protection-hypervisor"
    ["riscv-security-model"]="riscv/riscv-security-model"
    ["riscv-cfi"]="riscv/riscv-cfi"
    ["riscv-cheri"]="riscv/riscv-cheri"
    ["riscv-spmp"]="riscv/riscv-spmp"
    ["riscv-memory-tagging"]="riscv/riscv-memory-tagging"
    ["riscv-spec-barrier"]="riscv/riscv-spec-barrier"
    ["riscv-ap-tee"]="riscv-non-isa/riscv-ap-tee"
    ["riscv-ap-tee-io"]="riscv-non-isa/riscv-ap-tee-io"
    ["riscv-high-assurance-cryptography"]="riscv/riscv-high-assurance-cryptography"
    ["riscv-crypto"]="riscv/riscv-crypto"
    ["riscv-pqc"]="riscv/riscv-pqc"
    ["riscv-server-platform"]="riscv-non-isa/riscv-server-platform"
    ["riscv-server-soc"]="riscv-non-isa/riscv-server-soc"
    ["riscv-rpmi"]="riscv-non-isa/riscv-rpmi"
    ["riscv-brs"]="riscv-non-isa/riscv-brs"
    ["riscv-profiles"]="riscv/riscv-profiles"
    ["riscv-smbios"]="riscv/riscv-smbios"
    ["riscv-debug-spec"]="riscv/riscv-debug-spec"
    ["riscv-trace-spec"]="riscv-non-isa/riscv-trace-spec"
    ["riscv-event-trace"]="riscv/riscv-event-trace"
    ["riscv-e-trace-encap"]="riscv-non-isa/riscv-e-trace-encap"
    ["riscv-nexus-trace"]="riscv-non-isa/riscv-nexus-trace"
    ["riscv-performance-events"]="riscv/riscv-performance-events"
    ["riscv-performance-event-sampling"]="riscv/riscv-performance-event-sampling"
    ["riscv-ssqosid"]="riscv/riscv-ssqosid"
    ["riscv-ssdtso"]="riscv/riscv-ssdtso"
    ["riscv-double-trap"]="riscv/riscv-double-trap"
    ["riscv-control-transfer-records"]="riscv/riscv-control-transfer-records"
    ["riscv-zabha"]="riscv/riscv-zabha"
    ["riscv-zalasr"]="riscv/riscv-zalasr"
    ["riscv-ssrastraps"]="riscv/riscv-ssrastraps"
    ["riscv-timing-fences"]="riscv/riscv-timing-fences"
    ["riscv-vme"]="riscv/riscv-vme"
    ["riscv-cbqri"]="riscv-non-isa/riscv-cbqri"
    ["riscv-swi"]="riscv-non-isa/riscv-swi"
    ["riscv-bfloat16"]="riscv/riscv-bfloat16"
    ["riscv-unified-db"]="riscv/riscv-unified-db"
    ["riscv-worlds"]="riscv/riscv-worlds"
    ["riscv-external-debug-security"]="riscv-non-isa/riscv-external-debug-security"
    ["ft-trigger-delegation"]="riscv/ft-trigger-delegation"
    ["self-hosted-trace"]="riscv/self-hosted-trace"
    ["sdtrigepm"]="riscv/sdtrigepm"
    ["sdtrigpend"]="riscv/sdtrigpend"
    ["riscv-hart-trace-interface"]="riscv-non-isa/riscv-hart-trace-interface"
    ["riscv-bitmanip"]="riscv/riscv-bitmanip"
    ["riscv-b"]="riscv/riscv-b"
    ["riscv-dot-product"]="riscv/riscv-dot-product"
    ["riscv-j-extension"]="riscv/riscv-j-extension"
    ["riscv-p-spec"]="riscv/riscv-p-spec"
    ["riscv-zaamo-zalrsc"]="riscv/riscv-zaamo-zalrsc"
    ["integer-vector-absolute-difference"]="riscv/integer-vector-absolute-difference"
    ["integrated-matrix-extension"]="riscv/integrated-matrix-extension"
    ["zibi"]="riscv/zibi"
    ["riscv-ras-eri"]="riscv-non-isa/riscv-ras-eri"
    ["riscv-rqsc"]="riscv-non-isa/riscv-rqsc"
    ["riscv-asm-manual"]="riscv-non-isa/riscv-asm-manual"
    ["riscv-semihosting"]="riscv-non-isa/riscv-semihosting"
)

# ── Main ──────────────────────────────────────────────────────────────────

if [ $# -lt 2 ]; then
    echo "ERROR: repo short name and issue number required." >&2
    echo "Usage: ./fetch_issue.sh <repo_short> <issue_number>" >&2
    echo "Example: ./fetch_issue.sh riscv-isa-manual 1234" >&2
    echo "" >&2
    echo "Known repo short names:" >&2
    for k in "${!REPO_MAP[@]}"; do echo "  $k -> ${REPO_MAP[$k]}" >&2; done
    exit 1
fi

short="$1"
issue_num="$2"
repo="${REPO_MAP[$short]:-}"
if [ -z "$repo" ]; then
    echo "ERROR: unknown repo short name: $short" >&2
    echo "Known repos:" >&2
    for k in "${!REPO_MAP[@]}"; do echo "  $k -> ${REPO_MAP[$k]}" >&2; done
    exit 1
fi

mkdir -p "$BASE"
init_rate_state

echo "══════════════════════════════════════════════════════════════"
echo "  RISC-V Spec Issue Fetcher (single issue)"
echo "  Started: $(date)"
echo "  Target:  $short (#${issue_num})"
echo "  Repo:    $repo"
echo "  Base:    $BASE"
echo "══════════════════════════════════════════════════════════════"
echo ""

# Append to manifest
issue_dir="$BASE/$short"
manifest="$issue_dir/issue_manifest.tsv"
mkdir -p "$issue_dir"
if [ ! -f "$manifest" ]; then
    echo -e "issue_number\ttitle\tstate\tclosed_at\tauthor\tcreated_at\tupdated_at\tlabels" > "$manifest"
fi

issue_json=$(api_get "$GITHUB_API/repos/$repo/issues/$issue_num" || true)
if [ -z "$issue_json" ] || [ "$(echo "$issue_json" | jq -r '.number // ""')" = "" ]; then
    echo "ERROR: issue $short#$issue_num not found (or rate limited)" >&2
    exit 1
fi

if ! grep -q "^$issue_num	" "$manifest" 2>/dev/null; then
    title=$(echo "$issue_json" | jq -r '.title')
    state=$(echo "$issue_json" | jq -r '.state')
    closed_at=$(echo "$issue_json" | jq -r '.closed_at // ""')
    author=$(echo "$issue_json" | jq -r '.user.login // ""')
    created=$(echo "$issue_json" | jq -r '.created_at')
    updated=$(echo "$issue_json" | jq -r '.updated_at')
    labels=$(echo "$issue_json" | jq -r '[.labels[].name] | join(";")')
    echo -e "$issue_num\t$title\t$state\t$closed_at\t$author\t$created\t$updated\t$labels" >> "$manifest"
fi

fetch_issue_detail "$repo" "$short" "$issue_num"

echo ""
echo "Done: $short#issue-$issue_num"
