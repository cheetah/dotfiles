ZSH=$HOME/.oh-my-zsh
ZSH_THEME="norm"

plugins=(osx brew git github redis-cli ruby rbenv gem bundler vagrant zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$PATH