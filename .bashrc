# インタラクティブシェル以外では何もしない
case $- in
  *i*) ;;
  *) return;;
esac

if [ -d "$HOME/.bashrc.d" ]; then
  for f in "$HOME/.bashrc.d"/*.bash; do
    [ -f "$f" ] && . "$f"
  done
fi

# 端末固有の設定は ~/.bashrc.local に置く
[ -f "$HOME/.bashrc.local" ] && . "$HOME/.bashrc.local"
