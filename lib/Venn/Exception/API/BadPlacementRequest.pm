package Venn::Exception::API::BadPlacementRequest;

=head1 NAME

Venn::Exception::API::BadPlacementRequest

=head1 AUTHOR

Venn Engineering

Josh Arenberg, Norbert Csongradi, Ryan Kupfer, Hai-Long Nguyen

=head1 LICENSE

Copyright 2013,2014,2015 Morgan Stanley

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=cut

use Moose;
extends 'Venn::Exception';

has 'request' => (
    is       => 'ro',
    isa      => 'Any',
    required => 1,
);

has 'reason' => (
    is       => 'ro',
    isa      => 'Any',
    required => 1,
);

has '+message' => (
    default => 'Bad request for Placement Engine',
    lazy    => 1,
);

override 'as_string_no_trace' => sub {
    my ($self) = @_;

    return super() . ': ' . $self->reason;
};

no Moose;
__PACKAGE__->meta->make_immutable(inline_constructor => 0);
