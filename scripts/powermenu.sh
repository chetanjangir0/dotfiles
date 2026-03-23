#!/usr/bin/env bash

options="shutdown\nreboot\nsuspend\nlogout"

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
