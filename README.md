# docker-backuppc

## Synopsis

A simple docker container for running Backuppc

## Description

This container installs Backuppc from Debian Jessie sources. On startup it
checks if the provides volumes for data and configuration are emppty and
if yes, move the configuration from packaging into it.

### Default settings

* No authentication
* SSH host key checking **disabled**
* If the data volume is empty, a new SSH keypair gets generated at startup

### Volumes

* ``/var/lib/backuppc``: Persistent data for backuppc, including ssh key
* ``/etc/backuppc``: Configuration for backuppc

### Ports

* ``80``: Webinterface

## License

AGPLv3

## Author information

Alvaro Aleman
