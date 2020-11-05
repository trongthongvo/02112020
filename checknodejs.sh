#!/bin/bash
NB_RUNNING=`docker ps --filter "name=node-js-2020" --format "{{.Image}}" | wc -l`
if [ "$NB_RUNNING" -eq "1" ]; then
    docker rm -f node-js-2020
else
    echo "No container running. Don't need to remove"
fi
#if [ "$(docker ps -aq -f status=exited -f name=python-app-2020)" ]; then
#        docker rm -f python-app-2020
