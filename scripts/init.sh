#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
GITCONFIG_LOCAL_SRC="$DOTFILES_DIR/.gitconfig.local"
GITCONFIG_LOCAL="$HOME/.gitconfig.local"

if [ ! -f "$GITCONFIG_LOCAL_SRC" ]; then
  echo "Error: $GITCONFIG_LOCAL_SRC does not exist."
  echo "Please run 'make local-setup' first."
  exit 1
fi

USER_NAME="$(git config --file "$GITCONFIG_LOCAL_SRC" user.name || true)"
USER_EMAIL="$(git config --file "$GITCONFIG_LOCAL_SRC" user.email || true)"
if [ -z "$USER_NAME" ] || [ -z "$USER_EMAIL" ]; then
  echo "Error: user.name or user.email is not set in $GITCONFIG_LOCAL_SRC"
  echo "Please edit $GITCONFIG_LOCAL_SRC and set:"
  echo "  - user.name"
  echo "  - user.email"
  exit 1
fi

echo "Setting up dotfiles..."
ln -sf "$DOTFILES_DIR/.bash_profile" "$HOME/.bash_profile"
ln -sf "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
if [ -d "$HOME/.bashrc.d" ] && [ ! -L "$HOME/.bashrc.d" ]; then
  mv "$HOME/.bashrc.d" "$HOME/.bashrc.d.bak"
  echo "Moved existing $HOME/.bashrc.d to $HOME/.bashrc.d.bak"
fi
ln -sfn "$DOTFILES_DIR/bashrc.d" "$HOME/.bashrc.d"
ln -sf "$DOTFILES_DIR/.fzf.bash" "$HOME/.fzf.bash"
ln -sf "$DOTFILES_DIR/.bashrc.local" "$HOME/.bashrc.local"
ln -sf "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
ln -sf "$GITCONFIG_LOCAL_SRC" "$GITCONFIG_LOCAL"
mkdir -p "$HOME/.config"
if [ -d "$HOME/.config/nvim" ] && [ ! -L "$HOME/.config/nvim" ]; then
  mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak"
  echo "Moved existing $HOME/.config/nvim to $HOME/.config/nvim.bak"
fi
ln -sfn "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

echo "Dotfiles setup complete!"
