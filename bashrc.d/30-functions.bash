# 選択したディレクトリに移動
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Record brew installs into ~/dotfiles/.Brewfile.local with a warning.
brew() {
  command brew "$@"
  local status=$?
  if [ $status -ne 0 ]; then
    return $status
  fi

  if [ "$1" = "install" ] || [ "$1" = "tap" ]; then
    local brewfile_local="$HOME/dotfiles/.Brewfile.local"
    local brewfile_shared="$HOME/dotfiles/Brewfile"
    local is_cask=0
    local subcmd="$1"
    shift

    while [ $# -gt 0 ]; do
      case "$1" in
        --cask)
          is_cask=1
          ;;
        --formula)
          is_cask=0
          ;;
        -*)
          ;;
        *)
          if [ "$subcmd" = "tap" ]; then
            if ! rg -n -S "^tap \\\"${1}\\\"$" "$brewfile_shared" "$brewfile_local" 2>/dev/null; then
              printf 'tap "%s"\n' "$1" >> "$brewfile_local"
            fi
          else
            if [ $is_cask -eq 1 ]; then
              if ! rg -n -S "^cask \\\"${1}\\\"$" "$brewfile_shared" "$brewfile_local" 2>/dev/null; then
                printf 'cask "%s"\n' "$1" >> "$brewfile_local"
              fi
            else
              if ! rg -n -S "^brew \\\"${1}\\\"$" "$brewfile_shared" "$brewfile_local" 2>/dev/null; then
                printf 'brew "%s"\n' "$1" >> "$brewfile_local"
              fi
            fi
          fi
          ;;
      esac
      shift
    done

    printf 'Note: Recorded to %s. Move shared packages into %s if needed.\n' "$brewfile_local" "$brewfile_shared"
  fi
  return 0
}
