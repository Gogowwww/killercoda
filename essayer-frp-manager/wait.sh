#!/bin/bash
# Affiche l'avancement pendant que setup.sh prépare la démo
echo "Préparation de la démo FRP Manager..."
while [ ! -f /tmp/finished ]; do sleep 1; done
echo "Prêt."
