ZSH=$HOME/.oh-my-zsh
ZSH_THEME="sunrise"

plugins=(osx brew git github redis-cli python ruby rbenv gem bundler cap heroku vagrant zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$PATH