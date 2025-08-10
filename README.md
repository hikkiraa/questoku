

## basic apps without distractions / ads / subscriptions


![Image alt](https://github.com/hikkiraa/questoku/blob/main/image.PNG?raw=true)

clone the repository and grant execution permissions to the scripts `chmod +x *.sh`

but you have to adjust everything for yourself
- font size on mobile shell 
- there is an uncorrected problem with time zones in ish (e.g. my `TZ=UTC-4`)
- your currency and extra zeros in finance and the user's fields in stats
- your editor (my is nano)

initially, i tried to make the code readable, so it won't be a problem to find what you want to edit

**git is also integrated, without leaving the application, you can push and pull to your github, for example**


## extra for ish users like me


/tec/profile.d/ - there some .sh files that runs on startup

add 'qtk.sh'

    #!/bin/bash
    
    # to run the app from its folder
    alias qtk="boot.sh"

    # to run the app from ish startup
    cd questoku/
    ./boot.sh


## for pc (or whatever else you're working from)

**easily launch the app at any time**

add 'qtk.sh'

    #!/bin/bash
    
    # the scripts are working with questoku/ directory
    
    cd /home/[your_folder]/questoku/
    ./boot.sh

add to your **.bashrc** file

    alias qtk="/home/[your_folder]/qtk.sh"


## **have fun!**

