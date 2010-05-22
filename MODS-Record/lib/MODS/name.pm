package MODS::name;

use Moose;
use Moose::Util::TypeConstraints;
use PRANG::Graph;

use MODS::name::namePart;
use MODS::name::displayForm;
use MODS::name::affiliation;
use MODS::name::role;
use MODS::name::description;

with qw( MODS::Type::languageAttrGrp MODS::Type::simpleLinkAttrGrp MODS::Node );

has_attr 'type' => ( is => 'rw', isa => 'MODS::Type::nameType', coerce => 1, );

has_attr 'ID' => ( is => 'rw', isa => 'PRANG::XMLSchema::token', coerce => 1, );

has_attr 'authority' => ( is => 'rw', isa => 'PRANG::XMLSchema::token', coerce => 1, );

subtype 'MODS::name::choice0' => as
    join( '|',
          map { 'MODS::name::' . $_ }
              qw( namePart displayForm affiliation role description )
    );

has_element 'nameElem' => ( is           => 'rw',
                            isa          => 'ArrayRef[MODS::name::choice0]',
                            xml_nodeName => { namePart    => 'MODS::name::namePart',
                                              displayForm => 'MODS::name::displayForm',
                                              affiliation => 'MODS::name::affiliation',
                                              role        => 'MODS::name::role',
                                              description => 'MODS::name::description',
                            },
                            xml_min => 0,
);

1;
