#!/bin/bash

service telegraf stop
sleep 5

cp telegraf.conf /etc/telegraf/telegraf.conf

service telegraf start
