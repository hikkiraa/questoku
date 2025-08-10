#!/bin/bash

echo -en "\033c"

git status > output.txt

if grep "Changes not staged for commit" output.txt; then
echo -en "\033c"

rm output.txt
git status
for i in {1..5}; do
echo ""
done

echo -e -n "\e[7m \e[0m"
echo -n "  [home]  /  [p]-push  [l]-pull  "
read -n 1 git

else

rm output.txt
echo -en "\033c"
git status

for i in {1..13}; do
echo ""
done

echo -e -n "\e[7m \e[0m"
echo -n "  [home]  /  [p]-push  [l]-pull  "
read -n 1 git

fi

if [ $git = p ]; then
echo -en "\033c"
git add .
git commit . -m upd
git push

for i in {1..3}; do
echo ""
done

echo -e -n "\e[7m \e[0m"
echo -n "  [home]  "
read -n 1 

echo -en "\033c"
./app.sh

elif [ $git = l ]; then
echo -en "\033c"
git pull

for i in {1..3}; do
echo ""
done

echo -e -n "\e[7m \e[0m"
echo -n "  [home]  "
read -n 1 

echo -en "\033c"
./app.sh

elif [ $git = h ]; then
echo -en "\033c"
./app.sh

else
./git.sh

fi
