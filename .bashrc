export PATH=$PATH:/Users/yuki/.nodebrew/current/bin

#ターミナル表示設定
if [ $UID -eq 0 ]; then
  PS1="\[\033[31m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\\$ "
else
  PS1="\[\033[36m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]\\$ "
fi
#Linux alias
alias ..='cd ../'
alias cl='clear'
alias ls='ls -a -FG'
