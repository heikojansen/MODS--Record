#!perl -T

use Test::More tests => 2;

BEGIN {
    use_ok( 'MODS::Record' ) || print "Bail out!
";
    use_ok( 'MODS::Collection' ) || print "Bail out!
";
}

diag( "Testing MODS::Record $MODS::Record::VERSION, Perl $], $^X" );
