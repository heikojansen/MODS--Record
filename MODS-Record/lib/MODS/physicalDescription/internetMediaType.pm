package MODS::physicalDescription::internetMediaType;

use Moose;
use PRANG::Graph;

with qw( MODS::Node );

has_element 'text' => (
    is => 'rw',
    isa => 'MODS::Type::internetMediaType',
    xml_nodeName => '',
);

1;
