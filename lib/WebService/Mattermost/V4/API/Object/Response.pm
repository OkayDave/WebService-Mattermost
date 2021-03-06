package WebService::Mattermost::V4::API::Object::Response;

# ABSTRACT: A generic response item.

use Moo;

extends 'WebService::Mattermost::V4::API::Object';
with    qw(
    WebService::Mattermost::V4::API::Object::Role::ID
    WebService::Mattermost::V4::API::Object::Role::Message
    WebService::Mattermost::V4::API::Object::Role::RequestID
    WebService::Mattermost::V4::API::Object::Role::StatusCode
);

################################################################################

1;
__END__

=head1 DESCRIPTION

Details a generic response from Mattermost.

=head1 SEE ALSO

=over 4

=item L<WebService::Mattermost::V4::API::Object::Role::ID>

=item L<WebService::Mattermost::V4::API::Object::Role::Message>

=item L<WebService::Mattermost::V4::API::Object::Role::RequestID>

=item L<WebService::Mattermost::V4::API::Object::Role::StatusCode>

=back
