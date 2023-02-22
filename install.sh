#!/bin/bash
set -euo pipefail

here="$PWD"
[[ ! -f "$here/install.sh" ]] && exit 1

doas ln -sf "/run/systemd/resolve/stub-resolv.conf" "/etc/resolv.conf"

doas pacman -S man-db fd ripgrep neovim alacritty mpv maim feh npm pkgstats \
    ttf-iosevka-nerd ttf-liberation noto-fonts noto-fonts-cjk noto-fonts-emoji \
    xorg-server xorg-xinit xorg-xsetroot dmenu zathura-pdf-mupdf zathura-cb \
    pipewire-pulse pipewire-jack xclip redshift chromium sxiv

git clone "https://github.com/tonijarjour/dwm.git" "$HOME/dwm"
ln -s "$here/dwm.h" "$HOME/dwm/config.h"
cd "$HOME/dwm" || exit 1
doas make clean install

git clone "https://aur.archlinux.org/nvim-packer-git.git" "$HOME/packer"
cd "$HOME/packer" || exit 1
makepkg -si

doas install -Dm 644 "$here/50-mouse-acceleration.conf" "/etc/X11/xorg.conf.d/"
doas install -Dm 644 "$here/arabic.conf" "/etc/fonts/local.conf"

curl --proto '=https' --tlsv1.2 -sSf "https://sh.rustup.rs" | sh

mkdir -p "$HOME/.config"
ln -sf "$here/config/"* "$HOME/.config/"

for f in "$here/home/"*
do
    ln -sf "$f" "$HOME/.${f##*/}"
done

ln -s "/mnt/archive/"* "$HOME/"

echo "DONE"
