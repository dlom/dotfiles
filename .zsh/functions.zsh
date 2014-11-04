# random functions
# say
function say() {
	cvlc "http://translate.google.com/translate_tts?ie=UTF-8&tl=en&q=$*" --play-and-exit --quiet 2> /dev/null
}

# open file or pipe to browser
function browser() {
	if [[ ! -t 0 ]]; then;
		local browserfile=$(mktemp --tmpdir tmp.XXXXXXXXXX.browser.html)
		cat > $browserfile
		$BROWSER "$browserfile" "$@"
	else
		$BROWSER "$1" "${@:2}"
	fi
}

# render markdown and display in browser
function md() {
	markdown "$1" | browser
}

# better tree
function tree() {
	/usr/bin/tree -C --dirsfirst "$@" | less -FRNX
}
