package MODS::Type::languageAttrGrp;

use Moose::Role;
use PRANG::Graph;

has_attr 'lang' => (
    is => 'rw',
    isa => 'Str',
);

has_attr 'xml:lang' => (
    is => 'rw',
    isa => 'Str',
);

has_attr 'script' => (
    is => 'rw',
    isa => 'Str',
);

has_attr 'transliteration' => (
    is => 'rw',
    isa => 'Str',
);

1;
