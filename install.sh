#!/bin/sh

here="$PWD"

! [ -f "$here/install.sh" ] && return

doas pacman -S git gcc patch make automake autoconf pkg-config fakeroot

mkdir "$HOME/suckless"
git clone https://aur.archlinux.org/libxft-bgra-git.git "$HOME/suckless/libxft-bgra"
cd "$HOME/suckless/libxft-bgra" || return
makepkg -si

git clone https://aur.archlinux.org/nsxiv.git "$HOME/suckless/nsxiv"
cd "$HOME/suckless/nsxiv" || return
makepkg -si

doas pacman -S neovim man-db fd ripgrep nnn renameutils feh npm \
    ttf-iosevka-nerd chromium alsa-utils pkgstats dmenu xdotool \
    noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-liberation \
    linux-zen-headers nvidia-dkms xorg-xsetroot xorg-xinit mpv \
    zathura-pdf-poppler zathura-cb xclip maim ffmpegthumbnailer
   
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

git clone "https://github.com/tonijarjour/dwm" "$HOME/suckless/dwm"
cd "$HOME/suckless/dwm" || return
doas make clean install

git clone "https://github.com/tonijarjour/st" "$HOME/suckless/st"
cd "$HOME/suckless/st" || return
doas make clean install

git clone "git://git.suckless.org/tabbed" "$HOME/suckless/tabbed"
cd "$HOME/suckless/tabbed" || return
curl https://tools.suckless.org/tabbed/patches/autohide/tabbed-autohide-20201222-dabf6a2.diff > autohide.diff
patch < autohide.diff
doas make clean install

# fix quitoncd, nsxiv.desktop, and tabbed nsxiv call with -a
mkdir -p "$HOME/.config/nnn/plugins"
curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

ln -sf "$here/home/."* "$HOME/"
ln -sf "$here/config/"* "$HOME/.config/"
ln -s "/mnt/archive/"* "$HOME"
cp "/mnt/archive/Other/git-credentials" \
    "$HOME/.git-credentials"

echo "DONE"
