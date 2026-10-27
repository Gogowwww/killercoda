# Ajouter une deuxième instance

Une machine peut faire tourner plusieurs frps ou frpc. Voici comment en ajouter une :

1. Sur le **Tableau de bord**, cliquez sur **Nouvelle instance**.
2. Choisissez **frpc**, nommez-la `second` et (facultatif) copiez le premier frpc.
3. Créez-la, puis démarrez-la depuis sa carte.

La nouvelle instance a son propre fichier de configuration, son propre journal et des ports libres : elle n'entre jamais en collision avec la première. Sur une machine avec systemd, le panel crée le service correspondant ; ici, dans le conteneur, il lance simplement le programme.

Ouvrez **Ports** et utilisez le sélecteur d'instance en haut à droite pour passer d'un client à l'autre.

La page **Pare-feu** filtre les connexions vers les ports de frps avec nftables. Elle demande des privilèges supplémentaires (`NET_ADMIN`) que ce bac à sable ne donne pas : la page explique donc seulement ce qui manque.
