package WebService::Mattermost::V4::API::Object::ChannelStats;

# ABSTRACT: A channel stats item.

use Moo;
use Types::Standard qw(Int Maybe);

extends 'WebService::Mattermost::V4::API::Object';
with    qw(
    WebService::Mattermost::V4::API::Object::Role::BelongingToChannel
);

################################################################################

has member_count => (is => 'ro', isa => Maybe[Int], lazy => 1, builder => 1);

################################################################################

sub _build_member_count { shift->raw_data->{member_count} }

################################################################################

1;
__END__

=head1 DESCRIPTION

Details a Mattermost ChannelStats object.

=head2 ATTRIBUTES

=over 4

=item C<total_member_count>

=item C<active_member_count>

=back

=head1 SEE ALSO

=over 4

=item L<WebService::Mattermost::V4::API::Object::Role::BelongingToChannel>

=back
