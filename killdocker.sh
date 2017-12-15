#!/bin/bash


docker kill $(docker ps -q)
docker rm $(docker ps -aq)
docker rmi $(docker images -q)