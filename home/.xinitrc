#!/bin/sh
# ~/.xinitrc

[ -f "$HOME/.Xresources" ] && xrdb -merge "$HOME/.Xresources"

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

setxkbmap -layout us -variant altgr-intl -option nodeadkeys
setxkbmap -option caps:super

dt() { echo "$(date +" %a %b %d | %R ")"; }

while true; do
    xsetroot -name " $(dt) "
    sleep 12 
done &

exec dwm
