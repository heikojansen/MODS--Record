package MODS::titleInfo;

use Moose;
use PRANG::Graph;
use Moose::Util::TypeConstraints;

use MODS::titleInfo::title;
use MODS::titleInfo::subTitle;
use MODS::titleInfo::partNumber;
use MODS::titleInfo::partName;
use MODS::titleInfo::nonSort;

has_attr 'type' => ( is => 'rw', isa => 'MODS::Type::titleInfoType', coerce => 1, );

has_attr 'displayLabel' => ( is => 'rw', isa => 'PRANG::XMLSchema::token', coerce => 1, );

has_attr 'ID' => ( is => 'rw', isa => 'PRANG::XMLSchema::token', coerce => 1, );

has_attr 'authority' => ( is => 'rw', isa => 'PRANG::XMLSchema::token', coerce => 1, );

subtype 'MODS::titleInfo::choice0' => as join( '|',
											   qw( MODS::titleInfo::title
                                                   MODS::titleInfo::subTitle 
                                                   MODS::titleInfo::partNumber 
                                                   MODS::titleInfo::partName 
                                                   MODS::titleInfo::nonSort
                                               )
);

has_element 'elems' => ( is           => 'rw',
                         isa          => 'ArrayRef[MODS::titleInfo::choice0]',
						 xml_nodeName => { title      => 'MODS::titleInfo::title',
										   subTitle   => 'MODS::titleInfo::subTitle',
										   partNumber => 'MODS::titleInfo::partNumber',
										   partName   => 'MODS::titleInfo::partName',
										   nonSort    => 'MODS::titleInfo::nonSort',
						 },
						 xml_min => 0,
                         coerce => 1,
);

sub BUILDARGS {
    my $invocant = shift;
    if ( ref $_[0] eq 'HASH' ) {
        return shift;
    }
    elsif ( ref $_[0] eq 'ARRAY' ) {
        return { elems => shift };
    }
    return { @_ };
}

sub root_element { 'titleInfo' };

coerce "ArrayRef[MODS::titleInfo::choice0]"
    => from "ArrayRef[MODS::titleInfo::choice0|HashRef]"
    => via {
        my @rv = @$_;
        for ( @rv ) {
            if ( ref $_ eq "HASH" ) {
                my $mod = (keys(%{$_}))[0];
                my $par = (values(%{$_}))[0];
                $_ = "MODS::titleInfo::$mod"->new( $par );
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
    },
;

with qw( MODS::Role::TopLevelElement MODS::Type::languageAttrGrp MODS::Type::simpleLinkAttrGrp MODS::Node );

1;
