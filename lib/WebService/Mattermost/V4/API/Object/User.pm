package WebService::Mattermost::V4::API::Object::User;

use Moo;
use Types::Standard qw(Bool HashRef InstanceOf Int Maybe Str);

extends 'WebService::Mattermost::V4::API::Object';
with    qw(
    WebService::Mattermost::V4::API::Object::Role::ID
    WebService::Mattermost::V4::API::Object::Role::Timestamps
);

################################################################################

has [ qw(
    allow_marketing
    is_system_admin
    is_system_user
) ] => (is => 'ro', isa => Bool, lazy => 1, builder => 1);

has [ qw(
    auth_data
    auth_service
    email
    first_name
    last_name
    locale
    nickname
    roles
    position
    username
) ] => (is => 'ro', isa => Maybe[Str], lazy => 1, builder => 1);

has [ qw(
    password_updated_at
    picture_updated_at
) ] => (is => 'ro', isa => Maybe[InstanceOf['DateTime']], lazy => 1, builder => 1);

################################################################################

sub _build_allow_marketing {
    my $self = shift;

    return $self->raw_data->{allow_marketing} ? 1 : 0;
}

sub _build_is_system_admin {
    my $self = shift;

    return $self->roles =~ /system_admin/ ? 1 : 0;
}

sub _build_is_system_user {
    my $self = shift;

    return $self->roles =~ /system_user/ ? 1 : 0;
}

sub _build_password_updated_at {
    my $self = shift;

    return $self->_from_epoch($self->raw_data->{last_password_update});
}

sub _build_picture_updated_at {
    my $self = shift;

    return $self->_from_epoch($self->raw_data->{last_picture_update});
}

################################################################################

1;
