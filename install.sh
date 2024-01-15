#!/bin/bash
set -euo pipefail

here="$PWD"
[[ ! -f "$here/install.sh" ]] && exit 1

prompt() { printf "=> "; su -c bash -c "$@"; }

echo "Use DNS stub mode"
prompt 'ln -sf "/run/systemd/resolve/stub-resolv.conf" "/etc/resolv.conf"'

echo "Install programs with pacman"
prompt \
 "pacman -S fd ripgrep neovim alacritty mpv maim feh xclip dmenu which nsxiv \
  ttf-iosevka-nerd ttf-croscore noto-fonts noto-fonts-cjk noto-fonts-emoji \
  man-db texinfo fakeroot gcc autoconf automake pkgconf make patch emacs npm \
  xorg-server xorg-xinit xorg-xsetroot xorg-xrandr redshift xf86-input-wacom \
  zathura-pdf-poppler zathura-cb pipewire-pulse pipewire-jack wireplumber \
  hunspell hunspell-en_us"

git clone "https://github.com/tonijarjour/dwm.git" "$HOME/dwm"
ln -s "$here/system/dwm.h" "$HOME/dwm/config.h"
cd "$HOME/dwm" || exit 1
echo "Compile and install dwm"
prompt "make clean install"

gpg --keyserver "hkp://keyserver.ubuntu.com" --search-keys "662E3CDD6FE329002D0CA5BB40339DD82B12EF16"
git clone "https://aur.archlinux.org/librewolf-bin.git" "$HOME/librewolf"
cd "$HOME/librewolf" || exit 1
makepkg -si

echo "Disable mouse acceleration"
prompt "install -Dm 644 \"$here/system/50-mouse-acceleration.conf\" \"/etc/X11/xorg.conf.d/\""

echo "Reject Noto Nastaliq Urdu font"
prompt "install -Dm 644 \"$here/system/arabic.conf\" \"/etc/fonts/conf.d/66-noto-reject-nastaliq.conf\""

mkdir -p "$HOME/.config" "$HOME/.emacs.d"
ln -sf "$here/config/"* "$HOME/.config/"
ln -sf "$here/emacs.d/"* "$HOME/.emacs.d/"

for f in "$here/home/"*
do
  ln -sf "$f" "$HOME/.${f##*/}"
done

ln -s "/mnt/archive/"* "$HOME/"

echo "DONE"
