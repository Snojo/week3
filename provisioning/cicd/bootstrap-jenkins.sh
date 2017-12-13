#!/usr/bin/env bash

exec > >(tee /var/log/user-data.log | logger -t user-data -s 2>/dev/console) 2>&1

sudo yum update
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
sudo yum -y remove java-1.7.0-openjdk
sudo yum -y install java-1.8.0

sudo yum -y install docker
sudo yum -y install git

sudo service docker start
sudo usermod -a -G docker ec2-user
sudo pip install docker-compose
sudo pip install backports.ssl_match_hostname --upgrade

curl --silent --location https://rpm.nodesource.com/setup_9.x | sudo bash -
sudo yum -y install nodejs
sudo yum -y install gcc-c++ make

sudo yum install jenkins -y
sudo usermod -a -G docker jenkins
sudo usermod -a -G docker dd-agent

sudo service jenkins start

#docker run -d --name dd-agent -v /var/run/docker.sock:/var/run/docker.sock:ro -v /proc/:/host/proc/:ro -v /cgroup/:/host/sys/fs/cgroup:ro -e API_KEY=503a19af5fbb1affa42e535f807d6ac8 -e SD_BACKEND=docker datadog/docker-dd-agent:latest


touch ec2-init-done.markerfile