#!/usr/bin/env bash

echo "Starting English ..."
docker rm -f spotlight-en
docker pull mitoai/spotlight-en
docker run -d --name spotlight-en -p 3001:80 e932f6bdf9b5

echo "Starting Norwegian ..."
docker rm -f spotlight-no
docker pull mitoai/spotlight-no
docker run -d --name spotlight-no -p 3002:80 0068eb345dc6

echo "Starting Danish ..."
docker rm -f spotlight-da
docker pull mitoai/spotlight-da
docker run -d --name spotlight-da -p 3003:80 4a45ccf1c866

echo "Starting Swedish ..."
docker rm -f spotlight-sv
docker pull mitoai/spotlight-sv
docker run -d --name spotlight-sv -p 3004:80 73a46e422617

echo "Starting Spanish ..."
docker rm -f spotlight-es
docker pull mitoai/spotlight-es
docker run -d --name spotlight-es -p 3005:80 9d4249d6c955

echo "Starting German ..."
docker rm -f spotlight-de
docker pull mitoai/spotlight-de
docker run -d --name spotlight-de -p 3006:80 3077fa83dd99

echo "Starting French ..."
docker rm -f spotlight-fr
docker pull mitoai/spotlight-fr
docker run -d --name spotlight-fr -p 3007:80 9e5983cc3f7c
