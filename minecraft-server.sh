#!/bin/sh

# File paths
stdin=/tmp/minecraft-stdin
stdout=/tmp/minecraft-stdout
stderr=/tmp/minecraft-stderr

# Java settings
java=/usr/bin/java
java_opts='-Xms448M -Xmx448M -XX:+AggressiveOpts -XX:+DisableExplicitGC'

jar_file=minecraft_server.1.12.jar

# Delete and recreate fifo pipe
rm -f $stdin
mkfifo $stdin
chmod 666 $stdin

# Replace this process with Java process instead
exec $java $java_opts -jar $jar_file nogui 0<>$stdin 1>$stdout 2>$stderr
