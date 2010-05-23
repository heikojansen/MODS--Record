package MODS::Record;

use Moose;
use Moose::Util::TypeConstraints;
use PRANG::Graph;

use MODS::titleInfo;
use MODS::name;
use MODS::typeOfResource;
use MODS::genre;
use MODS::originInfo;
use MODS::language;
use MODS::physicalDescription;
use MODS::abstract;
use MODS::tableOfContents;
use MODS::targetAudience;
use MODS::note;
use MODS::subject;
use MODS::classification;
#use MODS::relatedItem; # cf. below
use MODS::identifier;
use MODS::location;
use MODS::accessCondition;
use MODS::part;
use MODS::extension;
use MODS::recordInfo;

use MODS::relatedItem; # put here so that the subtype declaration in MODS::relatedItem works

subtype 'MODS::Record::choice0' => as join("|", map { "MODS::$_" } qw(titleInfo name typeOfResource genre originInfo language physicalDescription abstract tableOfContents targetAudience note subject classification relatedItem identifier location accessCondition part extension recordInfo));

=head1 NAME

MODS::Record - Easily parse and create MODS records

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

has_attr 'version' => ( is => 'rw', isa => 'PRANG::XMLSchema::token', );

has_attr 'ID' => ( is => 'rw', isa => 'PRANG::XMLSchema::token', );

has_attr 'schemaLocation' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    xmlns => 'http://www.w3.org/2001/XMLSchema-instance',
    xml_name => 'schemaLocation',
);

has_element 'elems' => (
    is => 'rw',
    isa => 'ArrayRef[MODS::Record::choice0]',
    xml_min => 1,
    traits => ['Array'],
    xml_nodeName => {
        "titleInfo" => "MODS::titleInfo",
        "name" => "MODS::name",
        "typeOfResource" => "MODS::typeOfResource",
        "genre" => "MODS::genre",
        "originInfo" => "MODS::originInfo",
        "language" => "MODS::language",
        "physicalDescription" => "MODS::physicalDescription",
        "abstract" => "MODS::abstract",
        "tableOfContents" => "MODS::tableOfContents",
        "targetAudience" => "MODS::targetAudience",
        "note" => "MODS::note",
        "subject" => "MODS::subject",
        "classification" => "MODS::classification",
        "relatedItem" => "MODS::relatedItem",
        "identifier" => "MODS::identifier",
        "location" => "MODS::location",
        "accessCondition" => "MODS::accessCondition",
        "part" => "MODS::part",
        "extension" => "MODS::extension",
        "recordInfo" => "MODS::recordInfo",
    },
);

sub root_element { return 'mods'; }

with qw( PRANG::Graph MODS::Node );

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use MODS::Record;

    my $foo = MODS::Record->new();
    ...

=head1 SUBROUTINES/METHODS

=head2 function1

=cut

sub function1 {
}

=head2 function2

=cut

sub function2 {
}

=head1 AUTHOR

Heiko Jansen, C<< <hjansen at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-mods-record at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=MODS-Record>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc MODS::Record


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

1; # End of MODS::Record
