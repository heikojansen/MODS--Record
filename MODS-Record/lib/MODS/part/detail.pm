package MODS::part::detail;

use Moose;
use PRANG::Graph;
use Moose::Util::TypeConstraints;

use MODS::part::detail::number;
use MODS::part::detail::caption;
use MODS::part::detail::title;

with qw( MODS::Node );

has_attr 'type' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    coerce => 1,
);

has_attr 'level' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::positiveInteger',
    coerce => 1,
);

subtype 'MODS::part::detail::choice0' => as join('|', map { 'MODS::part::detail::' . $_ } qw( number caption title ) );

has_element 'elems' => (
    is => 'rw',
    isa => 'ArrayRef[MODS::part::detail::choice0]',
    xml_nodeName => {
        number  => 'MODS::part::detail::number',
        caption => 'MODS::part::detail::caption',
        title   => 'MODS::part::detail::title',
    },
);

1;
