# Ouvrir un port public

Une petite page web est servie sur cette machine, sur le port `8000` : elle représente votre service à la maison. Rendons-la accessible depuis « Internet » à travers frp.

1. Dans le panel, ouvrez **Ports** et cliquez sur **Ouvrir un port**.
2. Nommez-le **web**, choisissez **TCP**.
3. Service local : adresse `127.0.0.1`, port `8000`.
4. Port public : `20000`.
5. Cliquez sur **Appliquer**, puis enregistrez (le panel redémarre frpc pour vous).

Ouvrez maintenant **[le port public]({{TRAFFIC_HOST1_20000}})** : vous voyez *Hello from my home service*, servi à travers le tunnel frp.

Essayez le type **TCP + UDP** pour un autre port : le panel écrit les deux tunnels et les affiche sur une seule ligne.

Cliquez sur **Vérifier** quand la page répond.
