#!/bin/sh

PACMAN='doas pacman -S'
LINKHERE="$PWD"

if ! [ -f "$PWD"/install.sh ]; then
    echo 'Must run in the directory of this script!'
    exit
fi

$PACMAN bat exa fd fzf ripgrep diff-so-fancy neovim neofetch man-db \
    zathura-pdf-poppler zathura-cb nvidia-dkms sxhkd alacritty dmenu mpv \
    noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-liberation xclip \
    gcc patch make alsa-utils ttc-iosevka chromium sxiv nodejs npm \
    xorg-xprop xorg-xrandr xorg-xinit xorg-xsetroot feh maim git nnn \
    renameutils thunar tumbler lilypond pkgstats ffmpegthumbnailer \
    typescript texlive-most

mkdir -p "$HOME"/.config/nnn/plugins

ln -s /mnt/archive/* "$HOME"
ln -sf "$LINKHERE"/home/.* "$HOME"
ln -sf "$LINKHERE"/config/* "$HOME"/.config/

# Turn off mouse acceleration
doas install -Dm 644 other/50-mouse-acceleration.conf /etc/X11/xorg.conf.d/

# systemd-resolvd dns
#doas ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

# Install dwm
git clone git://git.suckless.org/dwm "$HOME"/dwm
cp "$LINKHERE"/other/dwm-statusallmons-6.2.diff "$HOME"/dwm
ln -s "$LINKHERE"/other/config.h "$HOME"/dwm
cd "$HOME"/dwm
patch < dwm-statusallmons-6.2.diff
doas make clean install

# nnn plugins
curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh

# Vim Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
