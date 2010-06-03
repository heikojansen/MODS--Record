package MODS::part::extent::total;

use Moose;
use PRANG::Graph;

has_element 'text' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::positiveInteger',
    xml_nodeName => '',
);

with qw( MODS::Role::SingleArg MODS::Node );

1;
