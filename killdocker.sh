#!/bin/bash


docker kill $(docker ps -q)
docker rmi $(docker images -q)
docker rm $(docker ps -aq)
