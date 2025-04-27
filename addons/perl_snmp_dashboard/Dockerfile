FROM perl:5.36

# Installer OS-pakker til at bygge Perl moduler
RUN apt-get update && apt-get install -y build-essential libssl-dev libperl-dev zlib1g-dev curl make gcc

# Installer App::cpanminus
RUN curl -L https://cpanmin.us | perl - App::cpanminus

# Installer GraphQL (via plugin der sikrer ObjectType mm.)
RUN cpanm --notest --verbose GraphQL::Plugin::Convert::OpenAPI

# Installer Mojolicious + Plugin
RUN cpanm --notest Mojolicious Mojolicious::Plugin::GraphQL

# Installer Net::SNMP hvis du skal bruge SNMP
RUN cpanm --notest Net::SNMP

# Arbejdsmappe
WORKDIR /app

# Kopier kode
COPY myapp.pl .

# Eksponer port 3000
EXPOSE 3000

# Start server
CMD ["morbo", "-l", "http://0.0.0.0:3000", "myapp.pl"]
