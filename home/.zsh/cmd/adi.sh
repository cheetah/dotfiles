### ADB
# mnemonic [AD]b [I]nstall
# install apk via adb

apk=${1}

if [[ -z $apk ]]; then
  apk=$(find . -maxdepth 5 -type f -name '*.apk' ! -iname ".*" | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[adb:install]'")
fi

if [[ $apk ]]; then
  echo "Trying $apk"
  adb install -g -r "$apk"
fi
