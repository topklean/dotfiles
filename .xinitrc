# swap caps lock and esc
# xmodmap -e "clear lock"
# xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"
# xmodmap -e "keycode 66 = Escape NoSymbol Escape"

# keyboard speed
xset r rate 200 25

dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

vmware-user &
