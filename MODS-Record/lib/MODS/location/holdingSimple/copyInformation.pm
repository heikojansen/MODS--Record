package MODS::location::holdingSimple::copyInformation;

use Moose;
use PRANG::Graph;

with qw( MODS::Node );

has_element 'form' => (
    is => 'rw',
    isa => 'MODS::location::holdingSimple::copyInformation::form',
    xml_min => 0,
);

has_element 'subLocation' => (
    is => 'rw',
    isa => 'ArrayRef[MODS::location::holdingSimple::copyInformation::subLocation]',
    xml_min => 0,
);

has_element 'shelfLocator' => (
    is => 'rw',
    isa => 'ArrayRef[MODS::location::holdingSimple::copyInformation::shelfLocator]',
    xml_min => 0,
);

has_element 'electronicLocator' => (
    is => 'rw',
    isa => 'ArrayRef[MODS::location::holdingSimple::copyInformation::electronicLocator]',
    xml_min => 0,
);

has_element 'note' => (
    is => 'rw',
    isa => 'ArrayRef[MODS::location::holdingSimple::copyInformation::note]',
    xml_min => 0,
);

has_element 'enumerationAndChronology' => (
    is => 'rw',
    isa => 'ArrayRef[MODS::location::holdingSimple::copyInformation::enumerationAndChronology]',
    xml_min => 0,
);

1;
