# Raspberry Pi 4 - Minecraft Server
Eine Hilfe für alle, welche einen Minecraftserver auf dem Raspberry Pi 4 (4 GB) hosten wollen.

# Zutaten

Du brauchst:

- Ein Raspberry Pi 4 mit 4 GB RAM
    - Root-Rechte
    - Internetverbindung
    - "pi" als Hauptbenutzer
    - Ein Ordner namens '/FTP/files' für Backups
    - **Kein** Ordner namens '/home/pi/minecraft'
- Ein Router, auf welchem du Port-Forwarding einrichten kannst

# Installation

Führe als erstes folgende Befehle aus:

```
cd /home/pi
wget -O update.sh https://raw.githubusercontent.com/rafaelurben/raspberrypi-minecraftserver/master/setup-minecraft.sh
sudo chmod +x setup-minecraft.sh
sudo ./setup-minecraft.sh
```
