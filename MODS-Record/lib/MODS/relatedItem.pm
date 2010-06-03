package MODS::relatedItem;

use Moose;
use Moose::Util::TypeConstraints;
use PRANG::Graph;

has_attr 'ID' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    coerce => 1,
);

has_attr 'displayLabel' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    coerce => 1,
);

has_attr 'type' => (
    is => 'rw',
    isa => 'MODS::Type::relatedItemType',
    coerce => 1,
);

has_element 'elems' => (
    is => 'rw',
    isa => 'ArrayRef[MODS::Role::TopLevelElement]',
    xml_min => 0,
    traits => ['Array'],
    xml_nodeName => {
        "titleInfo" => "MODS::titleInfo",
        "name" => "MODS::name",
        "typeOfResource" => "MODS::typeOfResource",
        "genre" => "MODS::genre",
        "originInfo" => "MODS::originInfo",
        "language" => "MODS::language",
        "physicalDescription" => "MODS::physicalDescription",
        "abstract" => "MODS::abstract",
        "tableOfContents" => "MODS::tableOfContents",
        "targetAudience" => "MODS::targetAudience",
        "note" => "MODS::note",
        "subject" => "MODS::subject",
        "classification" => "MODS::classification",
        "relatedItem" => "MODS::relatedItem",
        "identifier" => "MODS::identifier",
        "location" => "MODS::location",
        "accessCondition" => "MODS::accessCondition",
        "part" => "MODS::part",
        "extension" => "MODS::extension",
        "recordInfo" => "MODS::recordInfo",
    },
);

sub root_element { 'relatedItem' };

with qw( MODS::Role::TopLevelElement MODS::Type::simpleLinkAttrGrp MODS::Node );

1;
