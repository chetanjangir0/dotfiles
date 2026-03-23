#!/usr/bin/env bash

options="shutdown\nreboot\nsuspend\nlogout"

chosen=$(echo -e "$options" | rofi -dmenu -p "Power")

case "$chosen" in
    shutdown)
        systemctl poweroff
        ;;
    reboot)
        systemctl reboot
        ;;
    suspend)
        systemctl suspend
        ;;
    logout)
        swaymsg exit
        ;;
esac
