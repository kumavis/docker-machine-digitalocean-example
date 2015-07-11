#!/usr/bin/env bash

DIGITALOCEAN_ACCESS_TOKEN=

if [ -z "${DIGITALOCEAN_ACCESS_TOKEN}" ]; then
    echo "Please set DIGITALOCEAN_ACCESS_TOKEN" >&2
    echo "You can generate one at https://cloud.digitalocean.com/settings/tokens/new" >&2
    exit 1
fi

docker-machine create \
    --driver digitalocean \
    --digitalocean-access-token "${DIGITALOCEAN_ACCESS_TOKEN}" \
    --digitalocean-region lon1 \
    digitalocean

docker-machine ssh digitalocean 'mkdir -p /data/node-drop'
docker-machine scp -r app digitalocean:/data/node-drop

eval "$(docker-machine env digitalocean)"

docker run \
    --name=node-drop \
    -d \
    -v /data/node-drop/app:/data/node-drop \
    -p 1337:1337 \
    node \
    node /data/node-drop/app.js

sleep 3

curl "$(docker-machine ip digitalocean):1337"

docker stop node-drop
docker rm node-drop

docker-machine rm digitalocean
