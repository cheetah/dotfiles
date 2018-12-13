[ -s "$HOME/.zshenv" ] && source $HOME/.zshenv

if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi
source ~/.zplug/init.zsh

zplug "zplug/zplug", hook-build:'zplug --self-manage'

zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
zplug "stedolan/jq",      from:gh-r, as:command, rename-to:jq
zplug "akavel/up",        from:gh-r, as:command, rename-to:up
zplug "sharkdp/bat",      from:gh-r, as:command, rename-to:bat
zplug "wagoodman/dive",   from:gh-r, as:command, rename-to:dive

zplug "b4b4r07/enhancd", use:init.sh
if zplug check "b4b4r07/enhancd"; then
  export ENHANCD_FILTER="fzf --height 50% --reverse --ansi"
  export ENHANCD_DOT_SHOW_FULLPATH=1
fi

zplug "lib/completion",   from:oh-my-zsh
zplug "lib/directories",  from:oh-my-zsh
zplug "lib/grep",         from:oh-my-zsh
zplug "lib/history",      from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/termsupport",  from:oh-my-zsh

zplug "plugins/asdf",    from:oh-my-zsh
zplug "plugins/bundler", from:oh-my-zsh
zplug "plugins/docker",  from:oh-my-zsh
zplug "plugins/git",     from:oh-my-zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

if [[ $OSTYPE == *darwin* ]]; then
  zplug "plugins/osx",  from:oh-my-zsh
  zplug "plugins/pass", from:oh-my-zsh
fi

zplug "~/.zsh/themes", from:local, use:cheetah.zsh-theme, as:theme
[ -s "$HOME/.zsh.local" ] && source $HOME/.zsh.local

zplug check || zplug install
zplug load
