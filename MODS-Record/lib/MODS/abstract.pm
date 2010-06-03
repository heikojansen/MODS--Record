package MODS::abstract;

use Moose;
use PRANG::Graph;

sub root_element { 'abstract' };

with qw( MODS::Role::TopLevelElement MODS::Type::unstructuredText MODS::Node );

1;
