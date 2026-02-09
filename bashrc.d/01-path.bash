export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/unzip/bin:$PATH"
export GOPATH=$(go env GOPATH)
export PATH="$PATH:$GOPATH/bin"
