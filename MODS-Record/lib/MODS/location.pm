package MODS::location;

use Moose;
use PRANG::Graph;

has_element 'physicalLocation' => (
    is => 'rw',
    isa => 'ArrayRef[MODS::location::physicalLocation]',
    xml_min => 0,
);

has_element 'shelfLocator' => (
    is => 'rw',
    isa => 'ArrayRef[MODS::location::shelfLocator]',
    xml_min => 0,
);

has_element 'url' => (
    is => 'rw',
    isa => 'ArrayRef[MODS::location::url]',
    xml_min => 0,
);

has_element 'holdingSimple' => (
    is => 'rw',
    isa => 'MODS::location::holdingSimple',
    xml_required => 0,
);

has_element 'holdingExternal' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::Whatever',
    xml_required => 0,
);

sub root_element { 'location' };

with qw( MODS::Role::TopLevelElement MODS::Node );

1;
