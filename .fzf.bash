# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/yoshida_y/dotfiles/nvim/dein/repos/github.com/junegunn/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/yoshida_y/dotfiles/nvim/dein/repos/github.com/junegunn/fzf/bin"
fi

# export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!{node_modules,.git}"'
# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/yoshida_y/dotfiles/nvim/dein/repos/github.com/junegunn/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/yoshida_y/dotfiles/nvim/dein/repos/github.com/junegunn/fzf/shell/key-bindings.bash"
