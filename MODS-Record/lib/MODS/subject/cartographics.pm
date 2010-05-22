package MODS::subject::cartographics;

use Moose;
use PRANG::Graph;

with qw( MODS::Node );

has_element 'scale' => (
    is => 'rw',
    isa => 'MODS::subject::cartographics::scale',
    xml_min => 0,
);

has_element 'projection' => (
    is => 'rw',
    isa => 'MODS::subject::cartographics::projection',
    xml_min => 0,
);

has_element 'coordinates' => (
    is => 'rw',
    isa => 'ArrayRef[MODS::subject::cartographics::coordinates]',
    xml_min => 0,
);

1;
