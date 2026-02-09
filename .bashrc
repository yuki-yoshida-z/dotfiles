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
