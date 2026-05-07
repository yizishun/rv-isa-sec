#!/bin/bash
# ============================================================================
# Fetch ALL RISC-V spec PRs (open + closed + merged) from the past 6 months.
#
# Usage:
#   ./fetch_all_prs.sh                          # default: 4 parallel workers
#   PARALLEL=8 ./fetch_all_prs.sh               # 8 parallel workers
#   PARALLEL=1 ./fetch_all_prs.sh               # sequential (no parallelism)
#   METADATA_ONLY=1 ./fetch_all_prs.sh          # skip PR details (metadata only)
#   export GITHUB_TOKEN="ghp_xxx" && ./fetch_all_prs.sh  # with token (5000 req/hr)
#
# Single PR mode:
#   ./fetch_all_prs.sh riscv-isa-manual 1234
#
# Resume: safe to re-run. Already-fetched PRs are auto-skipped.
# ============================================================================
set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
BASE="${BASE:-$SCRIPT_DIR/../spec}"
SINCE="${SINCE:-2025-10-28T00:00:00Z}"
GITHUB_API="https://api.github.com"
PARALLEL="${PARALLEL:-4}"

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
    echo "  Then: export GITHUB_TOKEN=ghp_xxx && ./fetch_all_prs.sh"
    echo "══════════════════════════════════════════════════════════════"
    echo ""
fi

# ── Rate-limit lock file (shared across workers) ─────────────────────────
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
            # Check actual rate limit from API periodically
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
    if [ "$http_code" != "200" ]; then
        if [ "$http_code" = "403" ] || [ "$http_code" = "429" ]; then
            (
                flock -x 200
                echo "0 $(date +%s)" > "$RL_STATE"
            ) 200>"$RL_LOCK"
        fi
        echo "   ! HTTP $http_code on $url" >&2
        rm -f "$tmpfile"
        return 1
    fi
    cat "$tmpfile"
    rm -f "$tmpfile"
}

api_get_file() {
    local url="$1" out="$2"
    rate_acquire
    local tmpfile="${out}.tmp"
    local http_code
    http_code=$(curl -s -w '%{http_code}' "${AUTH[@]}" -H "Accept: application/vnd.github.v3.diff" "$url" -o "$tmpfile")
    if [ "$http_code" != "200" ]; then
        echo "   ! HTTP $http_code on $url" >&2
        rm -f "$tmpfile"
        return 1
    fi
    mv "$tmpfile" "$out"
}

# ── Skip detection ───────────────────────────────────────────────────────
REQUIRED_FILES=(metadata.json body.md diff.patch files.json comments.json reviews.json commits.json labels.txt)

is_pr_done() {
    local pr_dir="$1"
    for f in "${REQUIRED_FILES[@]}"; do
        if [ ! -f "$pr_dir/$f" ]; then
            return 1
        fi
    done
    return 0
}

# ── Per-PR fetch ──────────────────────────────────────────────────────────

fetch_pr_detail() {
    local repo="$1" short="$2" pr_num="$3"
    local pr_dir="$BASE/$short/pr-$pr_num"
    mkdir -p "$pr_dir"

    if is_pr_done "$pr_dir"; then
        echo "  ✓ $short#$pr_num: already fetched, skip" >&2
        return 0
    fi

    # Remove any partial state
    rm -rf "$pr_dir" && mkdir -p "$pr_dir"

    # 1. Metadata — write to tmp, validate as JSON object, then rename
    local meta_tmp="$pr_dir/.metadata.json.tmp"
    if ! api_get "$GITHUB_API/repos/$repo/pulls/$pr_num" > "$meta_tmp" 2>/dev/null; then
        echo "   ✗ $short#$pr_num: metadata fetch failed" >&2
        rm -f "$meta_tmp"
        return 0
    fi
    if ! jq -e 'type == "object"' "$meta_tmp" > /dev/null 2>&1; then
        echo "   ✗ $short#$pr_num: metadata not a JSON object" >&2
        rm -f "$meta_tmp"
        return 0
    fi
    mv "$meta_tmp" "$pr_dir/metadata.json"

    local title state merged
    title=$(jq -r '.title // ""' "$pr_dir/metadata.json" 2>/dev/null || echo "?")
    state=$(jq -r '.state // "?"' "$pr_dir/metadata.json" 2>/dev/null || echo "?")
    merged=$(jq -r '.merged_at // ""' "$pr_dir/metadata.json" 2>/dev/null || echo "")
    local flag=" "
    [ "$merged" != "null" ] && [ -n "$merged" ] && flag="M"
    [ "$state" = "open" ] && flag="O"
    echo "  $flag $short#$pr_num: ${title:0:80} [$state]"

    # 2. Body
    jq -r '.body // ""' "$pr_dir/metadata.json" > "$pr_dir/body.md" 2>/dev/null || true

    # 3. Diff
    api_get_file "$GITHUB_API/repos/$repo/pulls/$pr_num" "$pr_dir/diff.patch" || true

    # 4. Files changed
    api_get "$GITHUB_API/repos/$repo/pulls/$pr_num/files?per_page=100" > "$pr_dir/files.json" 2>/dev/null || true

    # 5. Review comments
    api_get "$GITHUB_API/repos/$repo/pulls/$pr_num/comments?per_page=100" > "$pr_dir/comments.json" 2>/dev/null || true

    # 6. Reviews
    api_get "$GITHUB_API/repos/$repo/pulls/$pr_num/reviews?per_page=100" > "$pr_dir/reviews.json" 2>/dev/null || true

    # 7. Commits
    api_get "$GITHUB_API/repos/$repo/pulls/$pr_num/commits?per_page=100" > "$pr_dir/commits.json" 2>/dev/null || true

    # 8. Labels
    jq -r '[.labels[].name] | join(",")' "$pr_dir/metadata.json" > "$pr_dir/labels.txt" 2>/dev/null || true
}

# ── Per-repo fetch ────────────────────────────────────────────────────────

fetch_repo() {
    local short="$1" repo="$2"

    local repo_dir="$BASE/$short"
    mkdir -p "$repo_dir"

    local manifest="$repo_dir/manifest.tsv"
    if [ ! -f "$manifest" ]; then
        echo -e "pr_number\ttitle\tstate\tmerged_at\tauthor\tcreated_at\tupdated_at\tlabels" > "$manifest"
    fi

    echo "" >&2
    echo "══ $short ══" >&2
    echo "   repo: $repo" >&2

    local pr_page=1 pr_in_window=0

    while [ "$pr_page" -le 10 ]; do
        local prs
        prs=$(api_get "$GITHUB_API/repos/$repo/pulls?state=all&sort=updated&direction=desc&per_page=100&page=$pr_page" || true)

        local count
        count=$(echo "$prs" | jq 'length' 2>/dev/null || echo "0")
        if [ "$count" = "0" ] || [ -z "$count" ]; then
            break
        fi

        local earliest in_window=false
        earliest=$(echo "$prs" | jq -r '.[-1].updated_at // ""')

        while IFS= read -r pr_json; do
            [ -z "$pr_json" ] && continue
            local pr_num updated title state merged_at author created labels
            pr_num=$(echo "$pr_json" | jq -r '.number')
            updated=$(echo "$pr_json" | jq -r '.updated_at')
            title=$(echo "$pr_json" | jq -r '.title')
            state=$(echo "$pr_json" | jq -r '.state')
            merged_at=$(echo "$pr_json" | jq -r '.merged_at // ""')
            author=$(echo "$pr_json" | jq -r '.user.login // ""')
            created=$(echo "$pr_json" | jq -r '.created_at')
            labels=$(echo "$pr_json" | jq -r '[.labels[].name] | join(";")')

            # Append to manifest (dedup by checking if pr_number already present)
            if ! grep -q "^$pr_num	" "$manifest" 2>/dev/null; then
                echo -e "$pr_num\t$title\t$state\t$merged_at\t$author\t$created\t$updated\t$labels" >> "$manifest"
            fi

            # Deep-fetch PRs updated/created since SINCE
            if [[ "$updated" > "$SINCE" ]] || [[ "$created" > "$SINCE" ]]; then
                in_window=true
                pr_in_window=$((pr_in_window + 1))

                if [ "${METADATA_ONLY:-0}" != "1" ]; then
                    fetch_pr_detail "$repo" "$short" "$pr_num"
                else
                    echo "  #$pr_num: ${title:0:80} [$state]" >&2
                fi
            fi
        done < <(echo "$prs" | jq -c '.[]')

        # Stop if we've gone past the window
        if [[ "$earliest" < "$SINCE" ]] && [ "$in_window" != "true" ]; then
            break
        fi
        if [ "$count" -lt 100 ]; then
            break
        fi

        pr_page=$((pr_page + 1))
    done

    echo "   📊 $short: $pr_in_window PRs in window" >&2
    echo "$pr_in_window" > "$repo_dir/.pr_count"
}

# ── Repo list ─────────────────────────────────────────────────────────────
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
    # ── Newly added (2025-04-29) ──
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

PRIORITY=(
    "riscv-isa-manual" "riscv-sbi-doc" "riscv-aia" "riscv-plic-spec"
    "riscv-iommu" "riscv-smmtt" "riscv-svvptc" "riscv-security-model"
    "riscv-cfi" "riscv-cheri" "riscv-spmp" "riscv-memory-tagging"
    "riscv-spec-barrier" "riscv-fast-interrupt" "riscv-brs" "riscv-rpmi"
    "riscv-iopmp" "riscv-toolchain-conventions" "riscv-elf-psabi-doc"
    "riscv-acpi-ffh" "riscv-acpi-rimt" "riscv-performance-events"
    "riscv-debug-spec" "riscv-server-soc" "riscv-server-platform"
    "riscv-uefi" "riscv-profiles" "riscv-double-trap" "riscv-ap-tee"
    "riscv-ap-tee-io" "riscv-event-trace" "riscv-trace-spec"
    "riscv-e-trace-encap" "riscv-cbqri" "riscv-high-assurance-cryptography"
    "riscv-ssqosid" "riscv-ssdtso" "riscv-vme" "riscv-zalasr"
    "riscv-ssrastraps" "riscv-memory-protection-hypervisor"
    "riscv-timing-fences" "riscv-control-transfer-records" "riscv-zabha"
    "riscv-crypto" "riscv-bfloat16" "riscv-pqc" "riscv-swi" "riscv-smbios"
    "riscv-device-tree-doc" "riscv-performance-event-sampling"
    "riscv-nexus-trace" "riscv-unified-db"
    # ── Newly added (2025-04-29) ──
    "riscv-worlds" "riscv-external-debug-security" "riscv-ras-eri"
    "riscv-asm-manual" "riscv-semihosting" "riscv-rqsc"
    "ft-trigger-delegation" "self-hosted-trace" "sdtrigepm" "sdtrigpend"
    "riscv-hart-trace-interface" "riscv-bitmanip" "riscv-b"
    "riscv-dot-product" "riscv-j-extension" "riscv-p-spec"
    "riscv-zaamo-zalrsc" "integer-vector-absolute-difference"
    "integrated-matrix-extension" "zibi"
)

# ── Main ──────────────────────────────────────────────────────────────────

echo "══════════════════════════════════════════════════════════════"
echo "  RISC-V Spec PR Fetcher"
echo "  Started: $(date)"
echo "  Window:  $SINCE → now"
echo "  Base:    $BASE"
echo "  Rate:    $RATE_LIMIT req/hr"
echo "  Workers: $PARALLEL"
echo "  Mode:    ${METADATA_ONLY:+metadata only}${METADATA_ONLY:-full detail}"
echo "══════════════════════════════════════════════════════════════"
echo ""

mkdir -p "$BASE"
init_rate_state

# Export functions and vars so subshells can use them
export -f api_get api_get_file fetch_pr_detail fetch_repo rate_acquire is_pr_done
export BASE SINCE GITHUB_API AUTH RATE_LIMIT RL_LOCK RL_STATE METADATA_ONLY

# ── Single-PR mode ──────────────────────────────────────────────────────────
if [ $# -ge 2 ]; then
    short="$1"
    pr_num="$2"
    repo="${REPO_MAP[$short]:-}"
    if [ -z "$repo" ]; then
        echo "ERROR: unknown repo short name: $short" >&2
        echo "Known repos:" >&2
        for k in "${!REPO_MAP[@]}"; do echo "  $k -> ${REPO_MAP[$k]}" >&2; done
        exit 1
    fi

    echo "══ Single PR mode: $short (#$pr_num) ══"
    echo "   repo: $repo" >&2

    # Append to manifest if not present
    manifest="$BASE/$short/manifest.tsv"
    mkdir -p "$BASE/$short"
    if [ ! -f "$manifest" ]; then
        echo -e "pr_number\ttitle\tstate\tmerged_at\tauthor\tcreated_at\tupdated_at\tlabels" > "$manifest"
    fi

    pr_json=$(api_get "$GITHUB_API/repos/$repo/pulls/$pr_num" || true)
    if [ -z "$pr_json" ] || [ "$(echo "$pr_json" | jq -r '.number // ""')" = "" ]; then
        echo "ERROR: PR $short#$pr_num not found (or rate limited)" >&2
        exit 1
    fi

    if ! grep -q "^$pr_num	" "$manifest" 2>/dev/null; then
        title=$(echo "$pr_json" | jq -r '.title')
        state=$(echo "$pr_json" | jq -r '.state')
        merged_at=$(echo "$pr_json" | jq -r '.merged_at // ""')
        author=$(echo "$pr_json" | jq -r '.user.login // ""')
        created=$(echo "$pr_json" | jq -r '.created_at')
        updated=$(echo "$pr_json" | jq -r '.updated_at')
        labels=$(echo "$pr_json" | jq -r '[.labels[].name] | join(";")')
        echo -e "$pr_num\t$title\t$state\t$merged_at\t$author\t$created\t$updated\t$labels" >> "$manifest"
    fi

    fetch_pr_detail "$repo" "$short" "$pr_num"
    echo ""
    echo "Done: $short#$pr_num"
    exit 0
fi

GLOBAL_MANIFEST="$BASE/_MANIFEST.tsv"
echo -e "repo\tpr_number\ttitle\tstate\tmerged_at\tauthor\tcreated_at\tupdated_at\tlabels" > "$GLOBAL_MANIFEST"

TOTAL=0
running=0
declare -A pids=()

for short in "${PRIORITY[@]}"; do
    repo="${REPO_MAP[$short]:-}"
    if [ -z "$repo" ]; then
        echo "⚠  Unknown repo: $short — skipping" >&2
        continue
    fi

    # Wait if we're at worker limit
    while [ "$running" -ge "$PARALLEL" ]; do
        for s in "${!pids[@]}"; do
            if ! kill -0 "${pids[$s]}" 2>/dev/null; then
                wait "${pids[$s]}" 2>/dev/null || true
                unset pids["$s"]
                running=$((running - 1))
            fi
        done
        if [ "$running" -ge "$PARALLEL" ]; then
            sleep 1
        fi
    done

    echo "→ Starting worker for $short" >&2
    fetch_repo "$short" "$repo" &
    pids["$short"]=$!
    running=$((running + 1))
done

# Wait for all remaining workers
for short in "${!pids[@]}"; do
    echo "→ Waiting for $short (pid ${pids[$short]})..." >&2
    wait "${pids[$short]}" 2>/dev/null || true
done

# Build global manifest from individual manifests
for short in "${PRIORITY[@]}"; do
    manifest="$BASE/$short/manifest.tsv"
    if [ -f "$manifest" ]; then
        tail -n +2 "$manifest" 2>/dev/null | while IFS=$'\t' read -r pr_num title state merged_at author created updated labels; do
            echo -e "$short\t$pr_num\t$title\t$state\t$merged_at\t$author\t$created\t$updated\t$labels" >> "$GLOBAL_MANIFEST"
        done
        local_cnt=$(cat "$BASE/$short/.pr_count" 2>/dev/null || echo "0")
        TOTAL=$((TOTAL + local_cnt))
    fi
done

echo ""
echo "══════════════════════════════════════════════════════════════"
echo "  Done at: $(date)"
echo "  PRs in window: $TOTAL (across all repos)"
echo "  Global manifest: $GLOBAL_MANIFEST"
echo "══════════════════════════════════════════════════════════════"
