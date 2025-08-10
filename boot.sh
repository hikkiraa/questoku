#!/bin/bash

#resize terminal window
printf '\033[8;19;41t'

echo -en "\033c"
cat logo.txt	
sleep 0.5

sl() {
	sleep 0.005
	}
	
#start
	
echo ""; sl
echo ""; sl
echo "    [ tasks ]  [ finance ]  [ diary ]"; sl
echo ""; sl
echo "    [ stats ]  [ workout ]  [ about ]";sl
echo ""; sl
echo ""; sl
echo "                [ quit_ ]"; sl
echo ""; sl
echo "                 [ git ]"; sl
echo ""; sl
echo ""; sl
echo ""; sl
echo ""; sl
	
echo -n "enter the first letter.. "

read -n 1 app

if [ $app = a ]; then
./about.sh 

elif [ $app = s ]; then
cd status/
./status.sh 

elif [ $app = d ]; then
cd diary/
./diary.sh

elif [ $app = w ]; then
cd workout/
./workout.sh

elif [ $app = f ]; then
cd finance/
./finance.sh

elif [ $app = t ]; then
cd tasks/
./tasks.sh

elif [ $app = q ]; then
echo -en "\r\033[0K"
sl

for i in {1..18}; do
printf '\e[A\e[K'
sl
done
exit

elif [ $app = g ]; then
./git.sh

else
./app.sh

fi
