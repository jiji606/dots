#!/usr/bin/env bash

dunst &

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

feh --bg-tile $HOME/Obrazy/tapety/nh-apluto-wide-9-17-15-final_0.png
xcalib -gc 1.1 -a
setxkbmap -layout pl,us
xsetroot -cursor_name left_ptr
xbanish &
mpd &
/usr/lib/polkit-kde-authentication-agent-1 &

echo $$ > /tmp/session_pid

xscreensaver -no-splash &

$HOME/Skrypty/touchpadtoggle.sh
$HOME/Skrypty/startup.sh &

while true ; do
	dwm &> .dwm.log
done
