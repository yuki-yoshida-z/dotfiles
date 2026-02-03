#ターミナルを読むたびにbashrcを読む
if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi
if [ -f ~/.bash_profile.local ]; then
. ~/.bash_profile.local
fi
