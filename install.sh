#!/bin/sh

PACMAN='doas pacman -S'
LINKHERE="$PWD"

if ! [ -f "$PWD"/install.sh ]; then
    echo 'Must run in the directory of this script!'
    exit
fi

$PACMAN bat exa fd fzf ripgrep diff-so-fancy neovim neofetch man-db \
    zathura-pdf-poppler zathura-cb nvidia sxhkd alacritty dmenu mpv \
    xorg-xprop xorg-xrandr xorg-xinit xorg-xsetroot feh sxiv maim \
    noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-liberation \
    gcc patch make alsa-utils

mkdir "$HOME"/.config
ln -sf "$LINKHERE"/home/.* "$HOME"
ln -sf "$LINKHERE"/config/* "$HOME"/.config/

doas install -Dm 644 other/50-mouse-acceleration.conf /etc/X11/xorg.conf.d/

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
