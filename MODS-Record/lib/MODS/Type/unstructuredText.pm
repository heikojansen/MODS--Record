package MODS::Type::unstructuredText;

use Moose::Role;
use PRANG::Graph;

has_element 'text' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    xml_nodeName => '',
    coerce => 1,
);

has_attr 'displayLabel' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    coerce => 1,
);

has_attr 'type' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    coerce => 1,
);

with qw( MODS::Role::SingleArg MODS::Type::languageAttrGrp MODS::Type::simpleLinkAttrGrp );

1;
