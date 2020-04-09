use Irssi;
use strict;
use warnings;

our $VERSION = "1.0";
our %IRSSI = (
  authors     => 'Matt Turner',
  contact     => 'mattst88@gmail.com',
  name        => 'pid',
  description => 'Writes a pid file',
  license     => 'GNU GPLv2 or later',
  url         => 'https://mattst88.com/',
);

my $pidfile = "$ENV{XDG_RUNTIME_DIR}/irssi.pid";
open FH, ">", $pidfile or die "Error writing '$pidfile': $!\n";
print FH $$;
close FH;

sub remove_pidfile {
	unlink $pidfile;	
}

Irssi::command_bind('quit', 'remove_pidfile');

# vim:set ts=2 sw=2 expandtab:
