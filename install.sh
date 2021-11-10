#!/bin/sh

here="$PWD"

! [ -f "$here/install.sh" ] && return

doas pacman -S git gcc patch make neovim man-db fd ripgrep \
    linux-zen-headers nvidia-dkms xorg-xsetroot xorg-xinit \
    noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-liberation \
    ttf-iosevka-nerd alacritty chromium alsa-utils pkgstats \
    feh mpv zathura-pdf-poppler zathura-cb thunar tumbler \
    ffmpegthumbnailer xclip maim nnn renameutils

doas install -Dm 644 "$here/system/vconsole.conf" \
    "/etc/"
doas install -Dm 644 "$here/system/ter-132n.psf.gz" \
    "/usr/share/kbd/consolefonts/"
doas install -Dm 644 "$here/system/50-mouse-acceleration.conf" \
    "/etc/X11/xorg.conf.d/"
doas ln -sf "/run/systemd/resolve/stub-resolv.conf" \
    "/etc/resolv.conf"

git clone "git://git.suckless.org/dwm" "$HOME/dwm"
cd "$HOME/dwm" || return
doas make clean install

git clone "git://git.suckless.org/dmenu" "$HOME/dmenu"
cd "$HOME/dmenu" || return
doas make clean install

mkdir -p "$HOME/.config/nnn/plugins"
curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh

ln -sf "$here/home/."* "$HOME/"
ln -sf "$here/config/"* "$HOME/.config/"
cp "/mnt/archive/Other/git-credentials" \
    "$HOME/.git-credentials"

echo "DONE"
