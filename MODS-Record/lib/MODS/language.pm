package MODS::language;

use Moose;
use PRANG::Graph;

with qw( MODS::Node );

has_element 'languageTerm' => (
    is => 'rw',
    isa => 'ArrayRef[MODS::language::languageTerm]',
    xml_min => 1,
);

1;
