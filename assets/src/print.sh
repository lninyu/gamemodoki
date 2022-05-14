@map_print(){
	local -i __COUNT

	FIELD_="${MAPS[${1:-0}]}"

	for (( __COUNT=0; __COUNT<${#MAPS_CHARSET[@]}; __COUNT++ )){
	    FIELD_="${FIELD_//${MAPS_CHAR[__COUNT]}/${MAPS_CHARSET[__COUNT]}}"
	}

	# print map, print player
	echo -en "\e[1;1H${FIELD_}\n\e[${PLAYER_POS[0]};$((2*PLAYER_POS[1]-1))H${PLAYER_ICON}\e[65;1H\e[2K"
}