package MODS::accessCondition;

use Moose;
use PRANG::Graph;
use PRANG::XMLSchema::Whatever;

with qw( MODS::Type::simpleLinkAttrGrp MODS::Type::languageAttrGrp MODS::Node );

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

1;
