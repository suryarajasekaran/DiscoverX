#!/bin/bash

service telegraf stop
kill -9 $(ps -ef | grep telegraf)
wget https://dl.influxdata.com/telegraf/releases/telegraf-1.5.2-1.x86_64.rpm
sudo yum localinstall telegraf-1.5.2-1.x86_64.rpm
rm -rf telegraf-1.5.2-1.x86_64.rpm