_zplug-check-interval() {
  now=$(date +%s)
  if [ -f "${1}" ]; then
    last_update=$(cat "${1}")
  else
    last_update=0
  fi
  interval=$(expr ${now} - ${last_update})
  echo "${interval}"
}

_zplug-check-for-updates() {
  if [ -z "${ZPLUG_PLUGIN_UPDATE_DAYS}" ]; then
    ZPLUG_PLUGIN_UPDATE_DAYS=14
  fi

  if [ -z "${ZPLUG_PLUGIN_UPDATE_FILE}" ]; then
    ZPLUG_PLUGIN_UPDATE_FILE="${ZPLUG_HOME:-}/.zplug_plugin_lastupdate"
  fi

  local day_seconds=$(expr 24 \* 60 \* 60)
  local plugins_seconds=$(expr ${day_seconds} \* ${ZPLUG_PLUGIN_UPDATE_DAYS})

  local last_plugin=$(_zplug-check-interval ${ZPLUG_PLUGIN_UPDATE_FILE})

  if [ ${last_plugin} -gt ${plugins_seconds} ]; then
    echo "It has been $(expr ${last_plugin} / $day_seconds) days since your zplug plugins were updated"
    zplug update

    date +%s >! ${ZPLUG_PLUGIN_UPDATE_FILE}
    zplug clean --force
  fi
}

zmodload zsh/system
lockfile=${ZPLUG_HOME:-~}/.zplug_autoupdate_lock
touch $lockfile
if ! which zsystem &> /dev/null || zsystem flock -t 1 $lockfile; then
  _zplug-check-for-updates
  command rm -f $lockfile
fi
