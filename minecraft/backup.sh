#!/bin/bash
#
# Backup der Minecraftwelt erstellen

cd /home/pi/minecraft
backupsavefolder="/home/pi/FTP/files"

# Get Worldsavename
echo "Welt wird gesucht..."

worldsavename=""
while IFS= read -r line
do
    if [[ ${line} == "level-name="* ]]; then
        worldsavename=${line#"level-name="}
    fi
done < "server.properties"

if [ ${worldsavename} == "" ]; then
    echo "Fehler! In den Servereinstellungen wurde keinen Weltnamen festgelegt!"
    exit 1
else
    echo "Erfolg! Welt gefunden: ${worldsavename}"
fi

datum="$(date '+%Y-%m-%d--%H-%M')"
name="${worldsavename}-${datum}.tar.gz"

echo "Backup gestartet!"
echo "Ordner kopieren..."

sudo cp -R "${worldsavename}" "${worldsavename}-backup"
sudo cp -R "${worldsavename}_nether/DIM-1" "${worldsavename}-backup/DIM-1" 2>/dev/null
sudo cp -R "${worldsavename}_the_end/DIM1" "${worldsavename}-backup/DIM1" 2>/dev/null

echo "Ordner kopiert!"
echo "Ordner komprimieren..."

sudo tar czf "${name}" "${worldsavename}-backup"
sudo mv "${name}" "${backupsavefolder}"
sudo rm -rf "${worldsavename}-backup"

echo "Ordner komprimiert!"
echo "Backup beendet!"
