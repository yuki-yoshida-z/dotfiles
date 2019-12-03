export PATH=$HOME/.nodebrew/current/bin:$PATH
# rbenvのpath設定
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
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
alias vgr='vagrant'
alias chrome='open -a google\ chrome'
#Docker-alias
alias doc='docker'
alias dcom='docker-compose'
alias dsy='docker-sync'
alias dcweb='docker-compose exec web'
#For Rails on root
alias tail='tail -n 30 -f log/development.log'
