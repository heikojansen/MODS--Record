package MODS::accessCondition;

use Moose;
use PRANG::Graph;
use PRANG::XMLSchema::Whatever;

has_attr 'displayLabel' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    coerce => 1,
);

has_attr 'type' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    coerce => 1,
);

has_element 'text' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token|PRANG::XMLSchema::Whatever',
    xml_nodeName => {
        ''  => 'PRANG::XMLSchema::token',
        '*' => 'PRANG::XMLSchema::Whatever',
    },
    coerce => 1,
);

sub root_element { 'accessCondition' };

with qw( MODS::Role::SingleArg MODS::Role::TopLevelElement MODS::Type::simpleLinkAttrGrp MODS::Type::languageAttrGrp MODS::Node );

1;
