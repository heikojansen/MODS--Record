package MODS::Collection;

use Moose;
use Moose::Util::TypeConstraints;
use PRANG::Graph;

=head1 NAME

MODS::Collection - The great new MODS::Collection!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

has_attr 'schemaLocation' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    xmlns => 'http://www.w3.org/2001/XMLSchema-instance',
    xml_name => 'schemaLocation',
);

has_element 'records' => ( is           => 'rw',
                           isa          => 'ArrayRef[MODS::Record]',
                           xml_nodeName => { mods => "MODS::Record", },
                           xml_min      => 1,
                           traits       => ['Array'],
                           handles      => {
                                'get_records' => 'elements',
                                'add_record'  => 'push',
                                'has_records' => 'count',
                            },
);

sub root_element { return 'modsCollection'; }

with qw( PRANG::Graph MODS::Node );

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use MODS::Collection;

    my $foo = MODS::Collection->new();
    ...

=head1 SUBROUTINES/METHODS

=head2 B<parse( Str $xmlstr ) returns Object>

Parses a XML string representing a modsCollection and returns a MODS::Collection
object.

=head2 B<add_record( MODS::Record $mods )>

Adds an object of type MODS::Record to the collection.

=head2 B<get_records() returns Array>

Returns an array of all MODS::Record objects in the collection.

=head2 B<has_records() returns Int>

Returns the number of records stored in the collection.

=cut

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
