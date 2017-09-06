#!/usr/bin/env bash

echo "Starting English ..."
docker rm -f spotlight-en
docker pull mitoai/spotlight-en
docker run -d --name spotlight-en -p 3001:80 mitoai/spotlight-en
echo "Starting Norwegian ..."
docker rm -f spotlight-no
docker pull mitoai/spotlight-no
docker run -d --name spotlight-no -p 3002:80 mitoai/spotlight-no
echo "Starting Danish ..."
docker rm -f spotlight-da
docker pull mitoai/spotlight-da
docker run -d --name spotlight-da -p 3003:80 mitoai/spotlight-da
echo "Starting Swedish ..."
docker rm -f spotlight-sv
docker pull mitoai/spotlight-sv
docker run -d --name spotlight-sv -p 3004:80 mitoai/spotlight-sv
