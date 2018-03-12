#!/bin/sh

docker stop $(docker ps -a -q --filter name="influxdb")
docker rm $(docker ps -a -q --filter name="influxdb")