package MODS::name::role;

use Moose;
use PRANG::Graph;

with qw( MODS::Node );

has_element 'roleTerm' => ( is => 'rw', isa => 'ArrayRef[MODS::name::role::roleTerm]', );

1;
