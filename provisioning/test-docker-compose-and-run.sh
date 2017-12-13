#!/usr/bin/env bash

GIT_COMMIT=$(git rev-parse HEAD)

/usr/local/bin/docker-compose up -d --build