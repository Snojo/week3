#!/usr/bin/env bash

export GIT_COMMIT=$(git rev-parse HEAD)
#export DIE = "GIT_COMMIT=${GIT_COMMIT}" > ./.env

/usr/local/bin/docker-compose up -d --build -p 8000