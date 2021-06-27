#!/bin/sh

PACMAN='doas pacman -S'
LINKHERE="$PWD"

if ! [ -f "$PWD"/install.sh ]; then
    echo 'Must run in the directory of this script!'
    exit
fi

$PACMAN bat exa fd fzf ripgrep diff-so-fancy neovim neofetch man-db \
    zathura-pdf-poppler zathura-cb nvidia sxhkd alacritty dmenu mpv \
    noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-liberation xclip \
    xorg-xprop xorg-xrandr xorg-xinit xorg-xsetroot feh sxiv maim \
    gcc patch make alsa-utils ttf-fantasque-sans-mono chromium git \
    nnn renameutils

mkdir -p "$HOME"/.config "$HOME"/.local/share

ln -s /mnt/archive/* "$HOME"
ln -sf "$LINKHERE"/home/.* "$HOME"
ln -sf "$LINKHERE"/config/* "$HOME"/.config/
ln -sf "$LINKHERE"/local/share/applications "$HOME"/.local/share

# Turn off mouse acceleration
doas install -Dm 644 other/50-mouse-acceleration.conf /etc/X11/xorg.conf.d/

# Install dwm
git clone git://git.suckless.org/dwm "$HOME"/dwm
cp "$LINKHERE"/other/dwm-statusallmons-6.2.diff "$HOME"/dwm
ln -s "$LINKHERE"/other/config.h "$HOME"/dwm
cd "$HOME"/dwm
patch < dwm-statusallmons-6.2.diff
doas make clean install

# Vim Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
