#
# Source X-client resources file.
#
xrdb ~/.Xresources

#
# Keyboard settings. Swedish keyboard layout with ESC and CAPS_LOCK swaped. Also
# set a comfortable repeat delay and rate.
#
command -v "setxkbmap" && setxkbmap -option caps:escape && setxkbmap se
command -v "xset" && xset r rate 225 25

#
# Machine specific settings. Disable touchscreen on GLaDOS and enable 144 Hz
# monitor refresh rate on bumble.
#
[ "$(hostname)" = "GLaDOS" ] && xinput --disable "ELAN21EF:00 04F3:21EF"
[ "$(hostname)" = "bumble" ] && xrandr --rate 144

#
# Launch applets.
#
command -v "nm-applet" && nm-applet &
command -v "blueman-applet" && blueman-applet &
command -v "redshift" && redshift -t 5500:3500 &
command -v "volumeicon" && volumeicon &

#
# Set background image.
#
BACKGROUND_IMAGE="$HOME/.config/background.jpeg"
[ -f "$BACKGROUND_IMAGE" ] && feh --bg-scale "$BACKGROUND_IMAGE"

#
# Start windowing system. User should probably start gnome-sessions with a
# display manager if they can.
#
exec i3 --shmlog-size=26214400
#exec gnome-session
#exec startxfce4
