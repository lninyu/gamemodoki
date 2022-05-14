#!/usr/bin/env bash
source assets/src/srcal.sh

@main(){
	if (( BASH_VERSINFO[0] < 5 ));then
		echo "require bash 5 or later."
		echo "current bash version: ${BASH_VERSINFO[0]}"
		exit 1
	fi

	trap 'echo -en "\e[2J\e[1;1H"' EXIT
	@maps_set
	@run_loop
}

@main "${@}"