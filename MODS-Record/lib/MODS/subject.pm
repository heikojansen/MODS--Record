package MODS::subject;

use Moose;
use PRANG::Graph;
use Moose::Util::TypeConstraints;

use MODS::subject::topic;
use MODS::subject::geographic;
use MODS::subject::temporal;
use MODS::titleInfo;
use MODS::name;
use MODS::subject::geographicCode;
use MODS::subject::hierarchicalGeographic;
use MODS::subject::cartographics;
use MODS::subject::occupation;
use MODS::subject::genre;

with qw( MODS::Type::simpleLinkAttrGrp MODS::Type::languageAttrGrp MODS::Node );

has_attr 'ID' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    coerce => 1,
);

has_attr 'authority' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    coerce => 1,
);

subtype 'MODS::subject::choice0' => as join(
	'|',
		qw( MODS::subject::topic MODS::subject::geographic MODS::subject::temporal MODS::titleInfo MODS::name MODS::subject::geographicCode MODS::subject::hierarchicalGeographic MODS::subject::cartographics MODS::subject::occupation MODS::subject::genre ) );

has_element 'elems' => ( is           => 'rw',
							   isa          => 'ArrayRef[MODS::subject::choice0]',
							   xml_min      => 0,
							   xml_nodeName => { topic                  => 'MODS::subject::topic',
												 geographic             => 'MODS::subject::geographic',
												 temporal               => 'MODS::subject::temporal',
												 titleInfo              => 'MODS::titleInfo',
												 name                   => 'MODS::name',
												 geographicCode         => 'MODS::subject::geographicCode',
												 hierarchicalGeographic => 'MODS::subject::hierarchicalGeographic',
												 cartographics          => 'MODS::subject::cartographics',
												 occupation             => 'MODS::subject::occupation',
												 genre                  => 'MODS::subject::genre',
							   },
);

1;
