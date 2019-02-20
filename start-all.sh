#!/usr/bin/env bash
echo "Starting English ..."
docker run -d --name spotlight-en -p 3001:80 eu.gcr.io/ntnu-smartmedia/spotlight-server-en:latest

echo "Starting Norwegian ..."
docker run -d --name spotlight-no -p 3002:80 eu.gcr.io/ntnu-smartmedia/spotlight-server-no:latest

echo "Starting Danish ..."
docker run -d --name spotlight-da -p 3003:80 eu.gcr.io/ntnu-smartmedia/spotlight-server-da:latest

echo "Starting Swedish ..."
docker run -d --name spotlight-sv -p 3004:80 eu.gcr.io/ntnu-smartmedia/spotlight-server-sv:latest

echo "Starting French ..."
docker run -d --name spotlight-fr -p 3005:80 eu.gcr.io/ntnu-smartmedia/spotlight-server-fr:latest

echo "Starting German ..."
docker run -d --name spotlight-de -p 3006:80 eu.gcr.io/ntnu-smartmedia/spotlight-server-de:latest

echo "Starting Spanish ..."
docker run -d --name spotlight-es -p 3007:80 eu.gcr.io/ntnu-smartmedia/spotlight-server-es:latest
