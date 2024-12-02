i="$(ip addr | grep -E "dynamic" | awk '{print $2}' | sed 's/\/24//g' )"

echo "$i"
