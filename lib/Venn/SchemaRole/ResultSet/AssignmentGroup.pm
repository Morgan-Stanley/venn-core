package Venn::SchemaRole::ResultSet::AssignmentGroup;

=head1 NAME

package Venn::Schema::ResultSet::AssignmentGroup

=head1 DESCRIPTION

Base resultset for AssignmentGroup

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

use Moose::Role;
use MooseX::ClassAttribute;

class_has 'agt_name' => (
    traits => [qw/ SchemaClassAttr /],
    is => 'rw',
    isa => 'Str',
    required_class_attr => 0,
    documentation => 'Name of assignment group type',
);

=head1 METHODS

=head2 agt

AssignmentGroup definition

=cut

sub agt {
    my ($self) = @_;

    die "agt_name attribute has not been set" unless defined $self->agt_name;

    return $self->result_source->schema->resultset('AssignmentGroup_Type')
      ->single({ assignmentgroup_type_name => $self->agt_name });
}

1;
