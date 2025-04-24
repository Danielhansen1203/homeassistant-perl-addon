#!/usr/bin/env perl
use Mojolicious::Lite;
use lib 'lib';
use MyApp::Device::Switch;

# Basic route
get '/' => {text => 'Perl SNMP Dashboard is running 🐪'};

# REST endpoint for switch ports
get '/api/switch' => sub {
    my $c = shift;
    my $switch = MyApp::Device::Switch->new(
        host      => '192.168.1.1',      # <- Skift til din switches IP
        community => 'public'           # <- Eller dit community string
    );

    my $ports = eval { $switch->get_port_names };
    if ($@) {
        $c->render(status => 500, json => {error => "SNMP error: $@"});
    } else {
        $c->render(json => $ports);
    }
};

# GraphQL plugin
plugin GraphQL => {
  schema => {
    query => {
      switchPorts => {
        type => ['Port'],
        resolve => sub {
          my $switch = MyApp::Device::Switch->new(
              host => '192.168.1.1',
              community => 'public'
          );
          my $ports = $switch->get_port_names;
          return [ map { { oid => $_, name => $ports->{$_} } } keys %$ports ];
        }
      }
    }
  },
  types => {
    Port => {
      oid  => 'String',
      name => 'String'
    }
  }
};

app->start;
