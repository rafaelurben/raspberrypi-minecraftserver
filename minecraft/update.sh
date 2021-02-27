#!/bin/bash
#
# Update ausführen

cd /home/pi/minecraft

echo "Update gestartet!"

echo "Update: Zur neusten Paperclip Version aktualisieren..."
wget -q -O paperclip.jar https://papermc.io/api/v1/paper/1.16.5/latest/download

echo "Update: Dateien von GitHub herunterladen..."
wget -q -O auto-restart.sh https://raw.githubusercontent.com/rafaelurben/raspberrypi-minecraftserver/master/minecraft/auto-restart.sh
wget -q -O backup-live.sh https://raw.githubusercontent.com/rafaelurben/raspberrypi-minecraftserver/master/minecraft/backup-live.sh
wget -q -O backup.sh https://raw.githubusercontent.com/rafaelurben/raspberrypi-minecraftserver/master/minecraft/backup.sh
wget -q -O command.sh https://raw.githubusercontent.com/rafaelurben/raspberrypi-minecraftserver/master/minecraft/command.sh
wget -q -O restart.sh https://raw.githubusercontent.com/rafaelurben/raspberrypi-minecraftserver/master/minecraft/restart.sh
wget -q -O start.sh https://raw.githubusercontent.com/rafaelurben/raspberrypi-minecraftserver/master/minecraft/start.sh
wget -q -O stop.sh https://raw.githubusercontent.com/rafaelurben/raspberrypi-minecraftserver/master/minecraft/stop.sh
wget -q -O update.sh https://raw.githubusercontent.com/rafaelurben/raspberrypi-minecraftserver/master/minecraft/update.sh

echo "Update: Dateien ausführbar machen..."
sudo chmod +x auto-restart.sh
sudo chmod +x backup-live.sh
sudo chmod +x backup.sh
sudo chmod +x command.sh
sudo chmod +x restart.sh
sudo chmod +x start.sh
sudo chmod +x stop.sh
sudo chmod +x update.sh

echo "Update beendet!"
