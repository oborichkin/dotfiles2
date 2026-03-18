USERXSESSION="$XDG_CACHE_HOME/X11/xsession"
USERXSESSIONRC="$XDG_CAHCE_HOME/X11/xsessionrc"
ALTUSERXSESSION="$XDG_CACHE_HOME/X11/Xsession"
ERRFILE="$XDG_CACHE_HOME/X11/xsession-errors"

setxkbmap -layout us,ru
setxkbmap -option 'grp:win_space_toggle'
xset s off
xset -dpms
xset s noblank
xset r rate 210 40

dex -a &
exec i3
