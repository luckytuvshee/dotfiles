#!/bin/bash

if [ "$1" = "insert" ];then
	maim /home/luckytuvshee/Pictures/Screenshots/Screenshot_from_`date +%Y-%m-%d_%H-%M-%S`.png
elif [ "$1" = "print" ];then
	maim | xclip -selection clipboard -t image/png
elif [ "$1" = "sh_insert" ];then
	maim -s /home/luckytuvshee/Pictures/Screenshots/Screenshot_from_`date +%Y-%m-%d_%H-%M-%S`.png
elif [ "$1" = "sh_print" ];then
	maim -s | xclip -selection clipboard -t image/png
elif [ "$1" = "imgur" ];then
	maim -s | /home/luckytuvshee/.config/imgur.sh | xclip -selection c
fi

