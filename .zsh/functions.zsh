# random functions
# say
say () {
	cvlc "https://translate.google.com/translate_tts?ie=UTF-8&tl=en-US&client=tw-ob&q=$*" --play-and-exit --quiet 2> /dev/null
}

# open file or pipe to browser
function browser() {
	if [[ ! -t 0 ]]; then
		local browserfile=$(mktemp --tmpdir tmp.XXXXXXXXXX.browser.html)
		cat - > $browserfile
		$BROWSER "$browserfile" "$@"
	else
		if [[ -n "$1" ]]; then
			$BROWSER "$1" "${@:2}"
		else
			$BROWSER
		fi
	fi
}

# render markdown and display in browser
function md() {
	if [[ ! -t 0 ]]; then
		cat - | $MARKDOWN "$@" | browser
	else
		if [[ -n "$1" ]]; then
			$MARKDOWN "$1" "${@:2}" | browser
		else
			echo "Please specify a file or pipe from STDIN" >&2
		fi
	fi
}

# execute the actual binary instead of any aliases or functions
function base() {
    $(whence -p $1) "${@:2}"
}

# better tree
function tree() {
	base tree -C --dirsfirst "$@" | less -FRNX
}

# strip colors
function decolor() {
	sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"
}

# dos2unix and unix2dos
function dos2unix() {
	sed "s/\r$//"
}

function unix2dos() {
	sed "s/$/\r/"
}

# sets the terminal title
function title() {
	if [[ "$TERM" =~ "(xterm*|(u|)rxvt*)" ]]; then
		printf "\e]2;%s\a" "${(V)argv}"
	elif [[ "$TERM" =~ "screen*" ]]; then
		printf "\ek%s\e\\" "${(V)argv}"
	fi
}

# hash a password for WPA
function wpa_hash() {
	local pass
	read -s pass
	echo $pass | tr -d '[:space:]' | iconv -t utf16le | openssl md4 | cut -d ' ' -f2
}

# better cp
function cpr() {
	rsync --archive --human-readable --progress "$@"
}

# cod e.
function cod() {
	if [[ $1 = 'e.' ]]; then
		code .
	else
		echo A large marine fish with a small barbel on the chin.
	fi
}
