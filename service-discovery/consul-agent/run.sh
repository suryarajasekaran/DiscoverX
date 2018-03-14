#!/bin/bash

docker run -d --net=host -p 8500:8500 -p 8600:8600 -p 8300-8302:8300-8302 -e 'CONSUL_LOCAL_CONFIG={"leave_on_terminate": true}' consul agent --retry-join=54.193.13.172