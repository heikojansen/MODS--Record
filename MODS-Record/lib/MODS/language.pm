package MODS::language;

use Moose;
use PRANG::Graph;

has_element 'languageTerm' => (
    is => 'rw',
    isa => 'ArrayRef[MODS::language::languageTerm]',
    xml_min => 1,
);

sub root_element { 'language' };

with qw( MODS::Role::TopLevelElement MODS::Node );

1;
