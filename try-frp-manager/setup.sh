#!/bin/bash
# Prépare la démo FRP Manager sur une machine Killercoda : le panel (image officielle,
# mode autonome, en HTTP), un compte « demo », un frpc déjà relié au frps du conteneur
# et un petit site web local à exposer. Les variables servent aux essais hors
# Killercoda (ports et noms déjà pris sur la machine de test).
# Prepares the FRP Manager demo on a Killercoda machine: the panel (official image,
# standalone mode, over HTTP), a "demo" account, an frpc already linked to the
# container's frps and a small local web site to expose. The variables are for trials
# outside Killercoda (ports and names already taken on the test machine).
set -eu

PANEL_PORT="${PANEL_PORT:-8765}"
FRPS_PORT="${FRPS_PORT:-7000}"
WEB_PORT="${WEB_PORT:-8000}"
NAME="${FRPM_NAME:-frpm}"
DATA="${FRPM_DATA:-/root/frpm-data}"
WWW="${FRPM_WWW:-/root/www}"
IMAGE="${FRPM_IMAGE:-ghcr.io/gogowwww/frp-manager:latest}"
USER_NAME="demo"
USER_PASS="frp-manager-demo"
READY="${FRPM_READY:-/tmp/finished}"

rm -f "$READY"
mkdir -p "$DATA/panel" "$WWW"
printf '<h1>Hello from my home service</h1>\n<p>This page is served by a small web server on this machine, and reached through frp.</p>\n' > "$WWW/index.html"

# Configuration du panel écrite avant le premier lancement : HTTP (Killercoda ne sait
# pas ouvrir de HTTPS), écoute sur toutes les adresses.
# Panel configuration written before the first start: HTTP (Killercoda cannot open
# HTTPS), listening on all addresses.
SECRET=$(head -c 32 /dev/urandom | od -An -tx1 | tr -d ' \n')
cat > "$DATA/panel/frp-manager.json" <<JSON
{
  "secret_key": "$SECRET",
  "bind_host": "0.0.0.0",
  "bind_port": $PANEL_PORT,
  "ssl_enabled": false,
  "username": "$USER_NAME"
}
JSON

docker rm -f "$NAME" >/dev/null 2>&1 || true
docker pull -q "$IMAGE" >/dev/null
docker run -d --name "$NAME" --network host -v "$DATA:/data" \
  -e FRP_MANAGER_PORT="$PANEL_PORT" -e FRPS_BIND_PORT="$FRPS_PORT" "$IMAGE" >/dev/null

# Attente du panel
for _ in $(seq 1 60); do
  [ "$(curl -s -o /dev/null -w '%{http_code}' "http://127.0.0.1:$PANEL_PORT/setup" || true)" = 200 ] && break
  sleep 1
done

# Compte de démonstration (même appel que la page de configuration initiale)
JAR=$(mktemp)
CSRF=$(curl -s -c "$JAR" "http://127.0.0.1:$PANEL_PORT/setup" | sed -n 's/.*name="csrf-token" content="\([^"]*\)".*/\1/p' | head -1)
curl -s -b "$JAR" -c "$JAR" -X POST -H 'Content-Type: application/json' -H "X-CSRF-Token: $CSRF" \
  -d "{\"username\":\"$USER_NAME\",\"password\":\"$USER_PASS\"}" "http://127.0.0.1:$PANEL_PORT/api/setup" >/dev/null
rm -f "$JAR"

# frpc relié au frps du conteneur (même jeton, même port) ; rien n'est démarré :
# c'est le premier exercice.
# frpc linked to the container's frps (same token, same port); nothing is started:
# that is the first exercise.
for _ in $(seq 1 30); do
  [ -f "$DATA/frp/frps.toml" ] && [ -f "$DATA/frp/frpc.toml" ] && break
  sleep 1
done
TOKEN=$(sed -n 's/^auth.token = "\(.*\)"/\1/p' "$DATA/frp/frps.toml" | head -1)
sed -i "s/^serverAddr = .*/serverAddr = \"127.0.0.1\"/; s/^serverPort = .*/serverPort = $FRPS_PORT/; s/^auth.token = .*/auth.token = \"$TOKEN\"/" "$DATA/frp/frpc.toml"

# Le « service à la maison » que les visiteurs vont exposer
nohup python3 -m http.server "$WEB_PORT" --bind 127.0.0.1 --directory "$WWW" >/dev/null 2>&1 &

touch "$READY"
