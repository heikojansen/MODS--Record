package MODS::location::url;

use Moose;
use PRANG::Graph;

with qw( MODS::Node );

has_element 'text' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::anyURI',
    xml_nodeName => '',
    coerce => 1,
);

has_attr 'dateLastAccessed' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    coerce => 1,
);

has_attr 'note' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    coerce => 1,
);

has_attr 'access' => (
    is => 'rw',
    isa => 'MODS::Type::urlTypeAccess',
    coerce => 1,
);

has_attr 'useage' => (
    is => 'rw',
    isa => 'MODS::Type::urlTypeUsage',
    coerce => 1,
);

1;
