#!/usr/bin/env bash
WIKI_LANGUAGE=$1
WIKI_LANGUAGE_NAME=$2
WIKI_LOCALE=$3
PORT=$4
MEMORY=$5
WIKI_DUMP_DATE=$6

./create_model.sh  $WIKI_LANGUAGE $WIKI_LANGUAGE_NAME $WIKI_LOCALE $WIKI_DUMP_DATE
./create_server.sh $WIKI_LANGUAGE
./start-server.sh  $WIKI_LANGUAGE $WIKI_LANGUAGE_NAME $WIKI_LOCALE $PORT $MEMORY
