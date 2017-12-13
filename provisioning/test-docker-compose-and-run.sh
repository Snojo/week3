#!/usr/bin/env bash

export GIT_COMMIT=$1

/usr/local/bin/docker-compose up -d --build