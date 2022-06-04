### SSH
# mnemonic [SS]h [F]ind and connect
# find ssh host from known hosts and connect

host=${1}

if [[ -z $host ]]; then
  host=$(cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e 's/,.*//g' | sort -u | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[ssh:connect]'" | awk '{print $1}')
fi

if [[ $host ]]; then
  echo "Connecting to $host"
  ssh $host
fi
