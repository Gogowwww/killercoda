#!/bin/bash
# Affiche l'avancement pendant que setup.sh prépare la démo / Shows progress while setup.sh prepares the demo
echo "Preparing the FRP Manager demo..."
while [ ! -f /tmp/finished ]; do sleep 1; done
echo "Ready."
