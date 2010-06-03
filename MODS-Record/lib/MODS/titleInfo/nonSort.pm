package MODS::titleInfo::nonSort;

use Moose;
use PRANG::Graph;

# not using PRANG::XMLSchema::token:
# <nonSort>The </nonSort>
# => The trailing space needs to be kept!
has_element 'text' => ( is => 'rw', isa => 'Str', xml_nodeName => '', coerce => 1, );

sub root_element { 'nonSort' };

with qw( MODS::Role::titleInfoElem MODS::Role::SingleArg MODS::Node );

1;
