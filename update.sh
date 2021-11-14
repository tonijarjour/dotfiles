#!/bin/sh

doas pacman -Syu

mkdir "$HOME/suckless"
git clone "https://aur.archlinux.org/libxft-bgra-git.git" \
    "$HOME/suckless/libxft-bgra"
cd "$HOME/suckless/libxft-bgra" || return
makepkg -si

git clone "https://aur.archlinux.org/nsxiv.git" "$HOME/suckless/nsxiv"
cd "$HOME/suckless/nsxiv" || return
makepkg -si

git clone "https://aur.archlinux.org/neovim-nightly-bin.git" \
    "$HOME/suckless/neovim"
cd "$HOME/suckless/neovim" || return
makepkg -si

git clone "https://aur.archlinux.org/nvim-packer-git.git" \
    "$HOME/suckless/packer"
cd "$HOME/suckless/packer" || return
makepkg -si
