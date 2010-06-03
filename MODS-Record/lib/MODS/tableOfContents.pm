package MODS::tableOfContents;

use Moose;
use PRANG::Graph;

sub root_element { 'tableOfContents' };

with qw( MODS::Role::TopLevelElement MODS::Type::unstructuredText MODS::Node );

1;
