FROM perl:5.36

# Installer App::cpanminus (mere stabil)
RUN curl -L https://cpanmin.us | perl - App::cpanminus

# Installer Mojolicious og Net::SNMP
RUN cpanm --quiet --notest Mojolicious Net::SNMP GraphQL GraphQL::Plugin::Convert::OpenAPI Mojolicious::Plugin::GraphQL Moo JSON::MaybeXS Role::Tiny


WORKDIR /app
COPY myapp.pl .

CMD ["perl", "myapp.pl"]
