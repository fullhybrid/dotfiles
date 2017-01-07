#!/bin/sh

#EXT=HDMI1
#INT=eDP1

#ext_w=1920
#ext_h=1080
#int_w=3200
#off_w=1060

#xrandr --output "${INT}" --auto --pos ${off_w}x${ext_h} --scale 1x1  --output "${EXT}" --auto --scale 2x2 --pos 0x0
xrandr --output eDP1 --auto --pos 3840x0 --scale 1x1 --output HDMI1 --auto --scale 2x2 --pos 0x0 --fb 7040x2160

