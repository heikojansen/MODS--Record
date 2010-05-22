package MODS::location::holdingSimple;

use Moose;
use PRANG::Graph;

with qw( MODS::Node );

has_element 'copyInformation' => (
    is => 'rw',
    isa => 'ArrayRef[MODS::location::holdingSimple::copyInformation]',
    xml_min => 1,
);

1;
