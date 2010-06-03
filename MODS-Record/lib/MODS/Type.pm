package MODS::Type;

use strict;
use warnings;

use Moose::Util::TypeConstraints;
use PRANG::XMLSchema::Types;

BEGIN {

subtype 'MODS::Type::internetMediaType' => as 'PRANG::XMLSchema::token' => where {
    $_ =~ m!^(application|audio|image|message|model|multipart|text|video|example)/\S+!o
};

subtype 'MODS::Type::resource' => as 'PRANG::XMLSchema::token' => where {
	       $_ eq 'text'
		or $_ eq 'cartographic'
		or $_ eq 'notated music'
		or $_ eq 'sound recording-musical'
		or $_ eq 'sound recording-nonmusical'
		or $_ eq 'sound recording'
		or $_ eq 'still image'
		or $_ eq 'moving image'
		or $_ eq 'three dimensional object'
		or $_ eq 'software, multimedia'
		or $_ eq 'mixed material'
		or $_ eq '';
};

subtype 'MODS::Type::yes' => as 'Undef|Str' => where { not defined($_) or $_ eq 'yes' };
coerce 'MODS::Type::yes' => from 'Str' => via { lc($_) }; 

subtype 'MODS::Type::issuance' => as 'PRANG::XMLSchema::token' => where {
	$_ eq 'continuing'
		or $_ eq 'monographic';
};

subtype 'MODS::Type::languageTermAuthority' => as 'PRANG::XMLSchema::token' => where {
	       $_ eq 'rfc3066'
		or $_ eq 'iso639-2b'
		or $_ eq 'iso639-3'
		or $_ eq 'rfc4646';
};

subtype 'MODS::Type::reformattingQuality' => as 'PRANG::XMLSchema::token' => where {
	$_        eq 'access'
		or $_ eq 'preservation'
		or $_ eq 'replacement';
};

subtype 'MODS::Type::digitalOrigin' => as 'PRANG::XMLSchema::token' => where {
	       $_ eq 'born digital'
		or $_ eq 'reformatted digital'
		or $_ eq 'digitized microfilm'
		or $_ eq 'digitized other analog';
};

subtype 'MODS::Type::relatedItemType' => as 'PRANG::XMLSchema::token' => where {
	       $_ eq 'preceding'
		or $_ eq 'succeeding'
		or $_ eq 'original'
		or $_ eq 'host'
		or $_ eq 'constituent'
		or $_ eq 'series'
		or $_ eq 'otherVersion'
		or $_ eq 'otherFormat'
		or $_ eq 'isReferencedBy';
};

subtype 'MODS::Type::urlTypeAccess' => as 'PRANG::XMLSchema::token' => where {
	$_        eq 'preview'
		or $_ eq 'raw object'
		or $_ eq 'object in context';
};

subtype 'MODS::Type::urlTypeUsage' => as 'PRANG::XMLSchema::token' => where {
	$_ eq 'primary display';
};

subtype 'MODS::Type::enumerationAndChronologyTypeUnitType' => as 'Int' => where {
	$_ >= 1 and $_ <= 3;
};

subtype 'MODS::Type::baseDateTypeEncoding' => as 'PRANG::XMLSchema::token' => where {
	$_        eq 'w3cdtf'
		or $_ eq 'iso8601'
		or $_ eq 'marc';
};

subtype 'MODS::Type::baseDateTypeQualifier' => as 'PRANG::XMLSchema::token' => where {
	$_        eq 'approximate'
		or $_ eq 'inferred'
		or $_ eq 'questionable';
};

subtype 'MODS::Type::baseDateTypePoint' => as 'PRANG::XMLSchema::token' => where {
	$_ eq 'start'
		or $_ eq 'end';
};

subtype 'MODS::Type::codeOrText' => as 'PRANG::XMLSchema::token' => where {
	$_ eq 'code'
		or $_ eq 'text';
};

subtype 'MODS::Type::placeAuthority' => as 'PRANG::XMLSchema::token' => where {
	$_        eq 'marcgac'
		or $_ eq 'marccountry'
		or $_ eq 'iso3166';
};

subtype 'MODS::Type::nameType' => as 'PRANG::XMLSchema::token' => where {
	$_        eq 'personal'
		or $_ eq 'corporate'
		or $_ eq 'conference';
};

subtype 'MODS::Type::versionType' => as 'PRANG::XMLSchema::token' => where {
	$_ eq '3.3';
};

subtype 'MODS::Type::titleInfoType' => as 'PRANG::XMLSchema::token' => where {
	       $_ eq 'abbreviated'
		or $_ eq 'translated'
		or $_ eq 'alternative'
		or $_ eq 'uniform';
};

subtype 'MODS::Type::namePartType' => as 'PRANG::XMLSchema::token' => where {
	       $_ eq 'date'
		or $_ eq 'family'
		or $_ eq 'given'
		or $_ eq 'termsOfAddress';
};

};

1;
