package MODS::recordInfo;

use Moose;
use Moose::Util::TypeConstraints;
use PRANG::Graph;

use MODS::recordInfo::recordContentSource;
use MODS::recordInfo::recordCreationDate;
use MODS::recordInfo::recordChangeDate;
use MODS::recordInfo::recordIdentifier;
use MODS::recordInfo::languageOfCataloging;
use MODS::recordInfo::recordOrigin;
use MODS::recordInfo::descriptionStandard;

with qw( MODS::Type::languageAttrGrp MODS::Node );

subtype 'MODS::recordInfo::choice0' => as join('|', map { 'MODS::recordInfo::' . $_ } qw( recordContentSource recordCreationDate recordChangeDate recordIdentifier languageOfCataloging recordOrigin descriptionStandard ) );

has_element 'elems' => (
    is => 'rw',
    isa => 'ArrayRef[MODS::recordInfo::choice0]',
    xml_nodeName => {
        recordContentSource => 'MODS::recordInfo::recordContentSource',
        recordCreationDate => 'MODS::recordInfo::recordCreationDate',
        recordChangeDate => 'MODS::recordInfo::recordChangeDate',
        recordIdentifier => 'MODS::recordInfo::recordIdentifier',
        languageOfCataloging => 'MODS::recordInfo::languageOfCataloging',
        recordOrigin => 'MODS::recordInfo::recordOrigin',
        descriptionStandard => 'MODS::recordInfo::descriptionStandard',
    },
);

1;
