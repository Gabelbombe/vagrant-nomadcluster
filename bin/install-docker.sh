#!/bin/bash
echo -e "[info] Installing Docker..."
sudo apt-get update
sudo apt-get -y remove docker docker-engine docker.io
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common unzip emacs

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository                                           \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu  \
      $(lsb_release -cs)                                          \
      stable"

sudo apt-get update
sudo apt-get install -y docker-ce

# Restart docker to make sure we get the latest version of the daemon if there is an upgrade
sudo service docker restart

# Make sure we can actually use docker as the vagrant user
sudo usermod -aG docker vagrant
sudo docker --version
