package MODS::originInfo::place;

use Moose;
use PRANG::Graph;

with qw( MODS::Node );

has_element 'placeTerm' => (
    is => 'rw',
    isa => 'ArrayRef[MODS::originInfo::place::placeTerm]',
);

1;
