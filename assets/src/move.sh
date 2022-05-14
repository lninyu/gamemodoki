@move(){
	# shellcheck disable=2206
	local -a __MAPD=( ${MAPS[PLAYER_CURRENT_MAP_ID]} )
	local    __KEYS="wasd"
	local    __TMP0
	local    __TMP1=${INPUT_BUFFER//[!${__KEYS}]/}

#	if (( SE_FS_CT < 1 ));then
#		if (( ++SE_FS_COUNT % 2 == 0 ));then
#			afplay assets/sounds/fs0.wav &
#		else
#			afplay assets/sounds/fs1.wav &
#	    fi
#	    SE_FS_CT=6
#	fi

	while ((${#__TMP1}));do
		case ${__TMP1:0:1} in
			("${__KEYS:0:1}")
				__TMP0="${__MAPD[$((PLAYER_POS[0]-2))]:$((PLAYER_POS[1]-1)):1}"
				[[ ${PLAYER_POS[0]} -gt 1 && ${#__TMP0} -eq 1 && ${__TMP0} == "${MAPS_CHAR[0]}" ]] \
					&& ((--PLAYER_POS[0]))
				;;
			("${__KEYS:1:1}")
				__TMP0="${__MAPD[$((PLAYER_POS[0]-1))]:$((PLAYER_POS[1]-2)):1}"
				[[ ${PLAYER_POS[1]} -gt 1 && ${#__TMP0} -eq 1 && ${__TMP0} == "${MAPS_CHAR[0]}" ]] \
					&& ((--PLAYER_POS[1]))
				;;
			("${__KEYS:2:1}")
				__TMP0="${__MAPD[$((PLAYER_POS[0]))]:$((PLAYER_POS[1]-1)):1}"
				[[ ${PLAYER_POS[0]} -lt ${MAP_SIZE} && ${#__TMP0} -eq 1 && ${__TMP0} == "${MAPS_CHAR[0]}" ]] \
					&& ((++PLAYER_POS[0]))
				;;
			("${__KEYS:3:1}")
				__TMP0="${__MAPD[$((PLAYER_POS[0]-1))]:$((PLAYER_POS[1])):1}"
				[[ ${PLAYER_POS[1]} -lt ${MAP_SIZE} && ${#__TMP0} -eq 1 && ${__TMP0} == "${MAPS_CHAR[0]}" ]] \
					&& ((++PLAYER_POS[1]))
				;;
		esac;
		__TMP1=${__TMP1:1}
	done

	INPUT_BUFFER="${INPUT_BUFFER//[${__KEYS}]/}"
}