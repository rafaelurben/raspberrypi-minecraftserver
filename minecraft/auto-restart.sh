#!/bin/bash
#
# Server im Falle eines Absturzes automatisch neustarten

cd /home/pi/minecraft

datum="$(date '+%d.%m.%Y %H:%M:%S')"

echo "${datum} - Warte 5s, um dem Server etwas Zeit zu lassen."
sleep 5

while true
do
        datum="$(date '+%d.%m.%Y %H:%M:%S')"

        if pgrep -f "paperclip.jar" > /dev/null
        then
                echo "${datum} - Minecraft Server läuft"
                sleep 5
        else
                echo "${datum} - Minecraft Server scheint nicht mehr zu laufen! Neustarten..."
                sudo ./start.sh
                break
        fi
done
