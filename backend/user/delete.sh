#!/bin/sh

docker stop $(docker ps -a -q --filter name="user")
docker rm $(docker ps -a -q --filter name="user")