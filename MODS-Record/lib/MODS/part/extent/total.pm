package MODS::part::extent::total;

use Moose;
use PRANG::Graph;

with qw( MODS::Node );

has_element 'text' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::positiveInteger',
    xml_nodeName => '',
);

1;
