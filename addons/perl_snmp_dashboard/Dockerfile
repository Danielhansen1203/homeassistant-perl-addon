FROM perl:5.36

# Installer nødvendige OS-pakker
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libperl-dev \
    zlib1g-dev \
    curl \
    make \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Installer App::cpanminus
RUN curl -L https://cpanmin.us | perl - App::cpanminus

# Først installer GraphQL korrekt
RUN cpanm --notest --verbose GraphQL

# Så resten af modulerne
RUN cpanm --notest Mojolicious Mojolicious::Plugin::GraphQL Net::SNMP Moo Role::Tiny JSON::MaybeXS Try::Tiny Time::HiRes

# Arbejdsmappe
WORKDIR /app

# Kopier Perl app
COPY myapp.pl .

# Eksponer port
EXPOSE 3000

# Start server
CMD ["morbo", "-l", "http://0.0.0.0:3000", "myapp.pl"]
