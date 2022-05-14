@input(){
	local __IN
	local __TIME='0.01'

	read -sr -n1 __IN
	INPUT_BUFFER+="${__IN}"; __IN=''

	read -sr -n3 -t${__TIME} __IN
	INPUT_BUFFER+="${__IN}"; __IN=''
}
@run_loop(){
	while :;do
		@map_print "${PLAYER_CURRENT_MAP_ID}" &
		(( SE_FS_CT-- ))

		@input
#		echo -en "\e[65;1HInput: ${INPUT_BUFFER}"

		case "${INPUT_BUFFER:0:1}" in
			(w|a|s|d) @move ;;
			(Q) break ;;
		esac

		INPUT_BUFFER="${INPUT_BUFFER:1}"
	done
}
