#!/usr/bin/env bash

options="Shutdown\nReboot\nSuspend\nLogout"

chosen=$(echo -e "$options" | rofi -dmenu -p "Power")

case "$chosen" in
    Shutdown)
        systemctl poweroff
        ;;
    Reboot)
        systemctl reboot
        ;;
    Suspend)
        systemctl suspend
        ;;
    Logout)
        swaymsg exit
        ;;
esac
