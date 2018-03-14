#!/bin/sh

docker stop $(docker ps -a -q --filter name="consul-agent")
docker rm $(docker ps -a -q --filter name="consul-agent")