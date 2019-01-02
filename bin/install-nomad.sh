#!/bin/bash

# Packages required for nomad & consul
sudo apt-get install unzip curl vim -y
echo -e "[info] Installing Nomad..."
NOMAD_VERSION=0.8.6
cd /tmp/
curl -sSL https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip -o nomad.zip
unzip nomad.zip
sudo install nomad /usr/bin/nomad
sudo mkdir -p /etc/nomad.d
sudo chmod a+w /etc/nomad.d
