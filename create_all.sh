#!/usr/bin/env bash
BASE=docker/base-model/Dockerfile
BASE_IMAGE=eu.gcr.io/ntnu-smartmedia/spotlight-base-model-

docker build --build-arg WIKI_LANGUAGE=en --build-arg WIKI_LOCALE=en_US --build-arg WIKI_LANGUAGE_NAME=English   --tag $BASE_IMAGE-en -f $BASE .
docker build --build-arg WIKI_LANGUAGE=no --build-arg WIKI_LOCALE=no_NO --build-arg WIKI_LANGUAGE_NAME=Norwegian --tag $BASE_IMAGE-no -f $BASE .
docker build --build-arg WIKI_LANGUAGE=sv --build-arg WIKI_LOCALE=sv_SE --build-arg WIKI_LANGUAGE_NAME=Swedish   --tag $BASE_IMAGE-sv -f $BASE .
docker build --build-arg WIKI_LANGUAGE=da --build-arg WIKI_LOCALE=da_DK --build-arg WIKI_LANGUAGE_NAME=Danish    --tag $BASE_IMAGE-da -f $BASE .
docker build --build-arg WIKI_LANGUAGE=es --build-arg WIKI_LOCALE=es_ES --build-arg WIKI_LANGUAGE_NAME=Spanish   --tag $BASE_IMAGE-es -f $BASE .
docker build --build-arg WIKI_LANGUAGE=fr --build-arg WIKI_LOCALE=fr_FR --build-arg WIKI_LANGUAGE_NAME=French    --tag $BASE_IMAGE-fr -f $BASE .
docker build --build-arg WIKI_LANGUAGE=de --build-arg WIKI_LOCALE=de_DE --build-arg WIKI_LANGUAGE_NAME=German    --tag $BASE_IMAGE-de -f $BASE .


