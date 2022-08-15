#!/bin/bash
set -euo pipefail

here="$PWD"
[[ ! -f "$here/install.sh" ]] && exit 1

doas ln -sf "/run/systemd/resolve/stub-resolv.conf" "/etc/resolv.conf"

doas pacman -S base-devel man-db git neovim fd ripgrep alacritty mpv npm \
    pkgstats bemenu-wayland swaybg zathura-pdf-mupdf zathura-cb wl-clipboard \
    ttf-iosevka-nerd ttf-liberation noto-fonts noto-fonts-cjk noto-fonts-emoji \
    imv slurp grim thunar tumbler pipewire-pulse

git clone "https://aur.archlinux.org/nvim-packer-git.git" "$HOME/packer"
cd "$HOME/packer" || exit 1
makepkg -si

git clone "https://aur.archlinux.org/google-chrome.git" "$HOME/chrome"
cd "$HOME/chrome" || exit 1
makepkg -si

git clone "https://github.com/djpohly/dwl.git" "$HOME/dwl"
curl --create-dirs --output-dir "$HOME/dwl/patches" --remote-name-all "https://github.com/djpohly/dwl/compare/main...{guidocella:alwayscenter.patch,AurelWeinhold:attachbottom.patch}"
cp "$here/dwl-config.patch" "$HOME/dwl/patches"
cp "$HOME/dwl/config.def.h" "$HOME/dwl/config.h"
cd "$HOME/dwl" || exit 1
for p in "$HOME/dwl/patches/"*.patch;
  do patch < $p
done
doas make clean install

doas usermod -aG seat $USER
doas systemctl enable seatd.service

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
