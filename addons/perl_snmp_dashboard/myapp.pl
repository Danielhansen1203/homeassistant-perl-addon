#!/usr/bin/env perl
use strict;
use warnings;
use Mojolicious::Lite;
use Mojolicious::Plugin::GraphQL;
use Net::SNMP;

get '/' => sub {
  my $c = shift;
  $c->render(text => 'Det ser ud til at det bare spiller!!');
};

sub get_snmp_data {
      return {
        uptime => "23 dage, 5 timer",
        hostname => "switch01.local",
        ports_up => 24,
        ports_down => 2,
    };
}

plugin GraphQL => {
    schema => {
        query => {
            fields => {
                snmp_data => {
                    type => {
                        uptime => 'String',
                        hostname => 'String',
                        ports_up => 'Int',
                        ports_down => 'Int',
                    },
                    resolve => sub {
                        my ($root, $args, $context, $info) = @_;
                        return get_snmp_data();
                    },
                },
            },
        },
    },
};

app->start('daemon', '-l', 'http://*:3000');
