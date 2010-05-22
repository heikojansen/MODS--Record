package MODS::physicalDescription;

use Moose;
use Moose::Util::TypeConstraints;
use PRANG::Graph;

use MODS::physicalDescription::form;
use MODS::physicalDescription::reformattingQuality;
use MODS::physicalDescription::internetMediaType;
use MODS::physicalDescription::extent;
use MODS::physicalDescription::digitalOrigin;
use MODS::physicalDescription::note;

with qw( MODS::Type::languageAttrGrp MODS::Node );

subtype 'MODS::physicalDescription::choice0' => as join('|', map { 'MODS::physicalDescription::' . $_ } qw( form reformattingQuality internetMediaType extent digitalOrigin note ) );

has_element 'elems' => (
    is => 'rw',
    isa => 'ArrayRef[MODS::physicalDescription::choice0]',
    xml_nodeName => {
        form => 'MODS::physicalDescription::form',
        reformattingQuality => 'MODS::physicalDescription::reformattingQuality',
        internetMediaType => 'MODS::physicalDescription::internetMediaType',
        extent => 'MODS::physicalDescription::extent',
        digitalOrigin => 'MODS::physicalDescription::digitalOrigin',
        note => 'MODS::physicalDescription::note',
    },
    xml_min => 1,
);

1;
