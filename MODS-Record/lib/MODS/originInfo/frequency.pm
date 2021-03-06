package MODS::originInfo::frequency;

use Moose;
use PRANG::Graph;

has_attr 'authority' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    coerce => 1,
);

has_element 'text' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    xml_nodeName => '',
    coerce => 1,
);

with qw( MODS::Role::SingleArg MODS::Node );

1;
