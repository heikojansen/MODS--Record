package MODS::originInfo;

use Moose;
use Moose::Util::TypeConstraints;
use PRANG::Graph;

use MODS::originInfo::place;
use MODS::originInfo::publisher;
use MODS::originInfo::dateIssued;
use MODS::originInfo::dateCreated;
use MODS::originInfo::dateCaptured;
use MODS::originInfo::dateValid;
use MODS::originInfo::dateModified;
use MODS::originInfo::copyrightDate;
use MODS::originInfo::dateOther;
use MODS::originInfo::edition;
use MODS::originInfo::issuance;
use MODS::originInfo::frequency;

with qw( MODS::Node );

subtype 'MODS::originInfo::choice0' => as join( '|',
												map { 'MODS::originInfo::' . $_ }
													qw( place publisher dateIssued dateCreated dateCaptured dateValid dateModified copyrightDate dateOther edition issuance frequency )
);

has_element 'elems' => ( is           => 'rw',
							  isa          => 'ArrayRef[MODS::originInfo::choice0]',
							  xml_nodeName => { place         => 'MODS::originInfo::place',
												publisher     => 'MODS::originInfo::publisher',
												dateIssued    => 'MODS::originInfo::dateIssued',
												dateCreated   => 'MODS::originInfo::dateCreated',
												dateCaptured  => 'MODS::originInfo::dateCaptured',
												dateValid     => 'MODS::originInfo::dateValid',
												dateModified  => 'MODS::originInfo::dateModified',
												copyrightDate => 'MODS::originInfo::copyrightDate',
												dateOther     => 'MODS::originInfo::dateOther',
												edition       => 'MODS::originInfo::edition',
												issuance      => 'MODS::originInfo::issuance',
												frequency     => 'MODS::originInfo::frequency',
							  },
							  xml_min => 1,
);

1;
