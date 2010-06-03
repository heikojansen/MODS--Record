package MODS::physicalDescription::digitalOrigin;

use Moose;
use PRANG::Graph;

has_element 'text' => (
    is => 'rw',
    isa => 'MODS::Type::digitalOrigin',
    xml_nodeName => '',
);

with qw( MODS::Role::SingleArg MODS::Node );

1;
