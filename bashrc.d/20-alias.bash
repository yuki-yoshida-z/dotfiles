#Linux alias
alias ..='cd ../'
alias cl='clear'
alias ls='ls -a -FG'
alias chrome='open -a google\ chrome'

# fzf alias
alias fzff='rg --files --hidden --no-ignore-vcs -g "!{node_modules,.git,dist}" | fzf --height 50% --layout=reverse --border --inline-info --preview "bat --style=numbers --color=always --line-range :200 {}"'
alias nvimf='nvim $(fzff)'

#Docker-alias
alias doc='docker'
alias dcom='docker compose'
alias dsy='docker-sync'
alias make=gmake
