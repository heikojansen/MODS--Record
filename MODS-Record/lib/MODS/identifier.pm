package MODS::identifier;

use Moose;
use PRANG::Graph;

has_element 'text' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    xml_nodeName => '',
    coerce => 1,
);

has_attr 'type' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    coerce => 1,
);

has_attr 'displayLabel' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    coerce => 1,
);

has_attr 'invalid' => (
    is => 'rw',
    isa => 'MODS::Type::yes',
    coerce => 1,
);

sub root_element { 'identifier' };

with qw( MODS::Role::SingleArg MODS::Role::TopLevelElement MODS::Type::languageAttrGrp MODS::Node );

1;
