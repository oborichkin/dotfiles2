export DISPLAY=:0

# Ensure DBus is running for the user session
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval $(dbus-launch --sh-syntax --exit-with-session)
fi

systemctl --user import-environment DISPLAY DBUS_SESSION_BUS_ADDRESS

systemctl --user start graphical-session.target

nitrogen --restore

setxkbmap -layout us,ru -option 'grp:caps_toggle'
xmodmap -e "keycode 66 = ISO_Next_Group"
xset s off
xset -dpms
xset s noblank
xset r rate 210 40

dex -a &
exec i3
