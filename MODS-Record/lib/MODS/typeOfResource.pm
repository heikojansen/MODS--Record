package MODS::typeOfResource;

use Moose;
use PRANG::Graph;

with qw( MODS::Node );

has_element 'text' => (
    is => 'rw',
    isa => 'MODS::Type::resource',
    xml_nodeName => '',
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

1;
