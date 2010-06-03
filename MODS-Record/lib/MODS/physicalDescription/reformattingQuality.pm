package MODS::physicalDescription::reformattingQuality;

use Moose;
use PRANG::Graph;

has_element 'text' => (
    is => 'rw',
    isa => 'MODS::Type::reformattingQuality',
    xml_nodeName => '',
);

with qw( MODS::Role::SingleArg MODS::Node );

1;
