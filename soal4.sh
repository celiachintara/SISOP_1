#!/bin/bash

#enkripsi
date | awk -F ":" '{print $1}' | awk '{print $4}' > jam.txt
date | awk '{print $4}' | awk -F ":" '{print $1":"$2}' > ts.txt
date | awk '{print $3"-"$2"-"$6}' > date.txt
hour=$(cat jam.txt)
ts=$(cat ts.txt)
date=$(cat date.txt)

small=$(($hour + 97))
small=$(printf \\$(printf '%03o' $small))
down=$(printf '%d' "'$small")
let down--

down=$(printf \\$(printf '%03o' $down))
big=$(($hour+65))
big=$(printf \\$(printf '%03o' $big))
up=$(printf '%d' "'$big")
let up--
up=$(printf \\$(printf '%03o' $up))

cat /var/log/syslog | tr [a-z] ["$small"-za-"$down"] | tr [A-Z] ["$big"-ZA-"$up"] > "$ts $date".txt

#dekripsi

let hour--
smalld=$((122-$hour))
smalld=$(printf \\$(printf '%03o' $smalld))
downd=$(printf '%d' "'$smalld")
let downd--
downd=$(printf \\$(printf '%03o' $downd))
bigd=$((90-$hour))
bigd=$(printf \\$(printf '%03o' $bigd))
upd=$(printf '%d' "'$bigd")
let upd--
upd=$(printf \\$(printf '%03o' $upd))

cat "$ts $date".txt | tr [a-z] ["$smalld"-za-"$downd"] | tr [A-Z] ["$bigd"-ZA-"$upd"] > "$ts $date - dekripsi".txt
