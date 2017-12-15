#!/bin/bash

exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

sudo yum -y update
sudo yum -y install docker
sudo pip install docker-compose
sudo pip install backports.ssl_match_hostname --upgrade

sudo service docker start
sudo usermod -a -G docker ec2-user

DD_API_KEY=0f986f2f8a89d133fbf9bf1dd23a0935 bash -c "$(curl -L https://raw.githubusercontent.com/DataDog/dd-agent/master/packaging/datadog-agent/source/install_agent.sh)"

touch ec2-init-done.markerfile