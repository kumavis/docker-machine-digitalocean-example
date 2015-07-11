# Docker Machine + Digital Ocean provider example

This example uses Docker Machine to spin up a Digital Ocean droplet Docker host and run a hello world node js app on it.

## Requirements

* Docker >= 1.7.0
* Docker Machine >= 0.3.0

## Quick start

1. Generate a new token from https://cloud.digitalocean.com/settings/tokens/new
1. Update ```node-drop.sh``` setting the value of ```DIGITALOCEAN_ACCESS_TOKEN``` to the value of this token.
1. Run ```./node-drop.sh```
