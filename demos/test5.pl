#!/usr/bin/perl 
#===============================================================================
#
#         FILE:  test3.pl
#
#        USAGE:  ./test3.pl  
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

my $m = MODS::Record->new( [ { genre => 'qwertz1' } ] );

$m->add_element( titleInfo => [ { title => 'Main title' }, { subTitle => 'Untertitel' } ] );
if ( rand() < 0.5 ) {
    $m->add_element( note => 'Eine Notiz' );
    $m->add_element( typeOfResource => { text => 'text', manuscript => 'yes', } );
}

say $m->to_xml(1);

say "Done";

exit 0;

