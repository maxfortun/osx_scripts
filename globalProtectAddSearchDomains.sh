#!env bash
set -euo pipefail

KEY="State:/Network/Service/gpd.pan/DNS"

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 domain1 [domain2 ...]"
    exit 1
fi

# ---- extract existing domains safely (NO awk) ----
existing=$(
scutil <<EOF | sed -n '/SearchDomains : <array>/, /}/p' | \
grep -E '^[[:space:]]*[0-9]+ : ' | \
sed -E 's/^[[:space:]]*[0-9]+ : //'
show $KEY
quit
EOF
)

declare -A seen
combined=()

# existing
while IFS= read -r d; do
    [[ -z "$d" ]] && continue
    seen["$d"]=1
    combined+=("$d")
done <<< "$existing"

# new args
for d in "$@"; do
    if [[ -z "${seen[$d]:-}" ]]; then
        seen["$d"]=1
        combined+=("$d")
    fi
done

# ---- apply back atomically ----
{
    echo "get $KEY"
    echo "d.remove SearchDomains"

    echo "d.add SearchDomains * ${combined[*]}"

    echo "set $KEY"
    echo "quit"
} | sudo scutil
