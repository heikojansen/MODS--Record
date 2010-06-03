package MODS::physicalDescription::internetMediaType;

use Moose;
use PRANG::Graph;

has_element 'text' => (
    is => 'rw',
    isa => 'MODS::Type::internetMediaType',
    xml_nodeName => '',
);

with qw( MODS::Role::SingleArg MODS::Node );

1;
