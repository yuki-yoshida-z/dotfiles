if command -v anyenv >/dev/null 2>&1; then
  eval "$(anyenv init -)"
fi

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/unzip/bin:$PATH"
export GOPATH=$(go env GOPATH)
export PATH="$PATH:$GOPATH/bin"
