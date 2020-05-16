#!/bin/bash
# Ursprung: https://github.com/mtoensing/RaspberryPiMinecraft
# Bearbeitet: https://github.com/rafaelurben/raspberrypi-minecraftserver

echo "Minecraft Server installation script by Rafael Urben - V1.0"
echo "Neuste Version auf https://github.com/rafaelurben/raspberrypi-minecraftserver"

if [ -d "minecraft" ]; then
  echo "Wie es scheint, besteht bereits ein Minecraft-Ordner. Abgebrochen."
  exit 1
fi

echo "Pakete updaten..."
sudo apt-get update

echo "Neuste Version von Java OpenJDK 11 installieren..."
sudo apt-get install openjdk-11-jre-headless -y

echo "Screen installieren..."
sudo apt-get install screen -y

echo "Minecraft Ordner erstellen..."
mkdir minecraft
cd minecraft

echo "Update-Datei von GitHub herunterladen..."
wget -O update.sh https://raw.githubusercontent.com/rafaelurben/raspberrypi-minecraftserver/master/minecraft/update.sh

echo "Update-Datei ausführbar machen..."
sudo chmod +x update.sh

echo "Update-Datei ausführen"
sudo ./update.sh

echo "Minecraft Server starten um alle nötigen Dateien zu erstellen..."
java -jar -Xms800M -Xmx800M paperclip.jar

echo "EULA akzeptieren..."
echo eula=true > eula.txt

echo "Konfigurieren..."
read -p 'Beschreibung (motd): ' motd
echo "motd=$motd" >> server.properties
read -p 'Weltenname: ' worldsavename
echo "level-name=$worldsavename" >> server.properties

echo "Das Setup wurde abgeschlossen. Um den Server zu starten, gehe in den Minecraft-Ordner und gib 'sudo ./start.sh' ein."
echo "Bitte vergiss nicht, Port-Forwarding einzurichten! (Port 25565)"
