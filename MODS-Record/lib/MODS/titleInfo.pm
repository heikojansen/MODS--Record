package MODS::titleInfo;

use Moose;
use PRANG::Graph;
use Moose::Util::TypeConstraints;

use MODS::titleInfo::title;
use MODS::titleInfo::subTitle;
use MODS::titleInfo::partNumber;
use MODS::titleInfo::partName;
use MODS::titleInfo::nonSort;

with qw( MODS::Type::languageAttrGrp MODS::Type::simpleLinkAttrGrp MODS::Node );

has_attr 'type' => ( is => 'rw', isa => 'MODS::Type::titleInfoType', coerce => 1, );

has_attr 'displayLabel' => ( is => 'rw', isa => 'PRANG::XMLSchema::token', coerce => 1, );

has_attr 'ID' => ( is => 'rw', isa => 'PRANG::XMLSchema::token', coerce => 1, );

has_attr 'authority' => ( is => 'rw', isa => 'PRANG::XMLSchema::token', coerce => 1, );

subtype 'MODS::titleInfo::choice0' => as join( '|',
											   qw( MODS::titleInfo::title
                                                   MODS::titleInfo::subTitle 
                                                   MODS::titleInfo::partNumber 
                                                   MODS::titleInfo::partName 
                                                   MODS::titleInfo::nonSort
                                                   )
);

has_element 'elems' => ( is           => 'rw',
						 isa          => 'ArrayRef[MODS::titleInfo::choice0]',
						 xml_nodeName => { title      => 'MODS::titleInfo::title',
										   subTitle   => 'MODS::titleInfo::subTitle',
										   partNumber => 'MODS::titleInfo::partNumber',
										   partName   => 'MODS::titleInfo::partName',
										   nonSort    => 'MODS::titleInfo::nonSort',
						 },
						 xml_min => 0,
);

1;
