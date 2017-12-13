#!/usr/bin/env bash

GIT_COMMIT=$(git rev-parse HEAD)
DIE = "GIT_COMMIT=${GIT_COMMIT}" > ./.env

/usr/local/bin/docker-compose up -d --build