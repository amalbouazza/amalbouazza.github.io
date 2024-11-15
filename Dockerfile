# Utiliser l'image officielle de Ruby comme base
FROM ruby:3.1

# Installer les dépendances pour Jekyll et le serveur
RUN apt-get update && apt-get install -y \
  build-essential \
  libssl-dev \
  libreadline-dev \
  zlib1g-dev \
  libsqlite3-dev \
  sqlite3 \
  nodejs \
  && rm -rf /var/lib/apt/lists/*

# Définir le répertoire de travail
WORKDIR /usr/src/app

# Copier uniquement les fichiers nécessaires pour installer les dépendances
COPY Gemfile Gemfile.lock ./

# Installer les gems nécessaires
RUN gem install bundler && bundle install

# Copier le reste des fichiers du projet
COPY . .

# Exposer le port 4000 pour le mode développement
EXPOSE 4000

# Commande par défaut : démarrage en mode développement
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
