#!/bin/bash
#
# Command ausführen, ohne in die Konsole zu gehen

sudo screen -Rd minecraft -X stuff "$* $(printf '\r')"
