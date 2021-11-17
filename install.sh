#!/bin/sh
here="$PWD"
! [ -f "$here/install.sh" ] && return

doas pacman -S autoconf automake gcc make pkgconf patch git fd ripgrep man-db \
    noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-iosevka-nerd ttf-liberation \
    neovim alacritty npm pkgstats alsa-utils chromium xclip dmenu maim feh \
    linux-zen-headers nvidia-dkms xorg-xinit xorg-xsetroot sxiv zathura-cb \
    zathura-pdf-poppler mpv

git clone "git://git.suckless.org/dwm" "$HOME/dwm"
cd "$HOME/dwm" || return
doas make clean install

git clone "https://aur.archlinux.org/nvim-packer-git.git" "$HOME/packer"
cd "$HOME/packer" || return
makepkg -si

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

curl --proto '=https' --tlsv1.2 -sSf "https://sh.rustup.rs" | sh

mkdir "$HOME/.config"
ln -sf "$here/home/."* "$HOME/"
ln -sf "$here/config/"* "$HOME/.config/"
ln -s "/mnt/archive/"* "$HOME"
cp "/mnt/archive/Other/git-credentials" \
    "$HOME/.git-credentials"

echo "DONE"
