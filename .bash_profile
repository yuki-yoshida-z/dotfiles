#ターミナルを読むたびにbashrcを読む
if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
