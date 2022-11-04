xrandr --output DP-0 --primary --mode 3440x1440 --rate 144.00 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-0 --mode 1920x1080 --rate 60.00 --pos 3440x180 --rotate normal --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --off &
# Change keyboard layout and add alt+shift toggle
setxkbmap us,ca -variant multix grp:alt_shift_toggle &
feh --no-fehbg --bg-fill '/home/noa/.config/wallpaper/pixelart_night_stars_clouds_trees_cozy_PixelArtJourney.png' &
sxhkd &
exec dwm
