# minecraft-server
Greg Kennedy <kennedy.greg@gmail.com>

A collection of scripts to help stand up a vanilla Minecraft server

## Description
This repository is a collection of tools to help start and manage a vanilla Minecraft server.

## Installation
* Start from an existing Ubuntu installation
* Become root (`sudo su`)
* Install Dependencies
  * Install `openjdk8` and `perl` from apt
  * Create a user "minecraft" and group "minecraft", no password, home directory `/home/minecraft` and login shell `/bin/false`
* Install server, server wrapper and announce script
  * `cd /home/minecraft`
  * Get the latest Minecraft server jar and put that in this folder
  * Place `announce.pl` and `minecraft-server.sh` in here
  * `chown -R minecraft:minecraft .` from within /home/minecraft
* Install systemd unit files
  * `cd /etc/systemd/system`
  * Place `minecraft-server.service` and `minecraft-announce.service` here
  * `systemctl enable minecraft-server.service`
  * `systemctl enable minecraft-announce.service`
 * Reboot, or just start the services

## Usage
To change the server name that appears in LAN clients, edit `announce.pl` and change the value for $server_name

When the server is running, you can interact with it by writing data to the named pipe.  By default, this is at `/tmp/minecraft-stdin` (edit `minecraft-server.sh` to change these locations).  For example,

    echo "say hi" > /tmp/minecraft-stdin

will print "[Server] hi" to all connected players.  You can also monitor server status by reading `/tmp/minecraft-stdout`.

Connecting these files to a web UI is left as an exercise to the reader.
