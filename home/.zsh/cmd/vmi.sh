### ASDF
# mnemonic [V]ersion [M]anager [I]nstall
# install multiple languages at once, async

lang=${1}
asdf plugin-list-all &>/dev/null 2>&1

if [[ -z $lang ]]; then
  lang=$(asdf plugin-list all | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[asdf:install]'" | awk '{print $1}')
fi

if [[ $lang ]]; then
  for lng in $(echo $lang); do
    if [[ -z $(asdf plugin-list | rg $lng) ]]; then
      asdf plugin-add $lng
    else
      asdf plugin-update $lng
    fi

    for version in $(asdf list-all $lng | sort -nrk1,1 | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[asdf:${lng}:install]'"); do 
      asdf install $lng $version
    done
  done
fi

