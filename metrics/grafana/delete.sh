#!/bin/sh

docker stop $(docker ps -a -q --filter name="grafana")
docker rm $(docker ps -a -q --filter name="grafana")