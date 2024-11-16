#ターミナルを読むたびにbashrcを読む
if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi
export PATH=/usr/local/bin/git:$PATH
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
