# aur helpers
# installs all arguments (no aur dep checking)
function auri() {
	pushd -q $(mktemp --directory --tmpdir tmp.XXXXXXXXXX.pacman)
	bash <(curl aur.sh --silent) --syncdeps --install "$@"
	popd -q
}

# lists all aur packages
function aurl() {
	package-query --query --foreign --format "%n"
}

# checks and prints out aur packages that need updating
function aurc() {
	package-query --aur --upgrades --format "%n"
}

# updates ALL out of date aur packages
function auru() {
	auri --needed $(aurc)
}
