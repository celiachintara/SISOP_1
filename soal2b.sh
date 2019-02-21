#!/usr/bin/awk
{
        variable=$(ps -ef | awk -F, 'NR > 1 && max < $10 && $7 == "2012" && $1=="United States" { max = $4 } END { print max }' WA_Sales_Products_2012-14.csv)
        echo $variable
        sementara=$(ps -ef | awk -F, 'NR>1 && max < $10 && $7 == "2012" && $1 == "United States" { max = $10 } END { print max }' WA_Sales_Products_2012-14.csv)
        variable2=$(ps -ef | awk -F, 'NR>1 && $10!=a && max < $10 && $7 == "2012" && $1 == "United States" { max = $10 } END { print max }' a="$sementara" WA_Sales_Products_2012-14.csv)
        variable3=$(ps -ef | awk -F, 'NR>1 && $10==a {b = $4} END {print b}' a="$variable2" WA_Sales_Products_2012-14.csv)
        echo $variable3
        sementara2=$(ps -ef | awk -F, 'NR>1 && max<$10 && $7=="2012" && $1="United States" {max=$10} END {print max}' WA_Sales_Products_2012-14.csv)
        variable4=$(ps -ef | awk -F, 'NR>1 && $10!=e && $10!=f && max < $10 && $7 == "2012" && $1 == "United States" { max = $10 } END { print max }' e="$variable2" f="$sementara" WA_Sales_Products_2012-14.csv)
        variable5=$(ps -ef | awk -F, 'NR>1 && $10==e {c = $4} END {print c}' e="$variable4" WA_Sales_Products_2012-14.csv)
        echo $variable5
}
