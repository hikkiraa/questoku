#!/bin/bash

	echo -e "\033c"

	for i in {1..40}; do
        echo ""
    done
	
	cat diary.txt
	echo ""

	echo -n "[home]  /  [add]  [edit]  "
	read -n 1 option
	
	if [ $option = h ]; then
		
		echo -en "\r\033[0K"
		for i in {1..2}; do
		printf '\e[A\e[K'
	    done
		
		for i in {1..40}; do
	        echo ""
	    done
		cd ..
		./app.sh
		
	elif [ $option = e ]; then
	
		echo -en "\033c"
		echo "# leave two lines at the end #"; echo ""; echo ""
		echo "| your_text"
		echo ""
		echo "_ (last line here)"
		echo ""; echo ""
		echo -e -n "\e[7m[enter]\e[0m"
		echo " - continue "
		echo ""
		echo -en "\e[7m[x]\e[0m"
		echo " - cancel"; echo ""

		read -n 1 editing
		
		if [ $editing = x ]; then
		./diary.sh
		else
		nano +$(wc -l diary.txt)
		./diary.sh
		fi
		
	elif [ $option = a ]; then
	
	echo -en "\033c"
	echo "upload to my tech diary:"
		
	for i in {1..17}; do
	echo ""
	done
	
	echo -en "\e[7m[x]\e[0m"
	echo -n " - cancel"
	printf '\e[15A'
	echo -en "\r\033[0K"
	read text
	
	if [ $text = x ]; then
		
		./diary.sh
		
	else
	
	TZ=UTC-4 date +"%B %d  [%H:%M]" >> diary.txt
	echo $text >> diary.txt
	echo "" >> diary.txt
	
		./diary.sh
	
	fi
	
	else 
	
	./diary.sh
	
	fi