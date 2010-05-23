package MODS::Type::simpleLinkAttrGrp;

use Moose::Role;
use PRANG::Graph;
use Moose::Util::TypeConstraints;
use PRANG::XMLSchema::Types;

#  <attributeGroup name="simpleLink">
#    <attribute name="type" type="string" fixed="simple" form="qualified" />
#    <attribute ref="xlink:href" use="optional" />
#    <attribute ref="xlink:role" use="optional" />
#    <attribute ref="xlink:arcrole" use="optional" />
#    <attribute ref="xlink:title" use="optional" />
#    <attribute ref="xlink:show" use="optional" />
#    <attribute ref="xlink:actuate" use="optional" />
#  </attributeGroup>

type 'MODS::Type::simpleLinkAttrGrp::xlink_type' => where { not( defined($_) ) or $_ eq 'simple' };

#has_attr 'xlink_type' => (
has_attr 'xlink_type' => (
    is => 'rw',
    isa => 'MODS::Type::simpleLinkAttrGrp::xlink_type',
    xml_name => 'type',
#    xmlns => 'http://www.w3.org/1999/xlink',
    xmlns_attr => 'ns_type',
    xmlns => '*',
);

has 'ns_type' => ( is => 'rw', );
has 'ns_href' => ( is => 'rw', );

has_attr 'href' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::anyURI',
    xml_name => 'href',
#    xmlns_attr => 'ns_href',
#    xmlns => '*',#http://www.w3.org/1999/xlink',
    xmlns => 'http://www.w3.org/1999/xlink',
);

has_attr 'role' => (
    is => 'rw',
    isa => 'Str',
);

has_attr 'arcrole' => (
    is => 'rw',
    isa => 'Str',
);

has_attr 'title' => (
    is => 'rw',
    isa => 'Str',
);

has_attr 'show' => (
    is => 'rw',
    isa => enum([qw[ new replace embed other none ]]),
);

has_attr 'actuate' => (
    is => 'rw',
    isa => enum([qw[ onLoad onRequest other none ]]),
);

1;
