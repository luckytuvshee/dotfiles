#!/bin/bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

rofi_command="rofi -theme $HOME/.config/rofi/power-menu.rasi"

uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown="Shutdown"
reboot="Reboot"
lock="Lock"
logout="Logout"

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 0)"

case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        /home/luckytuvshee/.config/polybar/scripts/lock.sh
        ;;
    # $suspend)
    #     mpc -q pause
    #     amixer set Master mute
    #     systemctl suspend
    #     ;;
    $logout)
        bspc quit
        ;;
esac