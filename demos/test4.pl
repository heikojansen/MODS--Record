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

my $m = MODS::Record->new(
    [                  
    { titleInfo         => [ { title => 'Main title' }, { subTitle => 'Untertitel' } ] },
    { genre             => 'qwertz1' },                                                  
    { note              => 'Eine Notiz' },                                               
    ]                                                                                            
);  
   
die "Error creating record" unless $m->isa("MODS::Record");
say "OK creating record";

$m->add_element( typeOfResource => { text => 'text', manuscript => 'NOT_ALLOWED_VALUE', } );

say $m->to_xml(1);

say "Done";

exit 0;

