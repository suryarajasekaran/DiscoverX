#!/bin/sh

docker stop $(docker ps -a -q --filter name="mongo")
docker rm $(docker ps -a -q --filter name="mongo")