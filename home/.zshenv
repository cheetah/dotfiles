export LC_ALL=en_US.UTF-8

export ASDF_DATA_DIR=~/.asdf-data

export FZF_DEFAULT_OPTS="--height=50% --min-height=15 --reverse"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export GOPRIVATE="go.pkg.cx"

if [[ "$(uname -m)" == "arm64" ]]; then
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:${PATH}"
fi

source "$HOME/.cargo/env"
