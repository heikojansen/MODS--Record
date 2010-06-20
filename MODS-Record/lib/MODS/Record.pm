package MODS::Record;

use 5.010;
use Moose;
use Moose::Util::TypeConstraints;
use PRANG::Graph;
use PRANG::XMLSchema::Types;

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
use MODS::relatedItem; # cf. below
use MODS::identifier;
use MODS::location;
use MODS::accessCondition;
use MODS::part;
use MODS::extension;
use MODS::recordInfo;

=head1 NAME

MODS::Record - Easily parse, create, and manipulate MODS records

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

our $NAMESPACE = 'http://www.loc.gov/mods/v3';

has_attr 'version' => ( is => 'rw', isa => 'PRANG::XMLSchema::token', coerce => 1 );

has_attr 'ID' => ( is => 'rw', isa => 'PRANG::XMLSchema::normalizedString', coerce => 1 );

has_attr 'schemaLocation' => (
    is => 'rw',
    isa => 'PRANG::XMLSchema::token',
    xmlns => 'http://www.w3.org/2001/XMLSchema-instance',
    xml_name => 'schemaLocation',
    coerce => 1,
);

has 'node_name' => ( is => 'rw', traits => ['Array'], handles => { _delete_nn => 'delete', _push_nn => 'push', _clear_nn => 'clear', }, ); 
has 'ns' => ( is => 'rw', traits => ['Array'], handles => { _delete_ns => 'delete', _push_ns => 'push', }, ); 
has_element 'elems' => (
    is => 'rw',
    isa => 'ArrayRef[MODS::Role::TopLevelElement]',
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
    xml_nodeName_attr => 'node_name',
    xmlns_attr => 'ns',
    coerce => 1,
    handles => {
        _filter => 'grep',
        _first => 'first',
        _push => 'push',
        _elements => 'elements',
        _delete => 'delete',
        _sort_in_place => 'sort_in_place',
    },
);

sub get_element {
    my $self = shift;
    my $elem = shift;

    if ( ! wantarray ) {
        return $self->_first( sub { $_->isa('MODS::' . $elem) } );
    }
    else {
        return $self->_filter( sub { $_->isa('MODS::' . $elem) } );
    }
}

sub add_element {
    my $self = shift;
    my $elem = shift;
    my $data = shift;

    die "Superfluos parameter in method call 'add_element'" if @_;

    if ( index( ref($_[0]), 'MODS::' . $elem ) == 0 ) {
        $self->_push( $data );
        $self->_push_nn( $elem );
        $self->_push_ns( undef );
    } 
    else {
        my $obj = "MODS::$elem"->new($data);
        $self->_push( $obj );
        $self->_push_nn( $elem );
        $self->_push_ns( undef );
    }
    return;
}

sub set_element {
    my $self = shift;
    my $elem = shift;

    my $i = 0;
    my @to_delete = ();
    foreach ( $self->_elements() ) {
        if ( $_->isa('MODS::' . $elem) ) {
            unshift @to_delete, $i;
        }
        $i++;
    }
    foreach (@to_delete) {
        $self->_delete($_);
        $self->_delete_nn($_);
        $self->_delete_ns($_);
    }
    $self->add_element( $elem, @_ );
}

# TODO This is ugly - find out if there's a better way
sub BUILD {
    my $self = shift;
    unless ( $self->{'ns'} ) {
        if ( ref $self->{'elems'} eq 'ARRAY' ) {
            for ( 0 .. $#{$self->{'elems'}} ) {
                push @{ $self->{'ns'} }, $MODS::RECORD::NAMESPACE;
            }
        }
    }
    unless ( $self->{'node_name'} ) {
        if ( ref $self->{'elems'} eq 'ARRAY' ) {
            for ( 0 .. $#{$self->{'elems'}} ) {
                my $type = ref $self->{'elems'}->[$_];
                $type =~ s!^.+::(.+)!$1!o;
                push @{ $self->{'node_name'} }, $type;
            }
        }
    }
}

sub BUILDARGS {
    my $invocant = shift;
    if ( ref $_[0] eq 'HASH' ) {
        return shift;
    }
    elsif ( ref $_[0] eq 'ARRAY' ) {
        return { elems => $_[0] };
    }
    return { @_ };
}

sub root_element { return 'mods'; }

coerce "ArrayRef[MODS::Role::TopLevelElement]"
    => from 'ArrayRef[MODS::Role::TopLevelElement|HashRef]'
    => via {
        my @rv = @$_;
        for ( @rv ) {
            if ( ref $_ eq "HASH" ) {
                my $mod = (keys(%{$_}))[0];
                my $par = $_->{$mod};
                $_ = "MODS::$mod"->new($par);
            }
            elsif ( blessed $_ ) {
                ;
            }
            else {
                require Data::Dumper;
                die "Unhandled coersion for: " . Data::Dumper::Dumper($_);
            }
        }
        \@rv;
    }
;

with qw( PRANG::Graph MODS::Node );

around 'parse' => sub {
    my $orig = shift;
    my $self = shift;

    if ( @_ == 1 ) {
        return $self->$orig( shift );
    }
    elsif ( @_ == 2 ) {
        my ( $key, $value ) = @_;
        if ( $key eq 'string' ) {
            return $self->$orig( $value );
        }
        elsif ( $key eq 'fh' ) {
            my $str = do { local $/; <$value> };
            return $self->$orig( $str );
        }
        elsif ( $key eq 'file' ) {
            open ( my $fh, '<', $value ) or die "Can't open file '$value': $!";
            my $str = do { local $/; <$fh> };
            close $fh;
            return $self->$orig( $str );
        }
        elsif ( $key eq 'doc' ) {
            if ( not $value->isa('XML::LibXML::Document') ) {
                die "Parameter supplied is not a document object of type 'XML::LibXML::Document'"; 
            }
            return $self->$orig( $value->toString() );
        }
    }
    else {
        die "Invalid arguments supplied to 'MODS::Record->parse()'";
    }
    return;
};

before 'to_xml' => sub {
    my $self = shift;

    my %f = (
        "MODS::titleInfo" => 20,
        "MODS::name" => 19,
        "MODS::typeOfResource" => 18,
        "MODS::genre" => 17,
        "MODS::originInfo" => 16,
        "MODS::language" => 15,
        "MODS::physicalDescription" => 14,
        "MODS::abstract" => 13,
        "MODS::tableOfContents" => 12,
        "MODS::targetAudience" => 11,
        "MODS::note" => 10,
        "MODS::subject" => 9,
        "MODS::classification" => 8,
        "MODS::relatedItem" => 7,
        "MODS::identifier" => 6,
        "MODS::location" => 5,
        "MODS::accessCondition" => 4,
        "MODS::part" => 3,
        "MODS::extension" => 2,
        "MODS::recordInfo" => 1
    );

    $self->_sort_in_place( sub { -1 * ( $f{ ref($_[0]) } <=> $f{ ref($_[1]) } ) } ); 
    $self->_clear_nn();
    foreach ( $self->_elements() ) {
        my $ref = ref($_);
        $self->_push_nn( substr( $ref, 6 ) );
    }
    return;
};

=head1 SYNOPSIS

This module allows you to work with MODS records.
It relies on the B<mods> element as defined in the MODS schema.

You can create new records from scratch:

    use MODS::Record;

    my $rec = MODS::Record->new(
        [
            { titleInfo         => [ { title => 'Main title' }, { subTitle => 'Sub title' } ] },
            { typeOfResource    => { text => 'text', manuscript => 'yes', } },
            { genre             => 'fiction' },
            { note              => 'Some text' },
        ]
    );
    say $rec->to_xml(1);

Or you can parse and manipulate existing collections:

    use MODS::Record;

    # tbd.

=head1 B<CAUTION>

Currently this module can only successfully parse records which
conform to the MODS schema version 3.3. 
This does include a large percentage of records that have been created
in conformance to older schema versions but it might be the case, that

=over 4

=item  B<a)> records conforming to older schema versions are rejected by 
this module and

=item  B<b)> records claiming to conform to older schema versions but failing
to do so are accepted by this module.

=back

There are plans to create specific classes for the different schema 
versions from 3.0 onward and to extend the support to the emerging
3.4 version, but this may take some time.

=head1 SUBROUTINES/METHODS

=head2 B<parse( ( Str $xmlstr | ("string"|"fh"|"file"|"doc") $var ) returns Object>

Parses a XML string representing a modsCollection and returns a MODS::Collection
object.
Parameters can be either a single argument representing a XML string or two 
arguments with the first one determining what kind of value the second parameter
contains: either a XML string, or an already opened file handle, or a file name,
or an object of type XML::LibXML::Node (or a subtype).

=head2 B<to_xml( Bool $format ) returns Str>

Returns a XML string containing the serialised collection.
If a TRUE value is provided as parameter the XML is nicely indented.
The method is inherited from C<PRANG>.

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
