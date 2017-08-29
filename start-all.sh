#!/usr/bin/env bash

echo "Starting English ..."
docker run -d --name spotlight-en -p 3001:80 mitoai/spotlight-en

echo "Starting Norwegian ..."
docker run -d --name spotlight-no -p 3002:80 mitoai/spotlight-no

echo "Starting Danish ..."
docker run -d --name spotlight-da -p 3003:80 mitoai/spotlight-da

echo "Starting Swedish ..."
docker run -d --name spotlight-sv -p 3004:80 mitoai/spotlight-sv
