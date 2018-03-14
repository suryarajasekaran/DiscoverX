#!/bin/bash

docker run -d --name="consul" -p 8500:8500 -p 8600:8600 -p 8300-8302:8300-8302 -p 8600:8600/udp -p 8300-8302:8300-8302/udp -e CONSUL_BIND_INTERFACE=eth0 consul