package Net::Mattermost::Role::API;

use Moo::Role;
use Types::Standard qw(InstanceOf Str);

use Net::Mattermost::API;

################################################################################

has base_url => (is => 'ro', isa => Str, required => 1);

has api => (is => 'ro', isa => InstanceOf['Net::Mattermost::API'], lazy => 1, builder => 1);

################################################################################

sub _build_api {
    my $self = shift;

    return Net::Mattermost::API->new({ base_url => $self->base_url });
}

################################################################################

1;
__END__

=head1 NAME

Net::Mattermost::Role::API

=head1 DESCRIPTION

Add access to the Mattermost API to a class.

=head2 USAGE

    use Moo;

    with 'Net::Mattermost::Role::API';

    sub something {
        my $self = shift;

        # API available under $self->api->v4->[...]
    }

=head2 ATTRIBUTES

=over 4

=item C<base_url>

The base URL of your Mattermost API, including the version. Example:
C<https://my.mattermost.server.com/api/v4/>.

=item C<api>

The accessor for the API library.

=back

=head1 AUTHOR

Mike Jones L<email:mike@netsplit.org.uk>

