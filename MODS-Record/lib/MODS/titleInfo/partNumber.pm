package MODS::titleInfo::partNumber;

use Moose;
use PRANG::Graph;

has_element 'text' => ( is => 'rw', isa => 'PRANG::XMLSchema::token', xml_nodeName => '', coerce => 1, );

sub root_element { 'partNumber' };

with qw( MODS::Role::titleInfoElem MODS::Role::SingleArg MODS::Node );

1;
