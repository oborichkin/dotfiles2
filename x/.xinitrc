export DISPLAY=:0

# Ensure DBus is running for the user session
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval $(dbus-launch --sh-syntax --exit-with-session)
fi

systemctl --user import-environment DISPLAY DBUS_SESSION_BUS_ADDRESS

systemctl --user start graphical-session.target

exec i3
