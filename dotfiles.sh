#!/bin/sh
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
if [ -f ~/dotfiles/.bash_profile.local ]; then
  ln -sf ~/dotfiles/.bash_profile.local ~/.bash_profile.local
fi
ln -sf ~/dotfiles/.bashrc ~/.bashrc
if [ -f ~/dotfiles/.bashrc.local ]; then
  ln -sf ~/dotfiles/.bashrc.local ~/.bashrc.local
fi
ln -sf ~/dotfiles/.fzf.bash ~/.fzf.bash
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
if [ -f ~/dotfiles/.gitconfig.local ]; then
  ln -sf ~/dotfiles/.gitconfig.local ~/.gitconfig.local
fi
ln -sf ~/dotfiles/nvim ~/.config/nvim
if [ -f ~/dotfiles/gemini/settings.json.local ]; then
  mkdir -p ~/.gemini
  cat ~/dotfiles/gemini/settings.json ~/dotfiles/gemini/settings.json.local > ~/.gemini/settings.json
else
  mkdir -p ~/.gemini
  ln -sf ~/dotfiles/gemini/settings.json ~/.gemini/settings.json
fi
if [ -f ~/dotfiles/codex/config.toml.local ]; then
  mkdir -p ~/.codex
  cat ~/dotfiles/codex/config.toml ~/dotfiles/codex/config.toml.local > ~/.codex/config.toml
else
  mkdir -p ~/.codex
  ln -sf ~/dotfiles/codex/config.toml ~/.codex/config.toml
fi
if [ -f ~/dotfiles/claude/settings.json.local ]; then
  mkdir -p ~/.claude
  cat ~/dotfiles/claude/settings.json ~/dotfiles/claude/settings.json.local > ~/.claude/settings.json
else
  mkdir -p ~/.claude
  ln -sf ~/dotfiles/claude/settings.json ~/.claude/settings.json
fi
