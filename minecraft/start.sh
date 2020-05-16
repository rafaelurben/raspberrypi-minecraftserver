#!/bin/bash
#
# Minecraft Server starten

cd /home/pi/minecraft

echo "Minecraft Server starten..."

/usr/bin/screen -dmS minecraft /usr/bin/java -jar -Xms2600M -Xmx2600M /home/pi/minecraft/paperclip.jar

echo "Minecraft Server wird im Hintergrund gestartet!"
echo "Befehl um in die Konsole zu gelangen: sudo screen -r minecraft."
echo "Um die Konsole wieder zu verlassen, drücke Ctrl+A, danach Ctrl+D"

sudo bash -c "sudo /home/pi/minecraft/auto-restart.sh > /home/pi/minecraft/auto-restart.log 2>&1 &"
