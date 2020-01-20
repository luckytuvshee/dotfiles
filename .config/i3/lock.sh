#!/bin/bash

rectangles=" "

SR=$(xrandr --query | grep ' connected' | grep -o '[0-9][0-9]*x[0-9][0-9]*[^ ]*')
for RES in $SR; do
  SRA=(${RES//[x+]/ })
  CX=$((${SRA[2]} + 25))
  CY=$((${SRA[1]} - 30))
  rectangles+="rectangle $CX,$CY $((CX+300)),$((CY-80)) "
done

#icon=$HOME/Downloads/Xomu.jpg
#tmpbg=/tmp/screen.png
#scrot $tmpbg && convert $tmpbg -scale 10% -scale 1000% -draw "fill black fill-opacity 0.6 $rectangles" $tmpbg
#convert $tmpbg $icon -gravity center -composite -matte $tmpbg

config=/home/luckytuvshee/.config
tmpbg="$config/lockscreen_wallpaper.jpg"
tmpbg_edited="$config/lockscreen_wallpaper_edited.jpg"

# if there is not edited picture then, first resize and add rectangle
if [ ! -f $tmpbg_edited ]; then
	res=$(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/')
	convert "$tmpbg" -resize "$res""^" -gravity center -extent "$res" "$tmpbg_edited"
	convert $tmpbg_edited -draw "fill black fill-opacity 0.6 $rectangles" $tmpbg_edited
fi

insidecolor=00000000
ringcolor=ffffffff
keyhlcolor=d23c3dff
bshlcolor=d23c3dff
separatorcolor=00000000
insidevercolor=00000000
insidewrongcolor=d23c3dff
ringvercolor=ffffffff
ringwrongcolor=ffffffff
verifcolor=ffffffff
timecolor=ffffffff
datecolor=ffffffff
loginbox=00000066
locktext='Type password to unlock'
font='Iosevka'

i3lock -i $tmpbg_edited \
		--timepos='x+110:h-70' \
		--datepos='x+48:h-45' \
		--clock --date-align 1 --datestr "$locktext" \
		--insidecolor=$insidecolor --ringcolor=$ringcolor --line-uses-inside \
		--keyhlcolor=$keyhlcolor --bshlcolor=$bshlcolor --separatorcolor=$separatorcolor \
		--insidevercolor=$insidevercolor --insidewrongcolor=$insidewrongcolor \
		--ringvercolor=$ringvercolor --ringwrongcolor=$ringwrongcolor --indpos='x+280:h-70' \
		--radius=20 --ring-width=4 --veriftext='' --wrongtext='' \
		--verifcolor="$verifcolor" --timecolor="$timecolor" --datecolor="$datecolor" \
		--noinputtext='' --force-clock $lockargs --time-font=$font --date-font=$font \
		--datesize=16 --pass-media-keys

# take screenshot of lockscreen
# sleep 2
# maim ~/Pictures/Screenshots/Screenshot_from_`date +%Y-%m-%d_%H-%M-%S`.png