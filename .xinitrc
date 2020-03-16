setxkbmap -layout us,ru -variant ,winkeys -option grp:alt_shift_toggle -option ctrl:nocaps &
batnot &
unclutter --timeout 1 --jitter 10 --ignore-scrolling &
transmission-daemon &
xmobar &
telegram-desktop &
feh --bg-scale ~/.archlinux.png &
exec xmonad
