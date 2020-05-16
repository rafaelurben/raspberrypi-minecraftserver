# Raspberry Pi 4 - Minecraft Server
Eine Hilfe für alle, welche einen Minecraftserver auf dem Raspberry Pi 4 (4 GB) hosten wollen.

# Zutaten

Du brauchst:

- Ein Raspberry Pi 4 mit 4 GB RAM
    - Root-Rechte
    - Internetverbindung
    - Pi als deinen Benutzernamen
    - Ein Ordner namens '/FTP/files' für Backups
    - **Kein** Ordner namens '/home/pi/minecraft'
- Ein Router, auf welchem du Port-Forwarding einrichten kannst

# Installation

Führe als erstes folgende Befehle aus:

```bash
cd /home/pi
wget -O setup-minecraft.sh https://raw.githubusercontent.com/rafaelurben/raspberrypi-minecraftserver/master/setup-minecraft.sh
sudo chmod +x setup-minecraft.sh
sudo ./setup-minecraft.sh
```

Als nächstes solltest du in deinen Router-Einstellungen dafür sorgen, dass der Port 25565 auf dein Raspberry Pi geleitet wird. (Port forwarding) Da dies für jeden Router unterschiedlich ist, muss man entweder selber herausfinden, wie das geht, oder im Internet danach suchen.


Ich empfehle dir ausserdem, automatische Backups einzurichten:

Bearbeite dazu deine crontab mit `crontab -e` und füge folgende Zeilen hinzu: (Dies sind nur empfohlene Werte und können nach belieben angepasst werden.)

```crontab
0 * * * * sudo /home/pi/minecraft/backup-live.sh
0 6 * * * sudo /home/pi/minecraft/restart.sh
* * * * * sudo /home/pi/minecraft/save-all.sh
```

Jetzt solltest du deinen Server mit `sudo /home/pi/minecraft/start.sh` starten können und musst, sofern er einmal läuft, nicht mehr dafür sorgen. Falls der Server abstürzt, sollte er versuchen, sich neu zu starten.

# Ende

Falls irgendetwas nicht funktioniert, kannst du gerne ein [Issue eröffnen](https://github.com/rafaelurben/raspberrypi-minecraftserver/issues).

Falls du mehr Ahnung von Bash Scripten hast als ich, kannst du gerne versuchen, die Scripts zu verbessern und einen Pull-Request zu eröffnen.
