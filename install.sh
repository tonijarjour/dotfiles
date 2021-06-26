#!/bin/sh

PACMAN='doas pacman -S'
LINKHERE="$PWD"

if ! [ -f "$PWD"/install.sh ]; then
    echo 'Must run in the directory of this script!'
    exit
fi

$PACMAN bat exa fd fzf httpie ripgrep diff-so-fancy neovim neofetch man-db

mkdir "$HOME"/.config

ln -s /mnt/archive/* "$HOME"
ln -sf "$LINKHERE"/home/.* "$HOME"
ln -sf "$LINKHERE"/config/* "$HOME"/.config/

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
