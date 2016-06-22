package LWP::Authen::OAuth2::ServiceProvider::Dwolla;

use strict;
use warnings;

use base qw/LWP::Authen::OAuth2::ServiceProvider/;

use JSON qw/decode_json/;


sub authorization_endpoint {
    my $self = shift;
    my $host = $self->{use_test_urls} ? 'uat.dwolla.com' : 'www.dwolla.com';
    return 'https://'.$host.'/oauth/v2/authenticate';
}

sub token_endpoint {
    my $self = shift;
    my $host = $self->{use_test_urls} ? 'uat.dwolla.com' : 'www.dwolla.com';
    return 'https://'.$host.'/oauth/v2/token';
}

sub api_url_base {
    my $self = shift;
    my $host = $self->{use_test_urls} ? 'api-uat.dwolla.com' : 'api.dwolla.com';
    return 'https://'.$host;
}

sub authorization_required_params {
    my $self = shift;
    return ('scope', $self->SUPER::authorization_required_params());
}

sub authorization_optional_params {
    my $self = shift;
    return ($self->SUPER::authorization_optional_params(), 'dwolla_landing');
}

sub default_api_headers {
    return { 'Content-Type' => 'application/vnd.dwolla.v1.hal+json', 'Accept' => 'application/vnd.dwolla.v1.hal+json' };
}


1;
