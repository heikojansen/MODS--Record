package MODS::classification;

use Moose;
use PRANG::Graph;

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

sub root_element { 'classification' };

with qw( MODS::Role::SingleArg MODS::Role::TopLevelElement MODS::Type::languageAttrGrp MODS::Node );

1;
