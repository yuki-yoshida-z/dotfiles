#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
GITCONFIG_LOCAL_SRC="$DOTFILES_DIR/.gitconfig.local"
BASHRC_LOCAL_SRC="$DOTFILES_DIR/.bashrc.local"
BREWFILE_LOCAL="$DOTFILES_DIR/.Brewfile.local"

if [ -f "$GITCONFIG_LOCAL_SRC" ]; then
  echo "$GITCONFIG_LOCAL_SRC already exists. Skipping creation."
else
  cp "$DOTFILES_DIR/.gitconfig.local.example" "$GITCONFIG_LOCAL_SRC"
  echo "Created $GITCONFIG_LOCAL_SRC from .gitconfig.local.example"
  echo ""
  echo "Please edit $GITCONFIG_LOCAL_SRC and set your name and email:"
  echo "  - user.name"
  echo "  - user.email"
  echo ""
  echo "After editing, run: make init"
fi

if [ -f "$BASHRC_LOCAL_SRC" ]; then
  echo "$BASHRC_LOCAL_SRC already exists. Skipping creation."
else
  cp "$DOTFILES_DIR/bashrc.local.example" "$BASHRC_LOCAL_SRC"
  echo "Created $BASHRC_LOCAL_SRC from bashrc.local.example"
fi

if [ -f "$BREWFILE_LOCAL" ]; then
  echo "$BREWFILE_LOCAL already exists. Skipping creation."
else
  printf "# Local-only Homebrew packages\n" > "$BREWFILE_LOCAL"
  echo "Created $BREWFILE_LOCAL"
fi
