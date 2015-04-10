use 5.006;
use strict;
use warnings;

package Dist::Zilla::dumpphases::Theme::basic::plain;

our $VERSION = '1.000007';

# ABSTRACT: A plain-text theme for dzil dumpphases

# AUTHORITY

=begin MetaPOD::JSON v1.1.0

{
    "namespace":"Dist::Zilla::dumpphases::Theme:::basic::plain",
    "does":"Dist::Zilla::dumpphases::Role::Theme",
    "inherits":"Moo::Object",
    "interface":"class"
}

=end MetaPOD::JSON

=cut

use Moo qw( with );

with 'Dist::Zilla::dumpphases::Role::Theme';

=method C<print_section_header>

See L<Dist::Zilla::dumpphases::Role::Theme/print_section_header>.

This satisfies that, printing C<$label> and C<$value>,uncolored, as

    \n
    $label$value\n

=cut

sub print_section_header {
  my ( undef, $label, $value ) = @_;
  return printf "\n%s%s\n", $label, $value;
}

=method C<print_section_prelude>

See L<Dist::Zilla::dumpphases::Role::Theme/print_section_prelude>.

This satisfies that, printing C<$label> and C<$value> uncolored, as:

     - $label$value\n

=cut

sub print_section_prelude {
  my ( undef, $label, $value ) = @_;
  return printf "%s%s\n", ' - ' . $label, $value;
}

=method C<print_star_assoc>

See L<Dist::Zilla::dumpphases::Role::Theme/print_star_assoc>.

This satisfies that, printing C<$label> and C<$value> uncolored, as:

     * $label => $value

=cut

sub print_star_assoc {
  my ( undef, $name, $value ) = @_;
  return printf "%s%s%s\n", ' * ', $name, ' => ' . $value;
}

=head1 SYNOPSIS

    dzil dumpphases --color-theme=basic::plain

=for html <center><img src="http://kentnl.github.io/Dist-Zilla-App-Command-dumpphases/media/theme_basic_plain.png" alt="Screenshot" width="677" height="412"/></center>

=cut

1;
