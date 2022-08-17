#!/bin/bash
set -euo pipefail

here="$PWD"
[[ ! -f "$here/install.sh" ]] && exit 1

doas ln -sf "/run/systemd/resolve/stub-resolv.conf" "/etc/resolv.conf"

doas pacman -S base-devel man-db fd ripgrep neovim alacritty mpv npm maim feh \
    ttf-iosevka-nerd ttf-liberation noto-fonts noto-fonts-cjk noto-fonts-emoji \
    xorg-server xorg-xinit xorg-xsetroot dmenu zathura-pdf-mupdf zathura-cb \
    pipewire-pulse xclip pkgstats 

git clone "https://github.com/tonijarjour/dwm.git" "$HOME/dwm"
cd "$HOME/dwm" || exit 1
doas make clean install

git clone "https://aur.archlinux.org/nvim-packer-git.git" "$HOME/packer"
cd "$HOME/packer" || exit 1
makepkg -si

git clone "https://aur.archlinux.org/nsxiv.git" "$HOME/nsxiv"
cd "$HOME/nsxiv" || exit 1
makepkg -si

git clone "https://aur.archlinux.org/google-chrome.git" "$HOME/chrome"
cd "$HOME/chrome" || exit 1
makepkg -si

doas install -Dm 644 "$here/50-mouse-acceleration.conf" "/etc/X11/xorg.conf.d/"

curl --proto '=https' --tlsv1.2 -sSf "https://sh.rustup.rs" | sh

mkdir -p "$HOME/.config"
ln -sf "$here/config/"* "$HOME/.config/"

for f in "$here/home/"*
do
    ln -sf "$f" "$HOME/.${f##*/}"
done

ln -s "/mnt/archive/"* "$HOME/"
cp "/mnt/archive/Other/git-credentials" \
    "$HOME/.git-credentials"

echo "DONE"
