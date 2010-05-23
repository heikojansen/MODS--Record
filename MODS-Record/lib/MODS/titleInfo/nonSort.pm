package MODS::titleInfo::nonSort;

use Moose;
use PRANG::Graph;

with qw( MODS::Node );

# not using PRANG::XMLSchema::token:
# <nonSort>The </nonSort>
# => The trailing space needs to be kept!
has_element 'text' => ( is => 'rw', isa => 'Str', xml_nodeName => '', coerce => 1, );

1;
