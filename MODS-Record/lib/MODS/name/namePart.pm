package MODS::name::namePart;

use Moose;
use PRANG::Graph;

with qw( MODS::Node );

has_attr 'type' => ( is => 'rw', isa => 'MODS::Type::namePartType', coerce => 1, );

has_element 'text' => ( is => 'rw', isa => 'PRANG::XMLSchema::token', xml_nodeName => '', coerce => 1, );

1;
