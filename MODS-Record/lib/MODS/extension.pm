package MODS::extension;

use Moose;
use PRANG::Graph;

with qw( MODS::Node );

has_element 'elems' => (
    is => 'rw',
    isa => 'ArrayRef[PRANG::XMLSchema::Whatever]',
    xml_nodeName => {
        '*' => 'PRANG::XMLSchema::Whatever',
    },
    xml_min => 0,
);

1;
