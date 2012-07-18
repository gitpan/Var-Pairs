use 5.014;
use strict;
use Test::More tests => 13;

use Var::Pairs;

my %data;
@data{1..6} = ('a'..'f');

while (my $next = each_pair %data) {
    ok $next->key     ~~ %data              => 'key method correct';
    ok $next->value   eq $data{$next->key}  => 'value method correct';
    delete $data{$next->key};
}

ok !keys %data => 'Iterated all';

