# random functions
# say
function say() {
	cvlc "http://translate.google.com/translate_tts?ie=UTF-8&tl=en&q=$*" --play-and-exit
}

# open file or pipe to browser
function browser() {
	if [[ ! -t 0 ]]; then;
		local browserfile=$(mktemp --tmpdir tmp.XXXXXXXXXX.browser)
		cat > $browserfile
		$BROWSER $browserfile "$@"
	else
		$BROWSER "$1" "${@:2}"
	fi
}

function md() {
	markdown "$1" | browser
}
