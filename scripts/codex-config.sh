#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
GLOBAL_CONFIG="$DOTFILES_DIR/codex/config.global.toml"
TARGET_DIR="$HOME/.codex"
TARGET_CONFIG="$TARGET_DIR/config.toml"

if [ -f "$TARGET_CONFIG" ]; then
  echo "Skip: $TARGET_CONFIG already exists."
  echo "Please edit it manually if you need changes."
  exit 0
fi

mkdir -p "$TARGET_DIR"
cp "$GLOBAL_CONFIG" "$TARGET_CONFIG"
echo "Created $TARGET_CONFIG from $GLOBAL_CONFIG"
