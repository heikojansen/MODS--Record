package MODS::subject::hierarchicalGeographic;

use Moose;
use PRANG::Graph;
use Moose::Util::TypeConstraints;

use MODS::subject::hierarchicalGeographic::extraterrestrialArea;
use MODS::subject::hierarchicalGeographic::continent;
use MODS::subject::hierarchicalGeographic::country;
use MODS::subject::hierarchicalGeographic::province;
use MODS::subject::hierarchicalGeographic::region;
use MODS::subject::hierarchicalGeographic::state;
use MODS::subject::hierarchicalGeographic::territory;
use MODS::subject::hierarchicalGeographic::county;
use MODS::subject::hierarchicalGeographic::city;
use MODS::subject::hierarchicalGeographic::citySection;
use MODS::subject::hierarchicalGeographic::island;
use MODS::subject::hierarchicalGeographic::area;

with qw( MODS::Node );

subtype 'MODS::hierarchicalGeographic::choice0' =>
	as join( '|',
			 map { 'MODS::subject::hierarchicalGeographic::' . $_ }
				 qw( extraterrestrialArea continent country province region state territory county city citySection island area )
	);

has_element 'geoElem' => ( is           => 'rw',
						   isa          => 'ArrayRef[MODS::hierarchicalGeographic::choice0]',
						   xml_min      => 1,
						   xml_nodeName => { extraterrestrialArea => 'MODS::subject::hierarchicalGeographic::extraterrestrialArea',
											 continent            => 'MODS::subject::hierarchicalGeographic::continent',
											 country              => 'MODS::subject::hierarchicalGeographic::country',
											 province             => 'MODS::subject::hierarchicalGeographic::province',
											 region               => 'MODS::subject::hierarchicalGeographic::region',
											 state                => 'MODS::subject::hierarchicalGeographic::state',
											 territory            => 'MODS::subject::hierarchicalGeographic::territory',
											 county               => 'MODS::subject::hierarchicalGeographic::county',
											 city                 => 'MODS::subject::hierarchicalGeographic::city',
											 citySection          => 'MODS::subject::hierarchicalGeographic::citySection',
											 island               => 'MODS::subject::hierarchicalGeographic::island',
											 area                 => 'MODS::subject::hierarchicalGeographic::area',
						   },
);

1;
