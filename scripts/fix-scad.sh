#!/usr/bin/env bash
# fixes basic whitespace hygiene in .scad files: strips trailing
# whitespace and ensures each file ends with exactly one newline.
# with no args, fixes every .scad file in the repo except terceros/;
# with args, fixes only the given files (used by the pre-commit hook).
set -euo pipefail

fix_file() {
  local file="$1"
  local tmp
  tmp="$(mktemp)"
  sed -E 's/[ \t]+$//' "$file" > "$tmp"
  printf '%s\n' "$(cat "$tmp")" > "$file"
  rm -f "$tmp"
}

if [ "$#" -gt 0 ]; then
  for file in "$@"; do
    fix_file "$file"
  done
else
  while IFS= read -r -d '' file; do
    fix_file "$file"
  done < <(find . -path ./terceros -prune -o -iname "*.scad" -print0)
fi
