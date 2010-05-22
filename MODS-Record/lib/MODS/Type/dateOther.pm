package MODS::Type::dateOther;

use Moose::Role;
use PRANG::Graph;
use PRANG::XMLSchema::Types;

with 'MODS::Type::date';

has_attr 'type' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
);

1;
