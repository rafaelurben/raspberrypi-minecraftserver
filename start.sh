#!/bin/bash
#
# Minecraft Server startup script using screen

echo "Minecraft Server starten... Command um in die Konsole zu gelangen: sudo screen -r minecraft."
echo "Zum minimieren, drücke Ctrl+A then Ctrl+D"

cd /home/pi/minecraft/
/usr/bin/screen -dmS minecraft /usr/bin/java -jar -Xms2600M -Xmx2600M /home/pi/minecraft/paperclip.jar

echo "Minecraft Server gestartet"

sudo rm -f /home/pi/minecraft/auto-restart.log
sudo bash -c "sudo /home/pi/minecraft/auto-restart.sh > /home/pi/minecraft/auto-restart.log 2>&1 &
