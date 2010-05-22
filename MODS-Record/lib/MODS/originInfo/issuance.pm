package MODS::originInfo::issuance;

use Moose;
use PRANG::Graph;

with qw( MODS::Node );

has_element 'text' => (
    is => 'rw',
    isa => 'MODS::Type::issuance',
    xml_nodeName => '',
);

1;
