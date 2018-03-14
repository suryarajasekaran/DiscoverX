#!/bin/bash

wget https://releases.hashicorp.com/consul-template/0.12.0/consul-template_0.12.0_linux_amd64.zip
unzip consul-template_0.12.0_linux_amd64.zip
sudo chmod a+x consul-template
sudo mv consul-template /usr/bin/consul-template
rm -rf consul-template_0.12.0_linux_amd64.zip
rm -rf consul-template_0.12.0_linux_amd64