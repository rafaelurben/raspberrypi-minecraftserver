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

Bearbeite dazu die root crontab mit `sudo crontab -e` und füge folgende Zeilen hinzu: (Dies sind nur empfohlene Werte und können nach belieben angepasst werden.)

```bash
0 * * * * sudo /home/pi/minecraft/backup-live.sh
0 6 * * * sudo /home/pi/minecraft/restart.sh
* * * * * sudo /home/pi/minecraft/command.sh "save-all"
@reboot sudo ./home/pi/minecraft/start.sh
```

Erklärungen zur den oben sichtbaren Befehlen:

1. Mache jede volle Stunde ein live Backup. (ohne Server-Neustart)
2. Starte immer um 6 Uhr morgens den Server neu. (dabei wird automatisch ein Backup gemacht)
3. Führe jede Minute den `save-all`-Befehl aus. (damit der Datenverlust im Falle eines Serverabsturzes möglichst klein ist)
4. Starte den Server, wenn das Raspberry Pi gestartet wird.

Jetzt solltest du deinen Server mit `sudo /home/pi/minecraft/start.sh` starten können und musst, sofern er einmal läuft, nicht mehr dafür sorgen. Falls der Server abstürzt, sollte er sich automatisch neustarten.

Hinweis: Bitte benutze für alle Commands immer `sudo`, damit es keine "Permission Denied"-Fehlermeldungen gibt.

Falls du manuell irgendetwas am Server machen willst, stehen dir folgende Befehle zur Verfügung:

- `sudo ./stop.sh` - Stoppt den Server, macht ein Backup und führt ein Update aus (und deaktiviert die Absturzerkennung)
- `sudo ./start.sh` - Startet den Server (und aktiviert die Absturzerkennung)
- `sudo ./restart.sh` - Führt die beiden vorherigen Befehle nacheinander aus
- `sudo ./backup.sh` - Macht ein Backup
- `sudo ./backup-live.sh` - Macht ein Backup, während der Server online ist. (kündigt das Backup zuvor an, speichert die Welt mit `save-all` und informiert live im Chat über den Status des Backups)
- `sudo ./command.sh "COMMAND"` - Führe einen Command auf dem Server aus (OHNE `/``, um die die Konsole zu schreiben, benutze "say DEIN TEXT")
- `sudo ./update.sh` - Aktualisiert Paperclip (die Serversoftware) und alle Dateien aus diesem Repository.
- `sudo screen -r minecraft` - Gelange in die Konsole (zum Verlassen, drücke CTRL+A, danach CTRL+D)

# Ende

Falls irgendetwas nicht funktioniert, kannst du gerne ein [Issue eröffnen](https://github.com/rafaelurben/raspberrypi-minecraftserver/issues).

Falls du mehr Ahnung von Bash Scripten hast als ich, kannst du gerne versuchen, die Scripts zu verbessern und einen Pull-Request zu eröffnen.
