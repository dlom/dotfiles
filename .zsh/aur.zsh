# aur helpers
# downloads and runs makepkg on all arguments (adapted from http://aur.sh)
function aur() {
    local d=${BUILDDIR:-$PWD}
    local p
    for p in ${@:#-*}; do
        cd "$d"
        curl "https://aur.archlinux.org/cgit/aur.git/snapshot/$p.tar.gz" | tar xz
        cd "$p"
        makepkg ${@:#[^\-]*}
    done
}

# installs all arguments (no aur dep checking)
function auri() {
	pushd -q $(mktemp --directory --tmpdir tmp.XXXXXXXXXX.aur)
	aur --syncdeps --install "$@"
	popd -q
}

# lists all aur packages
function aurl() {
	pacman --query --foreign --quiet
}

# checks and prints out aur packages that need updating
function aurc() {
	package-query --aur --upgrades --format "%n"
}

# updates ALL out of date aur packages
function auru() {
	auri --needed $(aurc)
}
