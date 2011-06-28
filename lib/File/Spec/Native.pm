# vim: set ts=2 sts=2 sw=2 expandtab smarttab:
use strict;
use warnings;

package File::Spec::Native;
# ABSTRACT: Use native OS implementation of File::Spec from a subclass

use File::Spec (); #core
our @ISA = qw(File::Spec);

# TODO: import?  -as => NATIVE

1;

=for test_synopsis
my ($win32_path, $file_path);

=head1 SYNOPSIS

  # This serves little purpose on its own but can be useful in some situations

  # For example:
  use Path::Class 0.24;

  # convert foreign file type into native type
  # without having to know what the current OS is
  foreign_file(Win32 => $win32_path)->as_foreign("Native");

  # or to build a file-spec dynamically (possibly taking the type from input):
  my $type = get_requested_file_spec(); # can return "Native"
  foreign_file($type => $file_path);

  # having $type be "Native" is an alternative to having to do:
  my $file = $type ? foreign_file($type, $file_path) : file($file_path);

=head1 DESCRIPTION

This module is a stupid hack to make the default L<File::Spec> behavior
available from a subclass.  This can be useful when using another module
that expects a subclass of L<File::Spec> but you want to use
the current, native OS format (automatically detected by L<File::Spec>).

For example: L<Path::Class/as_foreign> (as of version 0.24)
allows you to translate a L<Path::Class> object from one OS format to another.
However, there is no way to specify that you want to translate the path into
the current, native OS format without guessing at what that format is
(which may include peeking into C<@File::Spec::ISA>).

This module C<@ISA> L<File::Spec>.

=head1 SEE ALSO

=for :list
* L<File::Spec>
* L<Path::Class>
* L<https://rt.cpan.org/Ticket/Display.html?id=49721>

=cut
