### Hier Weltnamen anpassen

worldsavename="advmap"

###

datum="$(date '+%Y-%m-%d--%H-%M')"
name="${worldsavename}-${datum}.tar.gz"

sudo screen -Rd minecraft -X stuff "say Backup: Prozess wird in 10 Sekunden eingeleitet. (ohne Neustart) $(printf '\r')"
sleep 10
sudo screen -Rd minecraft -X stuff "say Backup: Gestartet! $(printf '\r')"
sudo screen -Rd minecraft -X stuff "say Backup: Welt speichern... $(printf '\r')"
sudo screen -Rd minecraft -X stuff "save-all $(printf '\r')"
sleep 5s
sudo screen -Rd minecraft -X stuff "say Backup: Welt gespeichert! $(printf '\r')"

sudo screen -Rd minecraft -X stuff "say Backup: Ordner kopieren... $(printf '\r')"

cd /home/pi/minecraft
sudo cp -R "/home/pi/minecraft/${worldsavename}" "/home/pi/minecraft/${worldsavename}-backup"
sudo cp -R "/home/pi/minecraft/${worldsavename}_nether/DIM-1" "/home/pi/minecraft/${worldsavename}-backup/DIM-1" 2>/dev/null
sudo cp -R "/home/pi/minecraft/${worldsavename}_the_end/DIM1" "/home/pi/minecraft/${worldsavename}-backup/DIM1" 2>/dev/null

sudo screen -Rd minecraft -X stuff "say Backup: Ordner kopiert! $(printf '\r')"
sudo screen -Rd minecraft -X stuff "say Backup: Ordner komprimieren... $(printf '\r')"

sudo tar czf "${name}" "${worldsavename}-backup"
sudo mv "/home/pi/minecraft/${name}" "/home/pi/FTP/files"
sudo rm -rf "${worldsavename}-backup"

sudo screen -Rd minecraft -X stuff "say Backup: Ordner komprimiert! $(printf '\r')"
sudo screen -Rd minecraft -X stuff "say Backup: Backup fertig! $(printf '\r')"
