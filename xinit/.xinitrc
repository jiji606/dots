#!/usr/bin/env bash

dunst &
nitrogen --restore &

if [[ -f $HOME/.Xmodmap ]] ; then
	xmodmap $HOME/.Xmodmap
fi

if [[ -d $HOME/.fonts ]] ; then
	xset fp+ $HOME/.fonts
	xset fp rehash
fi

if [[ -f $HOME/Xresources.d/Xresources ]] ; then
	xrdb $HOME/Xresources.d/Xresources
fi

xcalib -gc 1.1 -a
setxkbmap -layout pl,us
xsetroot -cursor_name left_ptr
xautolock -detectsleep \
	-time 15 \
	-locker lock \
	-notify 30 \
	-notifier "notify-send 'locking in 30s'" \
	-corners 0-00 \
	-cornerdelay 0 &
xbanish &
mpd &
sxhkd &

exec cwm
