FROM perl:5.36

# Installer OS-værktøjer til at bygge CPAN moduler
RUN apt-get update && apt-get install -y build-essential

# Installer App::cpanminus
RUN curl -L https://cpanmin.us | perl - App::cpanminus

# Først installer GraphQL (nu virker det!)
RUN cpanm --quiet --notest GraphQL

# Installer resten af dine moduler
RUN cpanm --quiet --notest Mojolicious Mojolicious::Plugin::GraphQL GraphQL::Plugin::Convert::OpenAPI Net::SNMP Moo Role::Tiny JSON::MaybeXS Try::Tiny Time::HiRes

# Sæt arbejdsmappe
WORKDIR /app

# Kopier Perl app
COPY myapp.pl .

# Eksponer port
EXPOSE 3000

# Start server
CMD ["morbo", "-l", "http://0.0.0.0:3000", "myapp.pl"]
