# Docker Machine + DigitalOcean provider example

This example uses Docker Machine to spin up a DigitalOcean droplet Docker host and run a container with a 'hello world' node js app in it. The app is the tiny 'hello world' http server from the language documentation but binds to any address rather than just localhost.

## Requirements

* Docker >= 1.7.0
* Docker Machine >= 0.3.0
* DigitalOcean account + credit

## Quick start

1. Generate a new token from https://cloud.digitalocean.com/settings/tokens/new
1. Update ```node-drop.sh``` setting the value of ```DIGITALOCEAN_ACCESS_TOKEN``` to the value of this token.
1. Run ```./node-drop.sh```

## How does the script work?

1. Uses Docker Machine to create a DigitalOcean droplet which runs the Docker host.
1. Makes a folder for the app on the remote host and copies it over using the ssh and scp Docker Machine commands.
1. Configures the current shell environment so that Docker points to the host on the remote host.
1. Uses Docker to run a node js container with the application mounted in it and exposing port 1337.
1. Waits a few seconds for the container to start, then finds the remote host's IP address and curls it on port 1337.
1. Stops and removes the container and finally destroys the Docker Machine, and in doing so - the DigitalOcean droplet.
