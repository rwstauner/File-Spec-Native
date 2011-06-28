use strict;
use warnings;
use Test::More;

use File::Spec ();
use File::Spec::Native ();

plan tests => 3;

my @path = qw(dumb module);
is(File::Spec->catfile(@path), File::Spec::Native->catfile(@path), 'base == Native');

use File::Spec::Functions qw(catdir);
is(catdir(@path), File::Spec::Native->catdir(@path), 'base == Native');

my $format = $File::Spec::ISA[0] eq 'Win32' ? 'Unix' : 'Win32';
my $fsclass = "File::Spec::$format";
eval "require $fsclass";

my $foreign = $fsclass->catfile(@path);

isnt($foreign, File::Spec::Native->catfile(@path), 'foreign != native');
