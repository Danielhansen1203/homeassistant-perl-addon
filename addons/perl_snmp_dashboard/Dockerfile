FROM perl:5.36

# Installer App::cpanminus
RUN curl -L https://cpanmin.us | perl - App::cpanminus

# Installer GraphQL først (vigtigt!)
RUN cpanm --quiet --notest GraphQL

# Installer derefter Mojolicious og alle andre moduler
RUN cpanm --quiet --notest Mojolicious Mojolicious::Plugin::GraphQL GraphQL::Plugin::Convert::OpenAPI Net::SNMP Moo Role::Tiny JSON::MaybeXS Try::Tiny Time::HiRes

# Sæt arbejdsmappe
WORKDIR /app

# Kopier applikationen ind
COPY myapp.pl .

# Åben port 3000
EXPOSE 3000

# Start applikationen med Morbo
CMD ["morbo", "-l", "http://0.0.0.0:3000", "myapp.pl"]
