package MODS::recordInfo::languageOfCataloging;

use Moose;
use PRANG::Graph;

with qw( MODS::Node );

has_element 'languageTerm' => (
    is => 'rw',
    isa => 'ArrayRef[MODS::recordInfo::languageOfCataloging::languageTerm]',
    xml_min => 1,
);

1;
