#!/bin/bash
#
# Update ausführen

cd /home/pi/minecraft

echo "Update gestartet!"

echo "Update: Zur neusten Paperclip Version aktualisieren..."
wget -q -O paperclip.jar https://papermc.io/api/v1/paper/1.16.5/latest/download

echo "Update: Dateien von GitHub herunterladen..."
sudo wget -q -O auto-restart.sh https://raw.githubusercontent.com/rafaelurben/raspberrypi-minecraftserver/master/minecraft/auto-restart.sh
sudo wget -q -O backup-live.sh https://raw.githubusercontent.com/rafaelurben/raspberrypi-minecraftserver/master/minecraft/backup-live.sh
sudo wget -q -O backup.sh https://raw.githubusercontent.com/rafaelurben/raspberrypi-minecraftserver/master/minecraft/backup.sh
sudo wget -q -O command.sh https://raw.githubusercontent.com/rafaelurben/raspberrypi-minecraftserver/master/minecraft/command.sh
sudo wget -q -O restart.sh https://raw.githubusercontent.com/rafaelurben/raspberrypi-minecraftserver/master/minecraft/restart.sh
sudo wget -q -O start.sh https://raw.githubusercontent.com/rafaelurben/raspberrypi-minecraftserver/master/minecraft/start.sh
sudo wget -q -O stop.sh https://raw.githubusercontent.com/rafaelurben/raspberrypi-minecraftserver/master/minecraft/stop.sh
sudo wget -q -O update.sh https://raw.githubusercontent.com/rafaelurben/raspberrypi-minecraftserver/master/minecraft/update.sh

echo "Update: Dateien ausführbar machen..."
sudo chmod +rwx auto-restart.sh
sudo chmod +rwx backup-live.sh
sudo chmod +rwx backup.sh
sudo chmod +rwx command.sh
sudo chmod +rwx restart.sh
sudo chmod +rwx start.sh
sudo chmod +rwx stop.sh
sudo chmod +rwx update.sh

echo "Update beendet!"
