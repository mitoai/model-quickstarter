#!/usr/bin/env bash
WIKI_LANGUAGE=$1

IMAGE=eu.gcr.io/ntnu-smartmedia/spotlight-server-${WIKI_LANGUAGE}

docker build \
  --build-arg WIKI_LANGUAGE=${WIKI_LANGUAGE} \
  --tag eu.gcr.io/ntnu-smartmedia/spotlight-server-${WIKI_LANGUAGE} \
  -f docker/server/Dockerfile docker/server

docker push ${IMAGE}
