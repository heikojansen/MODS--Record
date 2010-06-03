package MODS::originInfo::issuance;

use Moose;
use PRANG::Graph;

has_element 'text' => (
    is => 'rw',
    isa => 'MODS::Type::issuance',
    xml_nodeName => '',
);

with qw( MODS::Role::SingleArg MODS::Node );

1;
