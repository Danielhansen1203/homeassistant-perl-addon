use Mojolicious::Lite;
use Mojolicious::Plugin::GraphQL;
use GraphQL::Schema;
use GraphQL::ObjectType;
use GraphQL::Field;
use GraphQL::Type::Scalar;

# Dummy SNMP data fetcher
sub get_snmp_data {
    return {
        uptime => "23 dage, 5 timer",
        hostname => "switch01.local",
        ports_up => 24,
        ports_down => 2,
    };
}

# Definér GraphQL types
my $snmp_data_type = GraphQL::ObjectType->new(
  name => 'SNMPData',
  fields => {
    uptime => { type => 'String' },
    hostname => { type => 'String' },
    ports_up => { type => 'Int' },
    ports_down => { type => 'Int' },
  },
);

# Definér Query type
my $query_root = GraphQL::ObjectType->new(
  name => 'Query',
  fields => {
    snmp_data => {
      type => $snmp_data_type,
      resolve => sub {
        my ($root, $args, $context, $info) = @_;
        return get_snmp_data();
      },
    },
  },
);

# Lav Schema korrekt
my $schema = GraphQL::Schema->new(query => $query_root);

# Registrer korrekt schema i plugin
plugin GraphQL => {
  schema => $schema,
};

app->start;
