# random functions
# say
function say() {
	cvlc "http://translate.google.com/translate_tts?ie=UTF-8&tl=en&q=$*" --play-and-exit --quiet 2> /dev/null
}

# open file or pipe to browser
function browser() {
	if [[ ! -t 0 ]]; then;
		local browserfile=$(mktemp --tmpdir tmp.XXXXXXXXXX.browser.html)
		cat - > $browserfile
		$BROWSER "$browserfile" "$@"
	else
		$BROWSER "$1" "${@:2}"
	fi
}

# render markdown and display in browser
function md() {
	if [[ ! -t 0 ]]; then;
		cat - | markdown "$@" | browser
	else
		markdown "$1" "${@:2}" | browser
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
