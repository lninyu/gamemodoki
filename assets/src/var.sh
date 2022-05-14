# shellcheck disable=SC2034
declare     FIELD_
declare     INPUT_BUFFER

# se
declare -i  SE_FS_COUNT=0

# map/world size
declare -ir WORLD_SIZE=64 # 64
declare -ir MAP_SIZE=64 # 64


# player
declare -ai PLAYER_POS=( 32 32 )
declare -ai PLAYER_W_POS=( 32 32 )
declare -i  PLAYER_CURRENT_MAP_ID=0
declare     PLAYER_ICON='\e[35m██\e[0m'


# map
declare -a  MAPS_WORLD
declare -a  MAPS
declare -ar MAPS_CHAR=(  # 88 chars
#    1   2   3   4   5   6   7   8
	'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' # 1
	'I' 'J' 'K' 'L' 'M' 'N' 'O' 'P' # 2
	'Q' 'R' 'S' 'T' 'U' 'V' 'W' 'X' # 3
	'Y' 'Z' 'a' 'b' 'c' 'd' 'e' 'f' # 4
	'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' # 5
	'o' 'p' 'q' 'r' 's' 't' 'u' 'v' # 6
	'w' 'x' 'y' 'z' '0' '1' '2' '3' # 7
	'4' '5' '6' '7' '8' '9' '+' '/' # 8
)
declare -ar MAPS_CHARSET=(
#    01   02   03   04   05   06   07   08
	'  ' '██' '  ' '  ' '  ' '  ' '  ' '  ' # 1
	'  ' '  ' '  ' '  ' '  ' '  ' '  ' '  ' # 2
	'  ' '  ' '  ' '  ' '  ' '  ' '  ' '  ' # 3
	'  ' '  ' '  ' '  ' '  ' '  ' '  ' '  ' # 4
	'  ' '  ' '  ' '  ' '  ' '  ' '  ' '  ' # 5
	'  ' '  ' '  ' '  ' '  ' '  ' '  ' '  ' # 6
	'  ' '  ' '  ' '  ' '  ' '  ' '  ' '  ' # 7
	'  ' '  ' '  ' '  ' '  ' '  ' '  ' '  ' # 8
)