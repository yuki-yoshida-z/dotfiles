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
  python - <<'PY'
import json
from pathlib import Path

def deep_merge(base, override):
    if isinstance(base, dict) and isinstance(override, dict):
        merged = dict(base)
        for key, value in override.items():
            merged[key] = deep_merge(merged.get(key), value)
        return merged
    return override

base_path = Path.home() / "dotfiles" / "gemini" / "settings.json"
local_path = Path.home() / "dotfiles" / "gemini" / "settings.json.local"
target_path = Path.home() / ".gemini" / "settings.json"

with base_path.open() as base_file:
    base_data = json.load(base_file)
with local_path.open() as local_file:
    local_data = json.load(local_file)

merged = deep_merge(base_data, local_data)
target_path.write_text(json.dumps(merged, indent=2, ensure_ascii=False) + "\n")
PY
else
  mkdir -p ~/.gemini
  ln -sf ~/dotfiles/gemini/settings.json ~/.gemini/settings.json
fi
if [ -f ~/dotfiles/codex/config.toml.local ]; then
  mkdir -p ~/.codex
  python - <<'PY'
from pathlib import Path
import tomllib

def deep_merge(base, override):
    if isinstance(base, dict) and isinstance(override, dict):
        merged = dict(base)
        for key, value in override.items():
            merged[key] = deep_merge(merged.get(key), value)
        return merged
    return override

def dump_toml(data):
    try:
        import tomli_w

        return tomli_w.dumps(data)
    except ModuleNotFoundError:
        try:
            import toml

            return toml.dumps(data)
        except ModuleNotFoundError as exc:
            raise SystemExit(
                "tomli_w or toml is required to merge codex config.toml"
            ) from exc

base_path = Path.home() / "dotfiles" / "codex" / "config.toml"
local_path = Path.home() / "dotfiles" / "codex" / "config.toml.local"
target_path = Path.home() / ".codex" / "config.toml"

with base_path.open("rb") as base_file:
    base_data = tomllib.load(base_file)
with local_path.open("rb") as local_file:
    local_data = tomllib.load(local_file)

merged = deep_merge(base_data, local_data)
target_path.write_text(dump_toml(merged))
PY
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
