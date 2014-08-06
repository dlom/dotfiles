# aur helpers
# installs all arguments (no aur dep checking)
function auri() {
	pushd -q `mktemp -d`
	bash <(curl aur.sh --silent) --syncdeps --install "$@"
	popd -q
}

# prints out aur packages that need updating
function aurc() {
	package-query --aur --foreign --format "%n %v" | comm - <(package-query --aur --foreign --format "%n %V") -23 | awk '{print $1}'
}

# updates ALL out of date aur packages
function auru() {
	aurc | xargs auri --needed
}
