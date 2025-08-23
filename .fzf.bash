# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/yoshida_y/.local/share/nvim/lazy/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/yoshida_y/.local/share/nvim/lazy/fzf/bin"
fi

eval "$(fzf --bash)"
