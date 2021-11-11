#!/bin/sh

here="$PWD"

! [ -f "$here/install.sh" ] && return

doas pacman -S git gcc patch make neovim man-db fd ripgrep \
    linux-zen-headers nvidia-dkms xorg-xsetroot xorg-xinit \
    noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-liberation \
    ttf-iosevka-nerd chromium alsa-utils pkgstats feh mpv nnn \
    zathura-pdf-poppler zathura-cb xclip maim renameutils \
    ffmpegthumbnailer xdotool pkg-config

doas install -Dm 655 "$here/system/dwm_run" \
    "/usr/local/bin/"
doas install -Dm 644 "$here/system/vconsole.conf" \
    "/etc/"
doas install -Dm 644 "$here/system/ter-132n.psf.gz" \
    "/usr/share/kbd/consolefonts/"
doas install -Dm 644 "$here/system/50-mouse-acceleration.conf" \
    "/etc/X11/xorg.conf.d/"
doas ln -sf "/run/systemd/resolve/stub-resolv.conf" \
    "/etc/resolv.conf"

mkdir "$HOME/suckless"
git clone "https://github.com/tonijarjour/dwm" "$HOME/suckless/dwm"
cd "$HOME/suckless/dwm" || return
doas make clean install

git clone "https://github.com/tonijarjour/st" "$HOME/suckless/st"
cd "$HOME/suckless/st" || return
doas make clean install

git clone "git://git.suckless.org/dmenu" "$HOME/suckless/dmenu"
cd "$HOME/suckless/dmenu" || return
doas make clean install

git clone "git://git.suckless.org/tabbed" "$HOME/suckless/tabbed"
cd "$HOME/suckless/tabbed" || return
doas make clean install

git clone "https://github.com/nsxiv/nsxiv" "$HOME/suckless/nsxiv"
cd "$HOME/suckless/nsxiv" || return
doas make clean install
doas make install-desktop

# fix quitoncd, nsxiv.desktop, and tabbed nsxiv call with -a
mkdir -p "$HOME/.config/nnn/plugins"
curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh

ln -sf "$here/home/."* "$HOME/"
ln -sf "$here/config/"* "$HOME/.config/"
ln -s "/mnt/archive/"* "$HOME"
cp "/mnt/archive/Other/git-credentials" \
    "$HOME/.git-credentials"

echo "DONE"
