package MODS::note;

use Moose;
use PRANG::Graph;

has_attr 'ID' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    coerce => 1,
);

sub root_element { 'note' };

#use Moose::Util::TypeConstraints;
#coerce __PACKAGE__
#        => from "Str",
#        => via { warn $_; __PACKAGE__->new(text => $_) },
#        ;
#coerce __PACKAGE__
#        => from "HashRef",
#        => via { warn $_; __PACKAGE__->new($_) },
#        ;

with qw( MODS::Role::TopLevelElement MODS::Type::unstructuredText MODS::Node );

1;
