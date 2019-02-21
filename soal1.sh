#!/bin/bash

no=1
for file in *.jpg  
	do  base64 -d "$file" | xxd -r > "pict"$no".jpg"
let no++
done
