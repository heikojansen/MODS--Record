package MODS::titleInfo::subTitle;

use Moose;
use PRANG::Graph;
use PRANG::XMLSchema::Types;
use Moose::Util::TypeConstraints;

has_element 'text' => ( is => 'rw', isa => 'PRANG::XMLSchema::token', xml_nodeName => '', coerce => 1, );

sub root_element { 'subTitle' };

with qw( MODS::Role::titleInfoElem MODS::Role::SingleArg MODS::Node );

coerce __PACKAGE__ 
    => from 'Str'
    => via { __PACKAGE__->new( text => $_ ) };

coerce __PACKAGE__
    => from 'HashRef'
    => via { __PACKAGE__->new($_) };

1;
