package MODS::typeOfResource;

use Moose;
use PRANG::Graph;

has_element 'text' => (
    is => 'rw',
    isa => 'MODS::Type::resource',
    xml_nodeName => '',
    coerce => 1,
);

has_attr 'collection' => (
    is => 'rw',
    isa => 'MODS::Type::yes',
    coerce => 1,
);

has_attr 'manuscript' => (
    is => 'rw',
    isa => 'MODS::Type::yes',
    coerce => 1,
);

sub root_element { 'typeOfResource' };

with qw( MODS::Role::TopLevelElement MODS::Role::SingleArg MODS::Node );

1;
