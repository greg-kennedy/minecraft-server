#!/usr/bin/env perl
use strict;
use warnings;

use IO::Socket::INET;

my $server_name = "Just another Minecraft world"
my $server_port = 25565;

my $sock = IO::Socket::INET->new(
                           PeerPort  => 4445,
                           PeerAddr  => inet_ntoa(INADDR_BROADCAST),
                           Proto     => 'udp',
                           Broadcast => 1 )
                       or die "Can't bind : $@\n";

while (1)
{
  print $sock '[MOTD]' . $server_name . '[/MOTD][AD]' . $server_port . '[/AD]';
  sleep(5);
}
