package MODS::Role::SingleArg;

use Moose::Role;

sub BUILDARGS {
    my $invocant = shift;
    if ( @_ == 1 ) {
        if ( ref $_[0] eq 'HASH' ) {
            return shift;
        }
        else {
            return { text => shift };
        }
    }
    my %args = @_;
    return \%args;
}

1;
