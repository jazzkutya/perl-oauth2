package LWP::Authen::OAuth2::ServiceProvider::Strava;

# ABSTRACT: Access Strava using OAuth2
# VERSION

use strict;
use warnings;

our @ISA = qw(LWP::Authen::OAuth2::ServiceProvider);

sub authorization_endpoint {
    return "https://www.strava.com/oauth/authorize";
}

sub token_endpoint {
    return "https://www.strava.com/oauth/token";
}

sub authorization_required_params {
    my $self = shift;
    return ("client_id", "redirect_uri", "response_type", $self->SUPER::authorization_required_params());
}

sub authorization_optional_params {
    my $self = shift;
    return ("approval_prompt", "scope", "state", $self->SUPER::authorization_optional_params());
}

sub request_default_params {
    my $self = shift;
    return (
        "scope" => "public",
        "response_type" => "code",
        $self->SUPER::request_default_params()
    );
}

=head1 NAME

LWP::Authen::OAuth2::ServiceProvider::Strava - Access Strava API v3  OAuth2 APIs

=head1 VERSION

Version 0.02

=cut

=head1 SYNOPSIS

See L<http://strava.github.io/api/> for Strava's own documentation. Strava's
documentation is very detailed, so that is the best place to find detailed
and up to date info about.

=head1 REGISTERING

Before you can use OAuth 2 with Strava you need to register yourself as a
client.  For that, go to L<https://www.strava.com/settings/api> and register
your application. You'll need to set C<redirect_uri> with them, which will 
need to be an C<https://...> URL under your control. (Though you can set
127.0.0.1 if you are using this in a script).

All the standard LWP::Useragent methods are available, but it will also
take a Request Object if you need something more. (LWP::Authen:OAuth2 contains
all the relevant doco).

=head1 AUTHOR

Leon Wright, C<< <techman@cpan.org> >>

=cut

1;
