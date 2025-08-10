#!/bin/bash

#status

	sls() {
		sleep 0.005
	}

	echo -en "\r\033[0K"
	sls
	for i in {1..20}; do
	printf '\e[A\e[K'
	sls
	done

	status() {
	cd ..
		sls
	echo -n "          "
	TZ=UTC-4 date +"%a %b %d [ %I:%M%p ]"
		sls
	echo ""
		sls
	echo "          user          xxxxxxxx"
		sls
	echo ""
		sls
	echo "          work              xxxx"
		sls
	echo "          position        xxxxxx"
		sls
	echo ""
		sls

		cd finance/

	account_bank=$(cat account_bank.txt)
	account_cash=$(cat account_cash.txt)
	account_savings=$(cat account_savings.txt)
	balance=$(( $account_bank + $account_cash ))

	if [[ ${#balance} -eq 1 ]]; then
		space_b="   "
	elif [[ ${#balance} -eq 2 ]]; then
		space_b="  "
	elif [[ ${#balance} -eq 3 ]]; then
		space_b=" "
	elif [[ ${#balance} -eq 3 ]]; then
		space_b=""
	fi

	if [[ ${#account_savings} -eq 1 ]]; then
		space_s="   "
	elif [[ ${#account_savings} -eq 2 ]]; then
		space_s="  "
	elif [[ ${#account_savings} -eq 3 ]]; then
		space_s=" "
	elif [[ ${#account_savings} -eq 3 ]]; then
		space_s=""
	fi

	echo -n "          balance   ""$space_b"$balance; echo ".000 amd"
	sls
	echo -n "          savings       ""$space_s"$account_savings; echo " usd"
	sls

	echo ""
	sls

		cd ..
		cd tasks

	tasks=$(cat completed.txt | wc -l)
	if [[ ${#tasks} -eq 1 ]]; then
		space_t="   "
	elif [[ ${#tasks} -eq 2 ]]; then
		space_t="  "
	elif [[ ${#tasks} -eq 3 ]]; then
		space_t=" "
	elif [[ ${#tasks} -eq 4 ]]; then
		space_t=""
	fi

	echo -n "          tasks     ""$space_t"$tasks; echo "     pcs"
	sls

		cd ..

	files=$(ls -1RX | sed '/./!d' | sed '/:/d' | wc -l)
	if [[ ${#files} -eq 1 ]]; then
		space_f="   "
	elif [[ ${#files} -eq 2 ]]; then
		space_f="  "
	elif [[ ${#files} -eq 3 ]]; then
		space_f=" "
	elif [[ ${#files} -eq 4 ]]; then
		space_f=""
	fi

	echo -n "          files     ""$space_f"$files; echo "     pcs"
	sls

		cd diary/

	diary=$(cat diary.txt | grep ] | wc -l)
	if [[ ${#diary} -eq 1 ]]; then
		space_d="   "
	elif [[ ${#diary} -eq 2 ]]; then
		space_d="  "
	elif [[ ${#diary} -eq 3 ]]; then
		space_d=" "
	elif [[ ${#diary} -eq 4 ]]; then
		space_d=""
	fi

	echo -n "          diary     ""$space_d"$diary; echo "   notes"
	sls

		cd ..

	echo ""
	sls

		cd workout/

	pullups=$(cat pullups.txt)
	pushups=$(cat pushups.txt)
	squats=$(cat squats.txt)

	if [[ ${#pullups} -eq 1 ]]; then
		space_1="   "
	elif [[ ${#pullups} -eq 2 ]]; then
		space_1="  "
	elif [[ ${#pullups} -eq 3 ]]; then
		space_1=" "
	elif [[ ${#pullups} -eq 4 ]]; then
		space_1=""
	fi

	if [[ ${#pushups} -eq 1 ]]; then
		space_2="   "
	elif [[ ${#pushups} -eq 2 ]]; then
		space_2="  "
	elif [[ ${#pushups} -eq 3 ]]; then
		space_2=" "
	elif [[ ${#pushups} -eq 4 ]]; then
		space_2=""
	fi

	if [[ ${#squats} -eq 1 ]]; then
		space_3="   "
	elif [[ ${#squats} -eq 2 ]]; then
		space_3="  "
	elif [[ ${#squats} -eq 3 ]]; then
		space_3=" "
	elif [[ ${#squats} -eq 4 ]]; then
		space_3=""
	fi


	echo -n "          pullups   ""$space_1"$pullups
	echo "    reps"
	sls

	echo -n "          pushups   ""$space_2"$pushups
	echo "    reps"

	echo -n "          squats    ""$space_3"$squats
	echo "    reps"

		cd ..

	sls
	}
	
	status
	

#dump

	date_y=$(TZ=UTC-4 date +"%d%m")

	if [ $date_y = 3112 ]; then

		cd status/
		year_copy=$(cat copyprevent.txt)
		year=$(TZ=UTC-4 date +"%Y")

		if [ $year = $year_copy ]; then

		echo -n ""
		cd ..

		else

		echo ""
		echo -n "time to dump year? (y/n) "
		read -n 1 dump
		echo ""

			if [ $dump = y ]; then

			year=$(TZ=UTC-4 date +"%Y")
			echo "                   "$year >> dump.txt
			echo "" >> dump.txt
			status >> dump.txt
			cd status/

			echo $year > copyprevent.txt

			echo ""
			echo "yearly dump created."
			cd ..

			else
			
			echo -n ""
			cd ..

			fi

		fi

	else
	
	echo -n ""	

	fi

#end
	
	echo ""
	echo -n "          [home]  [archive]  "
	
	read -n 1 end
	
	if [ $end = h ]; then
		echo -en "\r\033[0K"
		sls
		for i in {1..20}; do
		printf '\e[A\e[K'
		sls
		done

		./app.sh

	elif [ $end = a ]; then
		echo -en "\033c"
		echo ""
		cd status/
		showdump=$(cat dump.txt)
		echo "$showdump"
		echo ""

		echo -n "[back]  "
	
		read -n 1 back
		./status.sh

	else
		cd status/
		./status.sh
	fi
