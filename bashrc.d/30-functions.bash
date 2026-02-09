# 選択したディレクトリに移動
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
