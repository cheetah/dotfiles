### ADB
# mnemonic [AD]b [P]ush [O]BB
# pushes obb directory via adb

obbdir=${1}

if [[ -z $obbdir ]]; then
  obbdir=$(find . -maxdepth 5 -name '*.obb' ! -iname ".*" -exec dirname {} \; | sort -u | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[adb:push]'" | awk '{print $1}')
fi

if [[ $obbdir ]]; then
  echo "Trying $obbdir"
  adb push $obbdir /sdcard/Android/obb/
fi
