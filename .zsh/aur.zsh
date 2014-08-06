# aur helpers
# installs all arguments (no aur dep checking)
function auri() {
	pushd -q `mktemp -d`
	bash <(curl aur.sh --silent) --syncdeps --install "$@"
	popd -q
}

# updates ALL aur packages
function auru() {
	pushd -q `mktemp -d`
	pacman --query --quiet --foreign | xargs bash <(curl aur.sh --silent) --syncdeps --install --needed
	popd -q
}

# prints out aur packages that need updating
function aurc() {
	package-query --aur --foreign --format "%n %v" | comm - <(package-query --aur --foreign --format "%n %V") -23 | awk '{print $1}'
}
