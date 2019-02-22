#!/bin/bash

#enkripsi
date | awk -F ":" '{print $1}' | awk '{print $4}' > jam.txt
date | awk '{print $4}' | awk -F ":" '{print $1":"$2}' > ts.txt
date | awk '{print $3"-"$2"-"$6}' > date.txt
hour=$(cat jam.txt)
ts=$(cat ts.txt)
date=$(cat date.txt)

kecil=$(($hour + 97))
kecil=$(printf \\$(printf '%03o' $kecil))
bawah=$(printf '%d' "'$kecil")
let bawah--
bawah=$(printf \\$(printf '%03o' $bawah))
besar=$(($hour+65))
besar=$(printf \\$(printf '%03o' $besar))
atas=$(printf '%d' "'$besar")
let atas--
atas=$(printf \\$(printf '%03o' $atas))

cat /var/log/syslog | tr [a-z] ["$kecil"-za-"$bawah"] | tr [A-Z] ["$besar"-ZA-"$atas"] > "$ts $date".txt

#dekripsi

let hour--
dkecil=$((122-$hour))
dkecil=$(printf \\$(printf '%03o' $dkecil))
dbawah=$(printf '%d' "'$dkecil")
let dbawah--
dbawah=$(printf \\$(printf '%03o' $dbawah))
cbesar=$((90-$hour))
cbesar=$(printf \\$(printf '%03o' $cbesar))
datas=$(printf '%d' "'$cbesar")
let datas--
datas=$(printf \\$(printf '%03o' $datas))

cat "$ts $date".txt | tr [a-z] ["$dkecil"-za-"$dbawah"] | tr [A-Z] ["$cbesar"-ZA-"$datas"] > "$ts $date - dekripsi".txt
