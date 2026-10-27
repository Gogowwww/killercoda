# Démarrer frps et frpc

Sur le **Tableau de bord** :

1. cliquez sur **Démarrer** sur la carte **frps** (le serveur, côté public),
2. puis sur **Démarrer** sur la carte **frpc** (le client, côté « maison »).

Les deux cartes passent au vert (**En marche**). Le panel a lancé lui-même les deux programmes dans le conteneur : pas de systemd, pas de ligne de commande.

Le client pointe déjà vers le serveur (même adresse, même port, même jeton). Vous le voyez dans **Réglages, puis Configuration** en ouvrant le fichier de frpc.

Ouvrez les **Journaux** pour voir le client se connecter : *login to server success*.

Cliquez sur **Vérifier** quand les deux tournent.
