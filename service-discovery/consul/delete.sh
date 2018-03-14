#!/bin/sh

docker stop $(docker ps -a -q --filter name="consul")
docker rm $(docker ps -a -q --filter name="consul")