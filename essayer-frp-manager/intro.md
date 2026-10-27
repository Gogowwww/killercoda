# Essayer FRP Manager

[FRP Manager](https://frp-manager.org/fr/) est un panel web pour **frp**, l'outil qui expose sur Internet, par un serveur public, un service qui tourne chez vous (ou sur un réseau privé).

Ici, vous avez le **vrai panel**, pas une maquette : l'image Docker officielle tourne déjà sur cette machine, avec un serveur frp (**frps**) et un client frp (**frpc**) à l'intérieur, et une petite page web qui joue le rôle de « votre service à la maison ».

En une dizaine de minutes, vous allez :

1. ouvrir le panel et vous connecter,
2. démarrer frps, puis frpc,
3. ouvrir un port public vers la page web et l'atteindre à travers frp,
4. créer un deuxième client avec **Nouvelle instance**.

La connexion est déjà prête : utilisateur **demo**, mot de passe **frp-manager-demo**.

> La machine et tout ce qu'elle contient disparaissent à la fin de la session. Rien ici ne touche vos propres serveurs.
