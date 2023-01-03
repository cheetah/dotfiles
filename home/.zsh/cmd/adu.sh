### ADB
# mnemonic [AD]b [U]nistall
# install apk via adb

apk=${1}

if [[ -z $apk ]]; then
  apk=$(adb shell cmd package list packages | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[adb:uninstall]'" | sed 's/package://g')
fi

if [[ $apk ]]; then
  echo "Trying $apk"
  adb uninstall $apk
fi
