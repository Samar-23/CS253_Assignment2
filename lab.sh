#!/bin/bash

if  [ $# -ne 2 ]
then
	echo "$# argument(s) provided instead of 2, try again."
        exit
elif [  ! -f "$1" ]
	then
		echo "Input File with specified name doesn't exit or isn't located in same directory as the script, try again."
		exit
else
	awk -F "\"*,\"*" '{ print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16 }' "$1" | cat > "$2"
	awk -F "\"*,\"*" '{ if ( $3 == "Bachelor'\''s" ) print $1 }' "$1" | cat >> "$2"
	awk -F "\"*,\"*" 'BEGIN { print "Geography : Average Admission Rate" ;  }{ geo = $6 ; rate[geo] = rate[geo] + $7 ; count[geo]++ ; } END { for (r in rate) { if ( r != "Geography" ) print  r, rate[r]/count[r] }  }' "$1" | cat >> "$2"
	sort -t, -nrk16 "$1" | head -n 5 | cat >> "$2"
fi

