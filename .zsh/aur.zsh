# aur helpers
# installs all arguments (no aur dep checking)
function auri() {
	pushd -q $(mktemp -d)
	bash <(curl aur.sh --silent) --syncdeps --install "$@"
	popd -q
}

# checks and prints out aur packages that need updating
function aurc() {
	package-query --aur --upgrades --format "%n"
}

# updates ALL out of date aur packages
function auru() {
	auri --needed $(aurc)
}
