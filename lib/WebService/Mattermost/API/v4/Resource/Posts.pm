package WebService::Mattermost::API::v4::Resource::Posts;

use Moo;

extends 'WebService::Mattermost::API::v4::Resource';

################################################################################

sub create {
    my $self = shift;
    my $args = shift;

    if ($args->{message} && $args->{message} =~ /^\d+$/) {
        # Messages should always be strings - don't interpret them as a boolean
        # value
        $args->{message} .= '';
    }

    return $self->_post({
        parameters => $args,
        required   => [ qw(channel_id message) ],
    });
}

sub reactions_for_id {
    my $self = shift;
    my $id   = shift;

    return $self->_get({
        endpoint => '%s/reactions',
        ids      => [ $id ],
    });
}

################################################################################

1;
__END__

=head1 NAME

WebService::Mattermost::API::v4::Resource::Posts

=head1 DESCRIPTION

=head2 USAGE

    use WebService::Mattermost;

    my $mm = WebService::Mattermost->new({
        authenticate => 1,
        username     => 'email@address.com',
        password     => 'passwordhere',
        base_url     => 'https://my.mattermost.server.com/api/v4/',
    });

    my $posts = $mm->api->v4->posts;

=head2 METHODS

=over 4

=item C<reactions_for_id()>

Get reactions for a message by ID.

    my $response = $posts->reactions_for_id('idhere');

=back

=head1 SEE ALSO

=over 4

=item L<https://api.mattermost.com/#tag/posts>

Official "posts" API documentation.

=back

=head1 AUTHOR

Mike Jones L<email:mike@netsplit.org.uk>
