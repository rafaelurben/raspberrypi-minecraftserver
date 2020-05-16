#!/bin/sh
# 
# Minecraft Server restart and pi reboot.

echo "Server wird in 30 Sekunden gestoppt!"
sudo screen -Rd minecraft -X stuff "say Server wird in 30 Sekunden gestoppt! $(printf '\r')"
sleep 15s
sudo screen -Rd minecraft -X stuff "say Server wird in 15 Sekunden gestoppt! $(printf '\r')"
sleep 5s
sudo screen -Rd minecraft -X stuff "say Server wird in 30 Sekunden gestoppt! $(printf '\r')"
sleep 5s
echo "Server wird in 5 Sekunden gestoppt!"
sudo screen -Rd minecraft -X stuff "say Server wird in 5 Sekunden gestoppt! $(printf '\r')"
sleep 1s
sudo screen -Rd minecraft -X stuff "say Server wird in 4 Sekunden gestoppt! $(printf '\r')"
sleep 1s
sudo screen -Rd minecraft -X stuff "say Server wird in 3 Sekunden gestoppt! $(printf '\r')"
sleep 1s
sudo screen -Rd minecraft -X stuff "say Server wird in 2 Sekunden gestoppt! $(printf '\r')"
sleep 1s
sudo screen -Rd minecraft -X stuff "say Server wird in 1 Sekunden gestoppt! $(printf '\r')"
sleep 1s
sudo screen -Rd minecraft -X stuff "say Server wird gestoppt! $(printf '\r')"
sudo screen -Rd minecraft -X stuff "stop $(printf '\r')"

echo "Server gestoppt! Warte 15s..."
sleep 15s

echo "Backup starten..."
sudo /home/pi/minecraft/backup.sh

echo "Zur neusten Paperclip Version aktualisieren..."
wget -q -O /home/pi/minecraft/paperclip.jar https://papermc.io/api/v1/paper/1.15.2/latest/download
