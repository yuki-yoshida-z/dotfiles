# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/yoshida_y/.cache/dein/repos/github.com/junegunn/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/yoshida_y/.cache/dein/repos/github.com/junegunn/fzf/bin"
fi

eval "$(fzf --bash)"
