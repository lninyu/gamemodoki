# shellcheck disable=SC2155

declare    LOG_ENABLE
declare    LOG_LOGFILE="log/$( date '+%Y%m%d%H%M%S' ).log"
declare -i LOG_COUNT=0 # do not edit.
declare -i LOG_COUNT_DIGIT_SIZE=8

[[ -d log ]] || mkdir log

function @log(){
	${LOG_ENABLE:-false} || return 0

	local    __TEMP
	local    __TYPE
	local -r __FILE="${LOG_LOGFILE:-${SCRIPT_NAME}.log}"

	((++LOG_COUNT))

	case ${1:0:2} in
		(-e) __TYPE='[ERROR] '; shift ;;
		(-f) __TYPE='[FATAL] '; shift ;;
		(-w) __TYPE='[WARN]  '; shift ;;
		(-i) __TYPE='[INFO]  '; shift ;;
	esac

	for __TEMP in "${@}";do
		printf \
			"[%0${LOG_COUNT_DIGIT_SIZE:-8}d:%-10s] ${__TYPE}%s\n" \
			"$((LOG_COUNT))"   \
			"${FUNCNAME[1]#@}" \
			"${__TEMP}"        \
			>> "${__FILE}"
	done
}