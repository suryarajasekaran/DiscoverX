#!/bin/bash

service nginx stop
cp haproxy.cfg /etc/haproxy/nginx.conf
service nginx start
