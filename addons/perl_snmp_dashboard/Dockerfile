FROM perl:5.36

# Installer App::cpanminus (mere stabil)
RUN curl -L https://cpanmin.us | perl - App::cpanminus

# Installer Mojolicious og Net::SNMP
RUN cpanm --quiet --notest Mojolicious Net::SNMP GraphQL Mojolicious::Plugin::GraphQL

WORKDIR /app
COPY myapp.pl .

CMD ["perl", "myapp.pl"]
