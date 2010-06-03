package MODS::recordInfo::languageOfCataloging::languageTerm;

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
    isa => 'MODS::Type::languageTermAuthority',
);

has_attr 'type' => (
    is => 'rw',
    isa => 'MODS::Type::codeOrText',
);

with qw( MODS::Role::SingleArg MODS::Node );

1;
