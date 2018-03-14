#!/bin/bash

service haproxy stop
cp haproxy.cfg /etc/haproxy/haproxy.cfg
service haproxy start
