### PASS
# mnemonic: [P]ass[F]ind
# search password in the passwotd store
# press [enter] to copy selected password
# press [escape] to exit

function entry_from_path() {
	local v=$1
	v=${v#$PASSWORD_STORE_DIR/}
	v=${v%.gpg}
	echo "$v"
}

function candidate_selector() {
	query=$1
	candidates=$2
	echo "$candidates" | fzf ${FZF_DEFAULT_OPTS} -q "$query" --header='[pass:find]' --select-1
}

function list_entries() {
  if [ -z "${PASSWORD_STORE_DIR}" ]; then
    PASSWORD_STORE_DIR="${HOME}/.password-store"
  fi

	find "$PASSWORD_STORE_DIR" -name '*.gpg' | while read -r c; do
		echo $(entry_from_path "$c");
	done
}

query="$@"
candidates=$(list_entries)

res=$(candidate_selector "$query" "$candidates")
if [ -n "$res" ]; then
	pass show "$res" | tail -n +2 || exit $?
	pass show -c "$res"
else
	exit 1
fi
