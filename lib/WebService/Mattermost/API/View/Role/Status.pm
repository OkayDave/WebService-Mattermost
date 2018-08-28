package WebService::Mattermost::API::View::Role::Status;

use Moo::Role;
use Types::Standard qw(Maybe Str);

requires 'raw_data';

################################################################################

has status => (is => 'ro', isa => Maybe[Str], lazy => 1, builder => 1);

################################################################################

sub _build_status {
    my $self = shift;

    return $self->raw_data->{status};
}

################################################################################

1;
__END__

=head1 NAME

WebService::Mattermost::API::View::Role::Timestamps

=head1 DESCRIPTION

Attach an Status to a View object.

=head2 ATTRIBUTES

=over 4

=item C<status>

An item's status.

=back

=head1 AUTHOR

Mike Jones L<email:mike@netsplit.org.uk>

