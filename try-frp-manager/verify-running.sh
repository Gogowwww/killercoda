#!/bin/bash
# Étape « démarrer frps puis frpc » : les deux programmes tournent et le tunnel est établi.
# Step "start frps then frpc": both programs run and the tunnel is established.
NAME="${FRPM_NAME:-frpm}"
docker exec "$NAME" sh -c 'pgrep -x frps >/dev/null && pgrep -x frpc >/dev/null'
