#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BREWFILE_SHARED="$DOTFILES_DIR/Brewfile"
BREWFILE_LOCAL="$DOTFILES_DIR/.Brewfile.local"
BREWFILE_TMP="$DOTFILES_DIR/.Brewfile.tmp"
EXPECTED_TMP="$DOTFILES_DIR/.Brewfile.expected.tmp"
ACTUAL_TMP="$DOTFILES_DIR/.Brewfile.actual.tmp"
ALLOWED_RE='^(brew|cask|tap|go) "'

cleanup() {
  rm -f "$BREWFILE_TMP" "$EXPECTED_TMP" "$ACTUAL_TMP"
}
trap cleanup EXIT

if ! command -v brew >/dev/null 2>&1; then
  echo "Error: brew is not installed."
  exit 1
fi

brew bundle dump --file "$BREWFILE_TMP" --force >/dev/null

extract_entries() {
  grep -E "$ALLOWED_RE" "$1" 2>/dev/null || true
}

check_unsupported_entries() {
  local file="$1"
  if [ ! -f "$file" ]; then
    return 0
  fi
  local unsupported
  unsupported="$(grep -E '^[a-zA-Z0-9_-]+ "' "$file" | grep -Ev "$ALLOWED_RE" || true)"
  if [ -n "$unsupported" ]; then
    echo "Error: Unsupported Brewfile entries found in $file"
    echo "$unsupported"
    echo "Allowed types: brew, cask, tap, go"
    exit 1
  fi
}

check_unsupported_entries "$BREWFILE_SHARED"
check_unsupported_entries "$BREWFILE_LOCAL"

{
  extract_entries "$BREWFILE_SHARED"
  if [ -f "$BREWFILE_LOCAL" ]; then
    extract_entries "$BREWFILE_LOCAL"
  fi
} | sort -u > "$EXPECTED_TMP"

extract_entries "$BREWFILE_TMP" | sort -u > "$ACTUAL_TMP"

if diff -u "$EXPECTED_TMP" "$ACTUAL_TMP"; then
  echo "OK: Brewfile and .Brewfile.local match the current brew state."
else
  echo "Mismatch: Brewfile/.Brewfile.local differ from current brew state."
  echo "Hint: Update Brewfile/.Brewfile.local or reinstall packages to reconcile."
  exit 1
fi
