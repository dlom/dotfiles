# aur helpers
function auri() {
	pushd -q `mktemp -d`
	bash <(curl aur.sh --silent) --syncdeps --install "$@"
	popd -q
}

function auru() {
	pushd -q `mktemp -d`
	pacman --query --quiet --foreign | xargs bash <(curl aur.sh --silent) --syncdeps --install --needed
	popd -q
}
