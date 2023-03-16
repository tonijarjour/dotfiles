#!/bin/bash
set -euo pipefail

here="$PWD"
[[ ! -f "$here/install.sh" ]] && exit 1

s() {
  C=''
  for i in "$@"; do 
    i="${i//\\/\\\\}"
    C="$C \"${i//\"/\\\"}\""
  done
  su -c bash -c "$C"
}

echo 'ln -sf "/run/systemd/resolve/stub-resolv.conf" "/etc/resolv.conf"'
s ln -sf "/run/systemd/resolve/stub-resolv.conf" "/etc/resolv.conf"

echo 'install programs with pacman'
s pacman -S fd ripgrep neovim alacritty mpv maim feh sxiv xclip dmenu which \
  ttf-iosevka-nerd ttf-croscore noto-fonts noto-fonts-cjk noto-fonts-emoji \
  xorg-server xorg-xinit xorg-xsetroot zathura-pdf-mupdf zathura-cb redshift \
  pipewire-pulse pipewire-jack arc-solid-gtk-theme man-db texinfo fakeroot \
  gcc autoconf automake pkgconf make patch

git clone "https://github.com/tonijarjour/dwm.git" "$HOME/dwm"
ln -s "$here/system/dwm.h" "$HOME/dwm/config.h"
cd "$HOME/dwm" || exit 1
echo 'compile and install dwm'
s make clean install

git clone "https://aur.archlinux.org/nvim-packer-git.git" "$HOME/packer"
cd "$HOME/packer" || exit 1
makepkg -si

git clone "https://aur.archlinux.org/nvm.git" "$HOME/nvm"
cd "$HOME/nvm" || exit 1
makepkg -si

gpg --keyserver "hkp://keyserver.ubuntu.com" --search-keys "031F7104E932F7BD7416E7F6D2845E1305D6E801"
git clone "https://aur.archlinux.org/librewolf-bin.git" "$HOME/librewolf"
cd "$HOME/librewolf" || exit 1
makepkg -si

echo 'install -Dm 644 "$here/system/50-mouse-acceleration.conf" "/etc/X11/xorg.conf.d/"'
s install -Dm 644 "$here/system/50-mouse-acceleration.conf" "/etc/X11/xorg.conf.d/"

echo 'install -Dm 644 "$here/system/arabic.conf" "/etc/fonts/local.conf"'
s install -Dm 644 "$here/system/arabic.conf" "/etc/fonts/local.conf"

curl --proto '=https' --tlsv1.2 -sSf "https://sh.rustup.rs" | sh

mkdir -p "$HOME/.config"
ln -sf "$here/config/"* "$HOME/.config/"

for f in "$here/home/"*
do
  ln -sf "$f" "$HOME/.${f##*/}"
done

ln -s "/mnt/archive/"* "$HOME/"

echo "DONE"
