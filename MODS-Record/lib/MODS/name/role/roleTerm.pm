package MODS::name::role::roleTerm;

use Moose;
use PRANG::Graph;

with qw( MODS::Node );

has_element 'text' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    xml_nodeName => '',
    coerce => 1,
);

has_attr 'authority' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    coerce => 1,
);

has_attr 'type' => (
    is => 'rw',
    isa => 'MODS::Type::codeOrText',
    coerce => 1,
);

1;