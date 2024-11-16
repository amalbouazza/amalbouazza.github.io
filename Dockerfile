# Utiliser une image Ruby
FROM ruby:3.1

# Installer les dépendances nécessaires
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

# Copier les fichiers nécessaires
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

# Copier tout le projet dans le conteneur
COPY . .

# Exposer le port pour Jekyll
EXPOSE 4000

# Commande pour lancer Jekyll
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
