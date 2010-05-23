package MODS::Type::baseDate;

use Moose::Role;
use PRANG::Graph;

has_element 'text' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    xml_nodeName => '',
    coerce => 1,
);

has_attr 'qualifier' => (
    is => 'rw',
    isa => 'MODS::Type::baseDateTypeQualifier',
);

has_attr 'point' => (
    is => 'rw',
    isa => 'MODS::Type::baseDateTypePoint',
);

has_attr 'encoding' => (
    is => 'rw',
    isa => 'MODS::Type::baseDateTypeEncoding',
);

1;
