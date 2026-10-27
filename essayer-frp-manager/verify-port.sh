#!/bin/bash
# Étape « ouvrir un port » : le site local répond sur le port public ouvert par frp.
# Step "open a port": the local site answers on the public port opened through frp.
REMOTE_PORT="${REMOTE_PORT:-20000}"
curl -fs "http://127.0.0.1:$REMOTE_PORT/" | grep -q "Hello from my home service"
