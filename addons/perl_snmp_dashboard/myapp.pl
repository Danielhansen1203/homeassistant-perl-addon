#!/usr/bin/env perl
use strict;
use warnings;
use Mojolicious::Lite;

get '/' => sub {
  my $c = shift;
  $c->render(text => 'Hello from Perl & Mojoliasdcos!');
};

app->start('daemon', '-l', 'http://*:3000');
