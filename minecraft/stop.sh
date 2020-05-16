#!/bin/sh
#
# Minecraft Server stoppen

cd /home/pi/minecraft

# Auto-neustart deaktivieren
sudo pkill auto-restart.sh

echo "Server wird in 30 Sekunden gestoppt!"

sudo ./command.sh "say Server wird in 30 Sekunden gestoppt!"
sleep 15s
sudo ./command.sh "say Server wird in 15 Sekunden gestoppt!"
sleep 5s
sudo ./command.sh "say Server wird in 30 Sekunden gestoppt!"
sleep 5s

echo "Server wird in 5 Sekunden gestoppt!"
sudo ./command.sh "say Server wird in 5 Sekunden gestoppt!"
sleep 1s

sudo ./command.sh "say Server wird in 4 Sekunden gestoppt!"
sleep 1s

sudo ./command.sh "say Server wird in 3 Sekunden gestoppt!"
sleep 1s

sudo ./command.sh "say Server wird in 2 Sekunden gestoppt!"
sleep 1s

sudo ./command.sh "say Server wird in 1 Sekunden gestoppt!"
sleep 1s

sudo ./command.sh "say Server wird gestoppt!"
sudo ./command.sh "stop"

echo "Server gestoppt! Warte 15s..."
sleep 15s

echo "Backup starten..."
sudo ./backup.sh

echo "Update starten..."
sudo ./update.sh
