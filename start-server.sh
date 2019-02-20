#!/usr/bin/env bash
WIKI_LANGUAGE=$1
WIKI_LANGUAGE_NAME=$2
WIKI_LOCALE=$3
PORT=$4
MEMORY=$5

echo "Starting $WIKI_LANGUAGE ..."
docker rm -f spotlight-$WIKI_LANGUAGE
docker run -d \
  -e MEMORY=${MEMORY} \
  -e WIKI_LANGUAGE_NAME=${WIKI_LANGUAGE} \
  -e WIKI_LOCALE=${WIKI_LOCALE} \
  -e WIKI_LANGUAGE=${WIKI_LANGUAGE} \
  --name spotlight-${WIKI_LANGUAGE} \
  -p ${PORT}:80 \
  eu.gcr.io/ntnu-smartmedia/spotlight-server-${WIKI_LANGUAGE}:latest
