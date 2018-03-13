#!/bin/sh

docker stop $(docker ps -a -q --filter name="frontend")
docker rm $(docker ps -a -q --filter name="frontend")