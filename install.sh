#!/bin/sh

PACMAN='doas pacman -S'
LINKHERE="$PWD"

if ! [ -f "$PWD"/install.sh ]; then
    echo 'Must run in the directory of this script!'
    exit
fi

$PACMAN bat exa fd fzf ripgrep diff-so-fancy neovim neofetch man-db nvidia xorg-xinit \
    alacritty dmenu mpv feh sxiv gcc patch make zathura-pdf-poppler zathura-cb alsa-utils

mkdir "$HOME"/.config

ln -sf "$LINKHERE"/home/.* "$HOME"
ln -sf "$LINKHERE"/config/* "$HOME"/.config/

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
