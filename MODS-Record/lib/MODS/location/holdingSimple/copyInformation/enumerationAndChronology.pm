package MODS::location::holdingSimple::copyInformation::enumerationAndChronology;

use Moose;
use PRANG::Graph;

with qw( MODS::Node );

has_element 'text' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    xml_nodeName => '',
    coerce => 1,
);

has_attr 'unitType' => (
    is => 'rw',
    isa => 'MODS::Type::unitType',
    coerce => 1,
);

1;
