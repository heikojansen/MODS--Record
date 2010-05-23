package MODS::part::extent;

use Moose;
use PRANG::Graph;

with qw( MODS::Node );

has_attr 'unit' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    coerce => 1,
);

has_element 'start' => (
    is => 'rw',
    isa => 'MODS::part::extent::start',
    xml_required => 0,
);

has_element 'end' => (
    is => 'rw',
    isa => 'MODS::part::extent::end',
    xml_required => 0,
);

has_element 'total' => (
    is => 'rw',
    isa => 'MODS::part::extent::total',
    xml_required => 0,
);

has_element 'list' => (
    is => 'rw',
    isa => 'MODS::part::extent::list',
    xml_required => 0,
);

1;
