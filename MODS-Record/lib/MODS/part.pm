package MODS::part;

use Moose;
use PRANG::Graph;
use Moose::Util::TypeConstraints;

use MODS::part::detail;
use MODS::part::extent;
use MODS::part::date;
use MODS::part::text;

with qw( MODS::Node );

has_attr 'ID' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    coerce => 1,
);

has_attr 'type' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    coerce => 1,
);

has_attr 'order' => (
    is => 'rw',
    isa => 'Int',
    coerce => 1,
);

subtype 'MODS::part::choice0' => as join('|', map { 'MODS::part::' . $_ } qw( detail extent date text ) );

has_element 'elems' => (
    is => 'rw',
    isa => 'ArrayRef[MODS::part::choice0]',
    xml_nodeName => {
        detail => 'MODS::part::detail',
        extent => 'MODS::part::extent',
        date => 'MODS::part::date',
        text => 'MODS::part::text',
    },
    xml_min => 0,
);

1;
