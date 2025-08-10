#!/bin/bash

sl() {
	sleep 0.005
}

echo -en "\r\033[0K"
sl
for i in {1..12}; do
printf '\e[A\e[K'
sl
done

echo "       v1.0 | github.com/hikkiraa"

for i in {1..11}; do
	echo ""
	sl
	done

echo -n "                [ home_ ]"
read -n 1 about

echo -en "\r\033[0K"
sl
for i in {1..12}; do
printf '\e[A\e[K'
sl
done

./app.sh