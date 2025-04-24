FROM perl:5.36

RUN cpanm Mojolicious Mojolicious::Plugin::GraphQL Net::SNMP

COPY run.sh /run.sh
RUN chmod +x /run.sh

COPY . /app
WORKDIR /app

CMD ["/run.sh"]
