#!/bin/sh
set -eu

GITCONFIG_LOCAL="${HOME}/.gitconfig.local"

if [ ! -f "$GITCONFIG_LOCAL" ]; then
  echo "Missing $GITCONFIG_LOCAL. Create it with [user] name/email before running this script."
  exit 1
fi

if command -v git >/dev/null 2>&1; then
  GIT_NAME="$(git config --file "$GITCONFIG_LOCAL" user.name || true)"
  GIT_EMAIL="$(git config --file "$GITCONFIG_LOCAL" user.email || true)"
else
  GIT_NAME="$(awk -F= '/^[[:space:]]*name[[:space:]]*=/ {gsub(/^[[:space:]]+|[[:space:]]+$/, "", $2); print $2; exit}' "$GITCONFIG_LOCAL")"
  GIT_EMAIL="$(awk -F= '/^[[:space:]]*email[[:space:]]*=/ {gsub(/^[[:space:]]+|[[:space:]]+$/, "", $2); print $2; exit}' "$GITCONFIG_LOCAL")"
fi

if [ -z "$GIT_NAME" ] || [ -z "$GIT_EMAIL" ]; then
  echo "Missing user.name or user.email in $GITCONFIG_LOCAL."
  exit 1
fi

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/bashrc.d ~/.bashrc.d
ln -sf ~/dotfiles/.fzf.bash ~/.fzf.bash
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/gemini/settings.json ~/.gemini/settings.json
ln -sf ~/dotfiles/codex/config.toml ~/.codex/config.toml
