package MODS::subject::geographicCode;

use Moose;
use PRANG::Graph;

has_element 'text' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    xml_nodeName => '',
    coerce => 1,
);

has_attr 'authority' => (
    is => 'rw',
    isa => 'MODS::Type::placeAuthority',
    coerce => 1,
);

with qw( MODS::Role::SingleArg MODS::Node );

1;
