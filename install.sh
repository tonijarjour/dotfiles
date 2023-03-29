#!/bin/bash
set -euo pipefail

here="$PWD"
[[ ! -f "$here/install.sh" ]] && exit 1

prompt() { printf "=> "; su -c bash -c "$@"; }

echo "Use DNC stub mode"
prompt 'ln -sf "/run/systemd/resolve/stub-resolv.conf" "/etc/resolv.conf"'

echo "Install programs with pacman"
prompt \
 "pacman -S fd ripgrep neovim alacritty mpv maim feh sxiv xclip dmenu which \
  ttf-iosevka-nerd ttf-croscore noto-fonts noto-fonts-cjk noto-fonts-emoji \
  xorg-server xorg-xinit xorg-xsetroot zathura-pdf-mupdf zathura-cb redshift \
  pipewire-pulse pipewire-jack arc-solid-gtk-theme man-db texinfo fakeroot \
  gcc autoconf automake pkgconf make patch imagemagick yt-dlp bacon emacs \
  hunspell hunspell-en_us"

git clone "https://github.com/tonijarjour/dwm.git" "$HOME/dwm"
ln -s "$here/system/dwm.h" "$HOME/dwm/config.h"
cd "$HOME/dwm" || exit 1
echo "Compile and install dwm"
prompt "make clean install"

git clone "https://aur.archlinux.org/nvm.git" "$HOME/nvm"
cd "$HOME/nvm" || exit 1
makepkg -si

gpg --keyserver "hkp://keyserver.ubuntu.com" --search-keys "031F7104E932F7BD7416E7F6D2845E1305D6E801"
git clone "https://aur.archlinux.org/librewolf-bin.git" "$HOME/librewolf"
cd "$HOME/librewolf" || exit 1
makepkg -si

echo "Disable mouse acceleration"
prompt "install -Dm 644 \"$here/system/50-mouse-acceleration.conf\" \"/etc/X11/xorg.conf.d/\""

echo "Reject Noto Nastaliq Urdu font"
prompt "install -Dm 644 \"$here/system/arabic.conf\" \"/etc/fonts/conf.d/66-noto-reject-nastaliq.conf\""

curl --proto "=https" --tlsv1.2 -sSf "https://sh.rustup.rs" | sh

mkdir -p "$HOME/.config"
ln -sf "$here/config/"* "$HOME/.config/"

mkdir -p "$HOME/.emacs.d"
ln -sf "$here/emacs.d/"* "$HOME/.emacs.d/"

for f in "$here/home/"*
do
  ln -sf "$f" "$HOME/.${f##*/}"
done

ln -s "/mnt/archive/"* "$HOME/"

echo "DONE"
