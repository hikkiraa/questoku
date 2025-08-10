![Image alt](https://github.com/hikkiraa/questoku/blob/main/topimg.PNG?raw=true)

_basic apps for my needs with fancy status rpg-like

_I made it for my smartphone by downloading ish (shell app for ios) and cloning my repository there. This way I can use everything I need anywhere and on any of my devices. and because of this, the window changes to 41x19 at startup

![Image alt](https://github.com/hikkiraa/questoku/blob/main/image.PNG?raw=true)

_now it's online, so you can use it on your own
clone the repository and grant execution permissions to the scripts (chmod +x *.sh)

_but you have to adjust everything for yourself like font size on mobile shells, and there is an uncorrected problem with time zones in ish, so look at the code and correct your time zone code (e.g. my TZ=UTC-4), your currency in finance and the user's fields in stats, your editor (my is nano). Initially, I tried to make the code readable, so it won't be a problem to find it

_git is also integrated, without leaving the application, you can push and pull to your github, for example


_extra for ish users like me:

/tec/profile.d/ - there some .sh files that runs on startup

add 'qtk.sh'
#!/bin/bash

#to run the app from its folder
alias qtk="boot.sh"
#you can add complete way to 'boot.sh' if you're using ish not only for app to reach it from any directory

#to run the app from ish startup
cd questoku/
./boot.sh


_for pc (or whatever else you're working from)

add 'qtk.sh'
#scripts working with questoku/ directory
#!/bin/bash
cd /home/hikkiraa/questoku/
./boot.sh

add to your .bashrc file

#easily launch the app at any time
alias qtk="/home/[your_folder]/qtk.sh"


have fun!
