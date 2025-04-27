FROM perl:5.36

# Installer OS-pakker
RUN apt-get update && apt-get install -y build-essential libssl-dev libperl-dev zlib1g-dev curl make gcc

# Installer App::cpanminus
RUN curl -L https://cpanmin.us | perl - App::cpanminus

# Installer GraphQL + nødvendige moduler
RUN cpanm --notest --verbose \
  GraphQL \
  Moo \
  Role::Tiny \
  JSON::MaybeXS \
  Try::Tiny \
  Sub::Util

# Installer Mojolicious og GraphQL Plugin
RUN cpanm --notest Mojolicious Mojolicious::Plugin::GraphQL

# Eventuelt SNMP senere
RUN cpanm --notest Net::SNMP

# Sæt arbejdsmappe
WORKDIR /app

# Kopiér app
COPY myapp.pl .

# Eksponer port
EXPOSE 3000

# Start server
CMD ["morbo", "-l", "http://0.0.0.0:3000", "myapp.pl"]
