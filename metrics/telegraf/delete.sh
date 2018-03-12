#!/bin/sh

docker stop $(docker ps -a -q --filter name="telegraf")
docker rm $(docker ps -a -q --filter name="telegraf")