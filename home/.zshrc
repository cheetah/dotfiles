[ -s "$HOME/.zshenv" ] && source $HOME/.zshenv

if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update
else
  source ~/.zplug/init.zsh
fi

zplug "zplug/zplug", hook-build:'zplug --self-manage'

zplug "BurntSushi/ripgrep",  from:gh-r, as:command, rename-to:rg
zplug "junegunn/fzf-bin",    from:gh-r, as:command, rename-to:fzf
zplug "r-darwish/topgrade",  from:gh-r, as:command, rename-to:topgrade
zplug "regclient/regclient", from:gh-r, as:command, rename-to:regctl
zplug "sharkdp/bat",         from:gh-r, as:command, rename-to:bat
zplug "sharkdp/hexyl",       from:gh-r, as:command, rename-to:hexyl
zplug "stedolan/jq",         from:gh-r, as:command, rename-to:jq
zplug "wagoodman/dive",      from:gh-r, as:command, rename-to:dive

zplug "b4b4r07/enhancd", use:init.sh
if zplug check "b4b4r07/enhancd"; then
  export ENHANCD_FILTER="fzf --height 50% --reverse --ansi"
  export ENHANCD_DOT_SHOW_FULLPATH=1
fi

zplug "lib/termsupport",  from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/history",      from:oh-my-zsh
zplug "lib/grep",         from:oh-my-zsh
zplug "lib/directories",  from:oh-my-zsh
zplug "lib/completion",   from:oh-my-zsh

zplug "plugins/git",     from:oh-my-zsh
zplug "plugins/docker",  from:oh-my-zsh
zplug "plugins/asdf",    from:oh-my-zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "~/.zsh/plugins", from:local
zplug "~/.zsh/cmd",     from:local, use:'(*).sh',          as:command, rename-to:'$1'
zplug "~/.zsh/themes",  from:local, use:cheetah.zsh-theme, as:theme

if [[ $OSTYPE == *darwin* ]]; then
  zplug "plugins/osx",  from:oh-my-zsh
  zplug "plugins/pass", from:oh-my-zsh
fi

[ -s "$HOME/.zsh.local" ] && source $HOME/.zsh.local

zplug check || zplug install
zplug load
