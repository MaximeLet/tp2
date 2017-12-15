# Projet intégration continue pour le cours Analyse Informatique

Ce répertoire contient les fichiers nécessaire à l'automatisation d'un système
de déploiement continue pour des projets ionic 2.  Le système utilise 
des dockers pour l'implémentation des différentes parties requises.  Les principales
technologies utilisées incluent Jenkins, Docker, Ionic, Karma et Jasmine

# Utilisation sur un nouveau serveur
Configurer une machine docker et docker-compose.

## Installation


`
cd ~
git clone https://github.com/MaximeLet/tp2
`


## Construction des différents images

> cd ~/tp2
> docker-compose build

## Démarrer les dockers

> docker-compose up

# Configuration ssh
Le système suppose que ssh est pré-configurer pour une connection automatique avec Github.  Voir notes dans 
les fichiers Dockerfile pour plus d'information

# Utilisation sur serveurs existants
Le système présentment installé sur les deux serveurs suivants

## http://138.197.157.84 - serveur personnel temporaire
Se connecter via
> ssh root@138.197.157.84  (mot de passe disponible sur demande)
et utiliser les commandes ci-dessus

## http://159.203.21.122 - serveur fourni par le professeur

nom d'utilisateur: rescapes
La version recente du projet est pré-installé et les images sont à jour. 
Le projet est installé dans le répertoire ~rescapes/tp2

# Description des ports utilisés
7080: serveur jenkins
7000: serveur ionic pour la branche master (développement)
7001: serveur ionic pour la branche staging
7002: serveur ionic pour la branche prod





