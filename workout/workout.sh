#!/bin/bash

sl() {
	sleep 0.005
	}

echo -e "\033c"

pullups_now=$(cat pullups.txt)
pushups_now=$(cat pushups.txt)
squats_now=$(cat squats.txt)

for i in {1..4}; do
	echo ""; sl
done

echo "          1 | pullups - "$pullups_now" "
	sl
echo ""
	sl
echo "             2 | pushups - "$pushups_now" "
	sl
echo""
	sl
echo "                3 | squats - "$squats_now" "
	sl

for i in {1..8}; do
	echo ""; sl
done

	echo -n "[home]  /  [1]  [2]  [3]  "
	read -n 1 option
	
	if [ $option = h ]; then
		
	echo -en "\033[1K"
	cd ..
	./app.sh

	elif [ $option = 1 ]; then
	
	echo -en "\033[1K"
	printf '\e[3A'
	
	echo ""
	echo "how strong are you.. _pullups "
	echo -n "leave "
	echo -e -n "\e[7m[x]\e[0m"
	echo -n " to cancel  "
	read pullups_add

		if [ $pullups_add = x ]; then
		./workout.sh

		else
		pullups_now=$(cat pullups.txt)
		pullups_total=$(($pullups_now + $pullups_add))
		echo $pullups_total > pullups.txt
		./workout.sh
		fi
		
	elif [ $option = 2 ]; then
	
	echo -en "\033[1K"
	printf '\e[3A'
	
	echo ""
	echo "how strong are you.. _pushups "
	echo -n "leave "
	echo -e -n "\e[7m[x]\e[0m"
	echo -n " to cancel  "
	read pushups_add

		if [ $pushups_add = x ]; then
		./workout.sh

		else
		pushups_now=$(cat pushups.txt)
		pushups_total=$(($pushups_now + $pushups_add))
		echo $pushups_total > pushups.txt	
		./workout.sh
		fi
		
	elif [ $option = 3 ]; then
	
	echo -en "\033[1K"
	printf '\e[3A'
	
	echo ""
	echo "how strong are you.. _squats "
	echo -n "leave "
	echo -e -n "\e[7m[x]\e[0m"
	echo -n " to cancel  "
	read squats_add

		if [ $squats_add = x ]; then
		./workout.sh

		else
		squats_now=$(cat squats.txt)
		squats_total=$(($squats_now + $squats_add))
		echo $squats_total > squats.txt
		./workout.sh
		fi
		
	else
	
	./workout.sh
	
	fi
