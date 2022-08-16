#!/bin/bash
set -euo pipefail

here="$PWD"
[[ ! -f "$here/install.sh" ]] && exit 1

doas ln -sf "/run/systemd/resolve/stub-resolv.conf" "/etc/resolv.conf"

doas pacman -S base-devel man-db fd ripgrep neovim alacritty mpv npm maim feh \
    ttf-iosevka-nerd ttf-liberation noto-fonts noto-fonts-cjk noto-fonts-emoji \
    pkgstats dmenu zathura-pdf-mupdf zathura-cb xclip pipewire-pulse xorg-xinit

git clone "https://aur.archlinux.org/nvim-packer-git.git" "$HOME/packer"
cd "$HOME/packer" || exit 1
makepkg -si

git clone "https://aur.archlinux.org/nsxiv.git" "$HOME/nsxiv"
cd "$HOME/nsxiv" || exit 1
makepkg -si

git clone "https://aur.archlinux.org/google-chrome.git" "$HOME/chrome"
cd "$HOME/chrome" || exit 1
makepkg -si

curl --proto '=https' --tlsv1.2 -sSf "https://sh.rustup.rs" | sh

for f in "$here/home/"*
do
    ln -sf "$f" "$HOME/.${f##*/}"
done

mkdir -p "$HOME/.config"
ln -sf "$here/config/"* "$HOME/.config/"

ln -s "/mnt/archive/"* "$HOME/"
cp "/mnt/archive/Other/git-credentials" \
    "$HOME/.git-credentials"

echo "DONE"
