#!/usr/bin/perl 
#===============================================================================
#
#         FILE:  test2.pl
#
#        USAGE:  ./test2.pl  
#
#  DESCRIPTION:  API-Test für MODS::Record
#
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:  Heiko Jansen 
#      COMPANY:  
#      VERSION:  1.0
#===============================================================================

use strict;
use warnings;

use feature ':5.10';

use lib qw(../MODS-Record/lib);

use MODS::Record;

my $m = MODS::Record->parse( file => "./mods.xml" );

die "Error reading from file" unless $m->isa("MODS::Record");
say "OK reading from file";

say "\n" . '#' x 80 . "\n";
say 'Genre: ' . $m->get_element('genre')->text;
say "\n" . '#' x 80 . "\n";

$m->set_element( 'genre' => "new value" );

say $m->to_xml(1);

say "Done";

exit 0;

