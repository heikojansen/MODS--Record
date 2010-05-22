package MODS::physicalDescription::reformattingQuality;

use Moose;
use PRANG::Graph;

with qw( MODS::Node );

has_element 'text' => (
    is => 'rw',
    isa => 'MODS::Type::reformattingQuality',
    xml_nodeName => '',
);

1;
