### Hier Weltnamen anpassen

worldsavename="advmap"

###

datum="$(date '+%Y-%m-%d--%H-%M')"
name="${worldsavename}-${datum}.tar.gz"

echo "Backup gestartet!"
echo "Ordner kopieren..."

cd /home/pi/minecraft
sudo cp -R "/home/pi/minecraft/${worldsavename}" "/home/pi/minecraft/${worldsavename}-backup"
sudo cp -R "/home/pi/minecraft/${worldsavename}_nether/DIM-1" "/home/pi/minecraft/${worldsavename}-backup/DIM-1" 2>/dev/null
sudo cp -R "/home/pi/minecraft/${worldsavename}_the_end/DIM1" "/home/pi/minecraft/${worldsavename}-backup/DIM1" 2>/dev/null

echo "Ordner kopiert!"
echo "Ordner komprimieren..."

sudo tar czf "${name}" "${worldsavename}-backup"
sudo mv "/home/pi/minecraft/${name}" "/home/pi/FTP/files"
sudo rm -rf "${worldsavename}-backup"

echo "Ordner komprimiert!"
echo "Backup beendet!"
