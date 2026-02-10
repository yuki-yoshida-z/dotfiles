#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BREWFILE_SHARED="$DOTFILES_DIR/Brewfile"
BREWFILE_LOCAL="$DOTFILES_DIR/.Brewfile.local"
BREWFILE_TMP="$DOTFILES_DIR/.Brewfile.tmp"
EXPECTED_TMP="$DOTFILES_DIR/.Brewfile.expected.tmp"
ACTUAL_TMP="$DOTFILES_DIR/.Brewfile.actual.tmp"

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
  grep -E '^(brew|cask|tap) "' "$1" 2>/dev/null || true
}

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
