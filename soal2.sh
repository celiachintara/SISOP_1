awk -F , 'NR > 1 && max < $10 && $7 == "2012" { max = $1 }
END { print max }' WA_Sales_Products_2012-14.csv

echo""

awk -F, '{ if($1=="United States" && $7=="2012") x[$4] += $10;} 
END{for(i in x) print x[i]","i}' WA_Sales_Products_2012-14.csv | sort -n -r | head -n 3 | awk -F, '{print $2 , $1}'

echo ""

awk -F, '{ if($1=="United States" && $7=="2012" && 
( $4=="Personal Accessories" || $4=="Camping Equipment" || $4=="Outdoor Protection") ) x[$6] += $10;} 
END { for(i in x) print x[i]","i}' WA_Sales_Products_2012-14.csv | sort -n -r | head -n 3 | awk -F, '{print $2 , $1}'

echo ""
