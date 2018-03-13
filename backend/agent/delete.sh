#!/bin/sh

docker stop $(docker ps -a -q --filter name="agent")
docker rm $(docker ps -a -q --filter name="agent")