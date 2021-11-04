#!/bin/sh

here="$PWD"

! [ -f "$here/install.sh" ] && return

doas pacman -S git neovim man-db diff-so-fancy nvidia-dkms linux-zen-headers \
    xorg-xinit xorg-xsetroot xorg-xrandr alacritty xclip sxhkd patch neofetch \
    alsa-utils dmenu gcc make feh ttc-iosevka-etoile ttc-iosevka noto-fonts \
    noto-fonts-cjk noto-fonts-emoji ttf-liberation chromium thunar tumbler \
    ffmpegthumbnailer mpv sxiv maim zathura-pdf-poppler zathura-cb nodejs \
    npm pkgstats lilypond ripgrep fd renameutils nnn exa

mkdir -p "$HOME/.config/nnn/plugins"

# Symlink all the stuff
ln -s "/mnt/archive/"* "$HOME/"
ln -sf "$here/home/."* "$HOME/"
ln -sf "$here/config/"* "$HOME/.config/"

# Turn off mouse acceleration
doas install -Dm 644 "$here/system/50-mouse-acceleration.conf" "/etc/X11/xorg.conf.d/"

# terminus console font
doas install -Dm 644 "$here/system/vconsole.conf" "/etc/"
doas install -Dm 644 "$here/system/ter-132n.psf.gz" "/usr/share/kbd/consolefonts/"

# systemd-resolvd dns
doas ln -sf "/run/systemd/resolve/stub-resolv.conf" "/etc/resolv.conf"

# git credentials
cp "/mnt/archive/Other/Data Files/git-credentials" "$HOME/.git-credentials"

# Install dwm
git clone "git://git.suckless.org/dwm" "$HOME/dwm"
cp "$here/system/dwm-statusallmons-6.2.diff" "$HOME/dwm"
ln -sf "$here/system/config.h" "$HOME/dwm"
cd "$HOME/dwm" || return
patch < "dwm-statusallmons-6.2.diff"
doas make clean install

# nnn
# Remember to fix imgview and sxiv.desktop
curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh

# Vim Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "DONE"
