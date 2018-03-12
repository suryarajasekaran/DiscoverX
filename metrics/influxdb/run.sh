#!/bin/sh

docker run -d --name=influxdb -p 8086:8086 -v Container_InfluxDB:/var/lib/influxdb influxdb
sleep 5 # sleep for 5secs before attempting to create a database on influx
curl -X POST 'http://localhost:8086/query?pretty=true'  --data-urlencode "q=DROP DATABASE telegraf"
curl -X POST 'http://localhost:8086/query?pretty=true'  --data-urlencode "q=CREATE DATABASE telegraf"
curl -X POST 'http://localhost:8086/query?pretty=true'  --data-urlencode "q=ALTER RETENTION POLICY autogen ON telegraf DURATION 24h SHARD DURATION 1h"
