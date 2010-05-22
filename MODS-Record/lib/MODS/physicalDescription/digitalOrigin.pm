package MODS::physicalDescription::digitalOrigin;

use Moose;
use PRANG::Graph;

with qw( MODS::Node );

has_element 'text' => (
    is => 'rw',
    isa => 'MODS::Type::digitalOrigin',
    xml_nodeName => '',
);

1;
