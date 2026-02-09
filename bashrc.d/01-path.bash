export PATH=/usr/local/bin/git:$PATH
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yoshida_y/google-cloud-sdk/path.bash.inc' ]; then . '/Users/yoshida_y/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yoshida_y/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/yoshida_y/google-cloud-sdk/completion.bash.inc'; fi

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/unzip/bin:$PATH"
export GOPATH=$(go env GOPATH)
export PATH="$PATH:$GOPATH/bin"
