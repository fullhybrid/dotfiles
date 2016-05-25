#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xrandr --dpi 180
exec i3

xrdb -merge ~/.Xresources
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
