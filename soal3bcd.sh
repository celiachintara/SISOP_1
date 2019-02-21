#!/bin/bash 

number=0
suffix=1
while test -e "password$suffix.txt" ;
do ((++number))
suffix="$( printf --  '%d' "$number")"
done

PASS_1=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)
echo "$PASS_1" >> "password$suffix.txt"

