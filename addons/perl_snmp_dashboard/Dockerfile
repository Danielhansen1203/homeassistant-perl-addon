FROM perl:5.36

# Installer nødvendige OS-pakker
RUN apt-get update && apt-get install -y build-essential curl

# Installer cpanminus
RUN curl -L https://cpanmin.us | perl - App::cpanminus

# Installer korrekt GraphQL
RUN cpanm --notest --verbose TOBYINK/GraphQL-0.54.tar.gz

# Installer andre nødvendige moduler
RUN cpanm --notest Mojolicious Mojolicious::Plugin::GraphQL GraphQL::Plugin::Convert::OpenAPI Net::SNMP Moo Role::Tiny JSON::MaybeXS Try::Tiny Time::HiRes

# Sæt arbejdsmappe
WORKDIR /app

# Kopiér koden
COPY myapp.pl .

# Eksponer port
EXPOSE 3000

# Start server
CMD ["morbo", "-l", "http://0.0.0.0:3000", "myapp.pl"]
