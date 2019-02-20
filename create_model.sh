#!/usr/bin/env bash
WIKI_LANGUAGE=$1
WIKI_LANGUAGE_NAME=$2
WIKI_LOCALE=$3
WIKI_DUMP_DATE=$4

IMAGE=eu.gcr.io/ntnu-smartmedia/spotlight-base-model-${WIKI_LANGUAGE}

echo "Starting $WIKI_LANGUAGE ..."
docker build \
  --build-arg WIKI_LANGUAGE=${WIKI_LANGUAGE} \
  --build-arg WIKI_LOCALE=${WIKI_LOCALE} \
  --build-arg WIKI_LANGUAGE_NAME=${WIKI_LANGUAGE_NAME} \
  --build-arg WIKI_DUMP_DATE=${WIKI_DUMP_DATE} \
  --tag ${IMAGE} \
  -f docker/base-model/Dockerfile .

docker push ${IMAGE}