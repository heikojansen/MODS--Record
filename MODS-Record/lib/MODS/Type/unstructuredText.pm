package MODS::Type::unstructuredText;

use Moose::Role;
use PRANG::Graph;

with qw( MODS::Type::languageAttrGrp MODS::Type::simpleLinkAttrGrp );

has_element 'text' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    xml_nodeName => '',
);

has_attr 'displayLabel' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
);

has_attr 'type' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
);

1;
