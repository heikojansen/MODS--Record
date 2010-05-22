package MODS::note;

use Moose;
use PRANG::Graph;

with qw( MODS::Type::unstructuredText MODS::Node );

has_attr 'ID' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    coerce => 1,
);

1;
