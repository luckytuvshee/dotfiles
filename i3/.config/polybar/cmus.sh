#!/bin/sh

if info=$(cmus-remote -Q 2> /dev/null); then
	status=$(echo "$info" | grep -v "set " | grep -v "tag " | grep "status " | cut -d ' ' -f 2)
	
	if [ "$status" = "playing" ] || [ "$status" = "paused" ] || [ "$status" = "stopped" ]; then
		title=$(echo "$info" | grep -v 'set ' | grep " title " | cut -d ' ' -f 3-)
		artist=$(echo "$info" | grep -v 'set ' | grep " artist " | cut -d ' ' -f 3-)
		position=$(echo "$info" | grep -v "set " | grep -v "tag " | grep "position " | cut -d ' ' -f 2)
		duration=$(echo "$info" | grep -v "set " | grep -v "tag " | grep "duration " | cut -d ' ' -f 2)

		if [ -z "${duration}" ]; then
    		echo ""
			return;
		fi

		
		if [ "$duration" -ge 0 ]; then
			pos_minutes=$(printf "%02d" $((position / 60)))
			pos_seconds=$(printf "%02d" $((position % 60)))

			dur_minutes=$(printf "%02d" $((duration / 60)))
			dur_seconds=$(printf "%02d" $((duration % 60)))

			info_string="| $pos_minutes:$pos_seconds / $dur_minutes:$dur_seconds" 
		fi

		# Check if length of artist greater than 40
		if [ ${#artist} -le 20 ]; then
			IFS=','
			read -a arr <<< "$artist"
			artist=$arr

			if [ ${#title} -ge 40 ]; then
				IFS=','
				read -a arr <<< "$title"
				title=$arr

				if [ "$title" = "$arr" ]; then
					IFS='('
					read -a arr2 <<< "$title"
					title=$arr2
				fi
			fi

		else
			if [ ${#title} -ge 30 ]; then
				IFS=','
				read -a arr <<< "$title"
				title=$arr

				if [ "$title" = "$arr" ]; then
					IFS='('
					read -a arr2 <<< "$title"
					title=$arr2
				fi
			fi
		fi

		
		info_string="$artist - $title $info_string"
		
		if [ "$status" = "playing" ]; then
			echo " $info_string"
		elif [ "$status" = "paused" ]; then
			echo " $info_string"
		elif [ "$status" = "stopped" ]; then 
			echo " $info_string"
		else
			echo ""
		fi
	else
		echo ""
	fi
else
	echo
fi