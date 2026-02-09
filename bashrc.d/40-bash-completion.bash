# Homebrew bash-completion@2
if command -v brew >/dev/null 2>&1; then
  _brew_prefix="$(brew --prefix)"
  if [ -r "${_brew_prefix}/etc/profile.d/bash_completion.sh" ]; then
    . "${_brew_prefix}/etc/profile.d/bash_completion.sh"
  fi
  unset _brew_prefix
fi
