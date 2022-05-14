# size: 64
# shellcheck disable=2207,2034
@maps_set(){
	local -i __COUNT=0
	local    __TEMP
	local    __DIR='assets/map'

	MAPS=()
	MAPS_WORLD=( $( cat "${__DIR}/world.txt" ) )

	for __TEMP in "${__DIR}"/*.txt;do
	    if [[ -f "${__TEMP}" ]];then
			MAPS[__COUNT++]="$( cat "${__TEMP}" )"
		else
			exit 1
		fi
	done

#	:> maps_cmp.txt
#	for i in "${MAPS[@]}";do
#		echo -n "${i}" \
#			| gzip -9cf \
#			| base64 \
#			>> maps_cmp.txt
#	done
}
@maps_gen(){

}