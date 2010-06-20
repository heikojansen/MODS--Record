#!/usr/bin/perl 
#===============================================================================
#
#         FILE:  test7.pl
#
#        USAGE:  ./test7.pl  
#
#  DESCRIPTION:  Parser und API für MODS::Collection
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

use MODS::Collection;

my $c = MODS::Collection->parse( file => "coll.xml" );

die "Parsing collection file failed" unless $c->isa('MODS::Collection');
say "OK reading collection from file";

say "Collection contains " . $c->num_records() . " records";

my $m = MODS::Record->new( [ { genre => 'qwertz1' } ] );
$m->add_element( titleInfo => [ { title => 'Main title' }, { subTitle => 'Untertitel' } ] );

$c->add_records($m);

say "Collection now contains " . $c->num_records() . " records";

say $c->to_xml(1);

say "Done";

exit 0;

