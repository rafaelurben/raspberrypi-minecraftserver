#!/bin/bash
#
# Backup der Minecraftwelt erstellen während der Server läuft

cd /home/pi/minecraft

sudo ./command.sh "say Backup wird in 10 Sekunden erstellt. (ohne Neustart)"

sleep 10

sudo ./command.sh "say Backup wurde gestartet!"

sudo ./command.sh "save-all"
sleep 5s

sudo ./command.sh "say Backup wird verarbeitet..."

sudo ./backup.sh

sudo ./command.sh "say Backup wurde beendet!"
