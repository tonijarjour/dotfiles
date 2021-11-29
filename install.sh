#!/bin/sh
here="$PWD"
! [ -f "$here/install.sh" ] && return

doas pacman -S autoconf automake gcc make pkgconf patch fakeroot git fd ripgrep \
    noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-iosevka-nerd ttf-liberation \
    neovim alacritty npm pkgstats alsa-utils chromium xclip dmenu maim feh \
    linux-zen-headers nvidia-dkms xorg-xinit xorg-xsetroot mpv zathura-cb \
    zathura-pdf-poppler man-db xorg-xrandr

git clone "git://git.suckless.org/dwm" "$HOME/dwm"
mkdir "$HOME/dwm/patches"
cd "$HOME/dwm/patches" || return
curl --remote-name-all "https://dwm.suckless.org/patches/{statusallmons/dwm-statusallmons-6.2.diff,attachbottom/dwm-attachbottom-6.2.diff,scratchpad/dwm-scratchpad-6.2.diff,alwayscenter/dwm-alwayscenter-20200625-f04cac6.diff,functionalgaps/dwm-functionalgaps-6.2.diff}"
cd "$HOME/dwm" || return
for i in "$HOME/dwm/patches/"*.diff;
    do patch < $i;
done
cp "$here/system/config.h" "$HOME/dwm"
doas make clean install

git clone "https://aur.archlinux.org/nvim-packer-git.git" "$HOME/packer"
cd "$HOME/packer" || return
makepkg -si

git clone "https://aur.archlinux.org/nsxiv.git" "$HOME/nsxiv"
cd "$HOME/nsxiv" || return
makepkg -si

doas mkdir -p "/usr/share/fonts/helvetica-neue/"
doas install "/mnt/archive/Other/helvetica-neue/"*.otf \
    "/usr/share/fonts/helvetica-neue/"
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
