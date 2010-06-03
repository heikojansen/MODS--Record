package MODS::extension;

use Moose;
use PRANG::Graph;

has_element 'elems' => (
    is => 'rw',
    isa => 'ArrayRef[PRANG::XMLSchema::Whatever]',
    xml_nodeName => {
        '*' => 'PRANG::XMLSchema::Whatever',
    },
    xml_min => 0,
);

sub root_element { 'extension' };

with qw( MODS::Role::TopLevelElement MODS::Node );

1;
