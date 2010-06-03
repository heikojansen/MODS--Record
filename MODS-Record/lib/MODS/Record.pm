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

#use MODS::relatedItem; # put here so that the subtype declaration in MODS::relatedItem works

#subtype 'MODS::Record::choice0' => as join("|", map { "MODS::$_" } qw(titleInfo name typeOfResource genre originInfo language physicalDescription abstract tableOfContents targetAudience note subject classification relatedItem identifier location accessCondition part extension recordInfo));

=head1 NAME

MODS::Record - Easily parse and create MODS records

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

has 'node_name' => ( is => 'rw', ); 
has 'ns' => ( is => 'rw', ); 
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
        filter => 'grep',
    },
);

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
        die "Invalid arguments supllied to 'MODS::Record->parse()'";
    }
    return;
};

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use MODS::Record;

    my $foo = MODS::Record->new();
    ...

=head1 SUBROUTINES/METHODS

=head2 function1

=cut

sub get_elements {
    my $self = shift;
    my $elem = shift;

    die "Invalid element name '$elem'" unless $elem =~ m/\A(titleInfo|name|typeOfResource|genre|originInfo|language|physicalDescription|abstract|tableOfContents|targetAudience|note|subject|classification|relatedItem|identifier|location|accessCondition|part|extension|recordInfo)\Z/o;
    return [ $self->filter( sub { ref $_ eq "MODS::$elem" } ) ];
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
