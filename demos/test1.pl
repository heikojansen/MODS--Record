#!/usr/bin/perl 
#===============================================================================
#
#         FILE:  test1.pl
#
#        USAGE:  ./test1.pl  
#
#  DESCRIPTION:  Parser-Test für MODS::Record
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
use XML::LibXML;

my $m = '';

$m = MODS::Record->parse( file => "./mods.xml" );

die "Error reading from file" unless $m->isa("MODS::Record");
say "OK reading from file";
undef $m;

open my $fh1, "<", "./mods.xml" or die "Demo record not found: $!";
$m = MODS::Record->parse( fh => $fh1 );

die "Error reading from filehandle" unless $m->isa("MODS::Record");
say "OK reading from filehandle";
undef $m;
undef $fh1;

open my $fh2, "<", "./mods.xml" or die "Demo record not found: $!";
my $str = do { local ($/); <$fh2>; };
close $fh2;
$m = MODS::Record->parse( string => $str );

die "Error parsing string" unless $m->isa("MODS::Record");
say "OK reading from string";
undef $m;
undef $fh2;

my $x = XML::LibXML->load_xml( string => $str );
$m = MODS::Record->parse( doc => $x );

die "Error parsing XML::LibXML doc" unless $m->isa("MODS::Record");
say "OK reading from XML::LibXML doc";
undef $m;

say "Done";

exit 0;

