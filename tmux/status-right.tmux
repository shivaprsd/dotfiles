#!/bin/bash
# Fill tmux right status bar with useful info

battery_stat() {
	local pm_out=$(pmset -g ps)
	local bat_perc=$(grep -o '[0-9]\+%' <<< $pm_out)
	local time_rem=$(grep -o '[0-9]\+:[0-9]\+' <<< $pm_out)
	local chrg_state='↯'

	bat_perc=${bat_perc/\%/}
	time_rem=${time_rem#0:}
	[ "$time_rem" = '00' ] && time_rem=''
	grep -q 'AC' <<< $pm_out && chrg_state='↑'

	local bat_color
	if [ "$bat_perc" -lt 20 ]; then
		bat_color="red"
	elif [ "$bat_perc" -lt 70 ]; then
		bat_color="$1yellow"
	else
		bat_color="$1green"
	fi
	echo -n "#[default,fg=$bat_color]${time_rem/:/h }${time_rem:+m}\
		$chrg_state #[reverse]⌁$bat_perc% #[default]"
}

date_time() {
	echo -n "#[default,fg=$1blue]$(date +'%d %a %R')"
}

disk_free() {
	echo -n "#[default,fg=$1magenta]\
	$(df -H | grep '/dev' | awk 'END{print $4 "B #[reverse]⋯" $5}') "
}

load_avg() {
	local load=$(sysctl -nq vm.loadavg)
	load=${load#\{ }
	echo -n "#[default,fg=$1cyan] ⏛ ${load% \}}"
}

separator() {
	echo -n '#[default,fg=default] ⋮ '
}

# $1 => status extra; $2 => bright colors or not
date_time $2
separator
disk_free $2
