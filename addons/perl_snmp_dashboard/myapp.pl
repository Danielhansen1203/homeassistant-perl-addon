#!/usr/bin/env perl
use strict;
use warnings;
use Mojolicious::Lite;

get '/' => sub {
  my $c = shift;
  $c->render(text => 'Det ser ud til at det bare spiller!!');
};

app->start('daemon', '-l', 'http://*:3000');
