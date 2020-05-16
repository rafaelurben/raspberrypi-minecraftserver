#!/bin/bash

# Check if gedit is running
# -x flag only match processes whose name (or command line if -f is
# specified) exactly match the pattern. 

datum="$(date '+%d.%m.%Y %H:%M:%S')"

echo "${datum} - Warte 5s"
sleep 5

while true
do
        datum="$(date '+%d.%m.%Y %H:%M:%S')"

        if pgrep -f "paperclip.jar" > /dev/null
        then
                echo "${datum} Minecraft Server läuft"
                sleep 2
        else
                echo "${datum} Minecraft Server läuft nicht! Neustarten..."
                sudo /home/pi/minecraft/start.sh
                break
        fi
done
