#!/usr/bin/env bash
# checks basic whitespace hygiene in .scad files: no tabs, no trailing
# whitespace, file ends with exactly one newline. skips terceros/,
# which has its own checks.
set -uo pipefail

status=0

tab=$(printf '\t')

while IFS= read -r -d '' file; do
  if grep -qF "$tab" "$file"; then
    echo "$file: contains tabs"
    status=1
  fi

  if grep -qE ' +$' "$file"; then
    echo "$file: has trailing whitespace"
    status=1
  fi

  if [ -s "$file" ] && [ -n "$(tail -c1 "$file")" ]; then
    echo "$file: missing final newline"
    status=1
  fi
done < <(find . -path ./terceros -prune -o -iname "*.scad" -print0)

exit $status
