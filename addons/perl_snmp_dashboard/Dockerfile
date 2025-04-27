FROM perl:5.36

# Installer App::cpanminus
RUN curl -L https://cpanmin.us | perl - App::cpanminus

# Lav en mappe kun til CPAN-moduler (separat lag)
WORKDIR /usr/src/perl-deps

# Kopiér en "cpanfile" (liste over moduler vi vil installere)
COPY cpanfile .

# Installer alle nødvendige moduler (cacher her)
RUN cpanm --installdeps .

# Skift til app-folder
WORKDIR /app

# Kopiér app-kode til containeren
COPY myapp.pl .

# Eksponér port
EXPOSE 3000

# Start app med Morbo
CMD ["morbo", "-l", "http://0.0.0.0:3000", "myapp.pl"]
