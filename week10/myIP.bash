i="$(ip addr | grep "10.0.17.37/24" | cut -c 10-19 ) "



echo "$i"
