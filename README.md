# Site CV avec Docker et Jekyll

## Description
Ce projet utilise **Beautiful Jekyll** comme SSG pour créer un site web statique qui présente un CV. Les étapes de développement, de build, et de run sont entièrement réalisées dans un environnement Docker.

## Prérequis
Docker installé sur votre machine.

## Phases

### Phase de développement
Construisez l'image de développement :
docker build -t my-jekyll-site-dev -f Dockerfile .

Pour démarrer l'environnement de développement avec auto-régénération des fichiers :
docker run --rm -p 4000:4000 -v $(pwd):/srv/jekyll my-jekyll-site-dev


### Phase de build
Construisez l'image pour la génération de contenu statique 
docker build -t my-jekyll-site-build -f Dockerfile .

Générez les fichiers HTML statiques :
docker run --rm -v $(pwd):/srv/jekyll my-jekyll-site-build


### Phase de run
Construisez l'image pour la production :
docker build -t my-jekyll-site-run -f Dockerfile .

Lancez le site généré :
docker run --rm -p 4000:4000 -v $(pwd)/_site:/usr/src/app my-jekyll-site-run

Accédez au site à l'adresse : http://localhost:4000