package MODS::Collection;

use Moose;
use Moose::Util::TypeConstraints;
use PRANG::Graph;

use MODS::Record;

=head1 NAME

MODS::Collection - Easily handle a collection of MODS records!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

has_attr 'schemaLocation' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    xmlns => 'http://www.w3.org/2001/XMLSchema-instance',
    xml_name => 'schemaLocation',
    coerce => 1,
);

has_element 'records' => ( is           => 'rw',
                           isa          => 'ArrayRef[MODS::Record]',
                           xml_nodeName => { mods => "MODS::Record", },
                           xml_min      => 0,
                           traits       => ['Array'],
                           default      => sub { [] },
                           handles      => {
                                'all_records' => 'elements',
                                'add_records' => 'push',
                                'num_records' => 'count',
                                'is_empty'    => 'is_empty',
                                'clear'       => 'clear',
                            },
);

sub root_element { return 'modsCollection'; }

with qw( PRANG::Graph MODS::Node );

=head1 SYNOPSIS

This module allows you to work with collections of MODS records.
It relies on the B<modsCollection> element as defined in the MODS schema.

You can create new collections from scratch:

    use MODS::Collection;

    my $col = MODS::Collection->new();
    $col->add_records(@recs);
    say $col->num_records() . " in collection" if not $col->is_empty;
    my @recs = $col->all_records();
    $col->clear();

Or you can parse and manipulate existing collections:

    use MODS::Collection;

    my $col = MODS::Collection->parse($str);
    say $col->num_records() . " in collection" if ! $col->is_empty;


=head1 SUBROUTINES/METHODS

=head2 B<parse( Str $xmlstr ) returns Object>

Parses a XML string representing a modsCollection and returns a MODS::Collection
object.

=head2 B<add_records( Array(MODS::Record) )>

Adds one or more objects of type MODS::Record to the collection.

=head2 B<all_records() returns Array>

Returns an array of all MODS::Record objects in the collection.

=head2 B<num_records() returns Int>

Returns the number of records stored in the collection.

=head2 B<is_empty() returns Bool>

Returns TRUE if collection does not contain any records, FALSE otherwise.

=head1 AUTHOR

Heiko Jansen, C<< <hjansen at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-mods-record at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=MODS-Record>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc MODS::Collection


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=MODS-Record>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/MODS-Record>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/MODS-Record>

=item * Search CPAN

L<http://search.cpan.org/dist/MODS-Record/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2010 Heiko Jansen.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of MODS::Collection
