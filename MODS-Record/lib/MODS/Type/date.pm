package MODS::Type::date;

use Moose::Role;
use PRANG::Graph;

with 'MODS::Type::baseDate';

has_attr 'keyDate' => (
    is => 'rw',
    isa => 'MODS::Type::yes',
);

1;
