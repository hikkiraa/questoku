#!/bin/bash

#start

    echo -en "\033c"

    echo "_task manager"
    echo ""; echo ""
    echo "_notes"

    for i in {1..14}; do
    echo ""
    done

    echo -n "[home]  /  [t]  [n]  [more]  "
    read -n 1 n_or_t

#notes

    if [ $n_or_t = n ]; then

    echo -en "\033c"; echo "notes: "; echo ""
    grep "" notes.txt
    echo ""; echo ""; echo ""

    echo -n "[home]  /  [a]  [e]  [d]  [b]  "
    read -n 1 notes
    echo -en "\033c"

    #add
        if [ $notes = a ]; then
        
	    echo "new note:"
        for i in {1..17}; do
	    echo ""
	    done
    
	    echo -en "\e[7m[x]\e[0m"
	    echo -n " - cancel"
	    printf '\e[15A'
	    echo -en "\r\033[0K"
	    read note
    
	    if [ $note = x ]; then
	    ./tasks.sh
	    else
    
	    echo "- "$note >> notes.txt
        echo -en "\033c"; echo "notes: "; echo ""
        grep "" notes.txt
        echo ""; echo ""; echo ""

	    echo -n "[back]  "
	    read -n 1 back
    
	    ./tasks.sh
    
	    fi

    #edit
        elif [ $notes = e ]; then
        
        echo "# leave empty line at the end #"; echo ""; echo ""
		echo "| your_text"
		echo "_ (last line here)"
		echo ""; echo ""
		echo -e -n "\e[7m[enter]\e[0m"
		echo " - continue"
        echo ""
		echo -en "\e[7m[x]\e[0m"
		echo " - cancel"; echo ""

        read -n 1 editing
        
        if [ $editing = x ]; then
        ./tasks.sh
        else
        echo -en "\033c"

        nano +$(wc -l notes.txt)
        ./tasks.sh
        fi

    #delete
        elif [ $notes = d ]; then
        
        echo -en "\033c"; echo "notes: "; echo ""
        grep -n "" notes.txt
        echo ""; echo ""; echo ""

        echo "x - cancel"; echo ""
        echo -n "line number  "
        
        read line

        sed -i "${line}d" notes.txt

        echo -en "\033c"; echo "notes: "; echo ""
        grep "" notes.txt
        echo ""; echo ""; echo ""
	    echo -n "[back]  [d]  "
	    read -n 1 back

        while [ $back = d ]; do

        echo -en "\033c"; echo "notes: "; echo ""
        grep -n "" notes.txt
        echo ""; echo ""; echo ""

        echo "x - cancel"; echo ""
        echo -n "line number  "
        
        read line

        sed -i "${line}d" notes.txt

        echo -en "\033c"; echo "notes: "; echo ""
        grep "" notes.txt
        echo ""; echo ""; echo ""
	    echo -n "[back]  [d]  "
	    read -n 1 back

        done

	    ./tasks.sh

    #back
        elif [ $notes = b ]; then
        ./tasks.sh

    #home
        elif [ $notes = h ]; then
        cd ..
        ./app.sh

        else
        ./tasks.sh

        fi

#tasks

    elif [ $n_or_t = t ]; then

    echo -en "\033c"; echo "tasks: "; echo ""
    grep "" tasks.txt
    echo ""; echo ""

    completed=$(cat completed.txt | wc -l)
    echo -n "completed: "$completed
    echo ""; echo ""

    echo -n "[home]  /  [a]  [e]  [c]  [b]  "
    read -n 1 tasks

    #add
        if [ $tasks = a ]; then
        
        echo -en "\033c"
	    echo "new task:"
        for i in {1..17}; do
	    echo ""
	    done
    
	    echo -en "\e[7m[x]\e[0m"
	    echo -n " - cancel"
	    printf '\e[15A'
	    echo -en "\r\033[0K"
	    read task

        if [ $task = x ]; then
	    ./tasks.sh
	    else
    
	    echo "- "$task >> tasks.txt
        echo -en "\033c"; echo "tasks: "; echo ""
        grep "" tasks.txt
        echo ""; echo ""

	    echo -n "[back]  "
	    read -n 1 back
    
	    ./tasks.sh
    
	    fi

    #edit
        elif [ $tasks = e ]; then
        
        echo -en "\033c"
        echo "# leave empty line at the end #"; echo ""; echo ""
		echo "| your_text"
		echo "_ (last line here)"
		echo ""; echo ""
		echo -e -n "\e[7m[enter]\e[0m"
		echo " - continue "
        echo ""
		echo -en "\e[7m[x]\e[0m"
		echo " - cancel"; echo ""

        read -n 1 editing

        if [ $editing = x ]; then
        ./tasks.sh
        else
        echo -en "\033c"

        nano +$(wc -l tasks.txt)
        ./tasks.sh
        fi

    #complete
        elif [ $tasks = c ]; then

        echo -en "\033c"; echo "tasks: "; echo ""
        grep -n "" tasks.txt
        echo ""; echo ""; echo ""

        echo "x - cancel"; echo ""
        echo -n "line number  "
        
        read line

        sed -n "${line}p" tasks.txt >> completed.txt
        sed -i "${line}d" tasks.txt

        echo -en "\033c"; echo "tasks: "; echo ""
        grep "" tasks.txt
        echo ""; echo ""; echo ""
	    echo -n "[back]  [c]  "
	    read -n 1 back
    
        while [ $back = c ]; do

        echo -en "\033c"; echo "tasks: "; echo ""
        grep -n "" tasks.txt
        echo ""; echo ""; echo ""

        echo "x - cancel"; echo ""
        echo -n "line number  "
        
        read line

        sed -n "${line}p" tasks.txt >> completed.txt
        sed -i "${line}d" tasks.txt

        echo -en "\033c"; echo "tasks: "; echo ""
        grep "" tasks.txt
        echo ""; echo ""; echo ""
	    echo -n "[back]  [c]  "
	    read -n 1 back

        done

	    ./tasks.sh

    #back
        elif [ $tasks = b ]; then
        ./tasks.sh

    #home
        elif [ $tasks = h ]; then
        cd ..
        ./app.sh

        else
        ./tasks.sh

        fi

#home

    elif [ $n_or_t = h ]; then

    cd ..
    ./app.sh

#more

    elif [ $n_or_t = m ]; then

    echo -en "\033c"
	cat more.txt

    for i in {1..9}; do
	echo ""
    done

	echo -n "[back]  "
	read -n 1 back

	./tasks.sh

    else

    ./tasks.sh

    fi
