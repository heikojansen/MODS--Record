#!perl -T

use MODS::Record;
use MODS::Collection;
use XML::Compare;
use FindBin qw($Bin);
use Test::More tests => 30;

my $comp = XML::Compare->new( namespace_strict => 1 );

foreach my $name (
	qw( book_chapter book conferencepub map mixedmaterial motionpicture music serial_article serial_electronic serial_special_issue serial_supplement serial soundrec webdoc )
	)
{
	my $xml  = _read_file($name);
	my $mods = '';
	eval { $mods = MODS::Record->parse($xml) };
	isa_ok( $mods, 'MODS::Record', "Parsing '$name'" ) or diag("Error: $@");
	my $out = $mods->to_xml();
	ok( eval { $comp->same( $xml, $out ) }, "Round-trip '$name' from XML to object and back" )
		or diag("Error: $@");
}

{
    my $xml = _read_file('modsCollection');
    my $mods = '';
    eval { $mods = MODS::Collection->parse($xml) };
    isa_ok( $mods, 'MODS::Collection', "Parsing 'modsCollection'" ) or diag("Error: $@");
    my $out = $mods->to_xml();
    ok( eval { $comp->same( $xml, $out ) }, "Round-trip 'modsCollection' from XML to object and back" )
        or diag("Error: $@");
}

done_testing(30);

sub _read_file {
	my $name = shift;
	open my $f, '<', "$Bin/test_recs/${name}.xml";
	binmode $f, ":utf8";
	my $xml = do {
		local ($/);
		<$f>;
	};
	close $f;
	return $xml;
}
