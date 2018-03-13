#!/bin/sh

docker stop $(docker ps -a -q --filter name="manager")
docker rm $(docker ps -a -q --filter name="manager")