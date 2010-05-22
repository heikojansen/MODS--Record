package MODS::classification;

use Moose;
use PRANG::Graph;

with qw( MODS::Type::languageAttrGrp MODS::Node );

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

has_attr 'displayLabel' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    coerce => 1,
);

has_attr 'edition' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    coerce => 1,
);


1;
