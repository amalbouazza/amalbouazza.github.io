# Site CV avec Docker et Jekyll

## Phases

### Phase de développement
Construisez l'image de développement :
Pour démarrer l'environnement de développement avec auto-régénération des fichiers :
docker run --rm -p 4000:4000 -v $(pwd):/srv/jekyll my-jekyll-site-dev

### Phase de build
docker run --rm -v $(pwd):/srv/jekyll my-jekyll-site-build


### Phase de run
docker run --rm -p 4000:4000 -v $(pwd)/_site:/usr/src/app my-jekyll-site-run
