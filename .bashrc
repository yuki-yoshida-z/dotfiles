export PATH=/usr/local/bin/git:$PATH
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
#ターミナル表示設定
if [ $UID -eq 0 ]; then
  PS1="\[\033[31m\]\u:\[\033[01m\]\w\[\033[00m\]\\$ "
else
  PS1="\[\033[36m\]\u:\[\033[01m\]\w\[\033[00m\]\\$ "
fi
#Linux alias
alias ..='cd ../'
alias cl='clear'
alias ls='ls -a -FG'
alias chrome='open -a google\ chrome'

# fzf alias
alias fzff='rg --files --hidden --no-ignore-vcs -g "!{node_modules,.git,dist}" | fzf --height 50% --layout=reverse --border --inline-info --preview "bat --style=numbers --color=always --line-range :200 {}"'
alias nvimf='nvim $(fzff)'
# 選択したディレクトリに移動
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

#Docker-alias
alias doc='docker'
alias dcom='docker compose'
alias dsy='docker-sync'
alias make=gmake

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/unzip/bin:$PATH"
export GOPATH=$(go env GOPATH)
export PATH="$PATH:$GOPATH/bin"
if [ -f ~/.bashrc.local ]; then
  . ~/.bashrc.local
fi
