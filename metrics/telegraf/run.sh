#!/bin/sh

docker run -d --name=telegraf --link influxdb:influxdb -p 8083:8083 -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/$(dirname "$0")/telegraf.conf:/etc/telegraf/telegraf.conf:ro telegraf
docker exec -it telegraf /bin/bash service telegraf start