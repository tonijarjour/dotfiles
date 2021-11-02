#!/bin/sh

manager='doas pacman -S'
linkhere="$PWD"

if ! [ -f "$PWD"/install.sh ]; then
    echo 'Must run in the directory of this script!'
    exit
fi

$manager ttc-iosevka-etoile ttc-iosevka ttc-iosevka-slab ttc-iosevka-aile \
    noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-liberation feh mpv sxiv \
    xorg-xprop xorg-xrandr xorg-xinit xorg-xsetroot nvidia-dkms zathura-cb \
    nodejs patch git diff-so-fancy alsa-utils pkgstats zathura-pdf-poppler \
    thunar tumbler ffmpegthumbnailer chromium maim lilypond sxhkd dmenu gcc \
    exa ripgrep neovim neofetch man-db nnn alacritty renameutils make xclip \
    npm fd 

mkdir -p "$HOME"/.config/nnn/plugins

ln -s /mnt/archive/* "$HOME"
ln -sf "$linkhere"/home/.* "$HOME"
ln -sf "$linkhere"/config/* "$HOME"/.config/

# Turn off mouse acceleration
doas install -Dm 644 other/50-mouse-acceleration.conf /etc/X11/xorg.conf.d/

# Set larger console font
doas install -Dm 644 other/ter-132n.psf.gz /usr/share/kbd/consolefonts/
doas install -Dm 644 other/vconsole.conf /etc/

# systemd-resolvd dns
doas ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

# git credentials
cp "/mnt/archive/Other/Data Files/git-credentials" "$HOME/.git-credentials"

# Install dwm
git clone git://git.suckless.org/dwm "$HOME"/dwm
cp "$linkhere"/other/dwm-statusallmons-6.2.diff "$HOME"/dwm
ln -s "$linkhere"/other/config.h "$HOME"/dwm
cd "$HOME"/dwm
patch < dwm-statusallmons-6.2.diff
doas make clean install

# nnn plugins
# Remember to fix imgview and sxiv.desktop
curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh

# Vim Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
