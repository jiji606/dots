#!/usr/bin/env bash

dunst &
nitrogen --restore &
xset fp+ ~/.fonts
xset fp rehash
xcalib -gc 1.1 -a
xrdb ~/Xresources.d/Xresources
setxkbmap -layout pl,us
xmodmap .Xmodmap &
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
