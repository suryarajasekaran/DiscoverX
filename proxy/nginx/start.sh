#!/bin/bash

service nginx stop
cp nginx.conf /etc/nginx/nginx.conf
service nginx start
