package MODS::relatedItem;

use Moose;
use Moose::Util::TypeConstraints;
use PRANG::Graph;

#use MODS::titleInfo;
#use MODS::name;
#use MODS::typeOfResource;
#use MODS::genre;
#use MODS::originInfo;
#use MODS::language;
#use MODS::physicalDescription;
#use MODS::abstract;
#use MODS::tableOfContents;
#use MODS::targetAudience;
#use MODS::note;
#use MODS::subject;
#use MODS::classification;
#use MODS::relatedItem;
#use MODS::identifier;
#use MODS::location;
#use MODS::accessCondition;
#use MODS::part;
#use MODS::extension;
#use MODS::recordInfo;

subtype 'MODS::relatedItem::choice0' => as join("|", map { "MODS::$_" } qw(titleInfo name typeOfResource genre originInfo language physicalDescription abstract tableOfContents targetAudience note subject classification relatedItem identifier location accessCondition part extension recordInfo));

with qw( MODS::Type::simpleLinkAttrGrp MODS::Node );

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
    isa => 'ArrayRef[MODS::Type::RootElemChoice]',
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

1;
