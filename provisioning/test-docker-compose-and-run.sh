#!/usr/bin/env bash

GIT_COMMIT=$(git rev-parse HEAD) > .env

/usr/local/bin/docker-compose up -d --build