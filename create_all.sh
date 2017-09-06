#!/bin/bash

echo "Cleaning up since last run ..."
rm -r -v wdir/en_US
rm -r -v wdir/no_NO
rm -r -v wdir/da_DK
rm -r -v wdir/sv_SE
rm -r -v data
rm -r -v docker/models
mkdir -v data
mkdir -v docker/models

echo "Indexing ..."
./index_db.sh -b no/ignore.list wdir no_NO no/stopwords.list Norwegian docker/no/model
#./index_db.sh -b sv/ignore.list wdir sv_SE sv/stopwords.list Swedish   docker/sv/model
#./index_db.sh                   wdir da_DK da/stopwords.list Danish    docker/da/model
#./index_db.sh -b en/ignore.list wdir en_US en/stopwords.list English   docker/en/model

echo "Creating docker images ..."
#docker build --tag mitoai/spotlight-en -f docker/en/Dockerfile docker/en && docker push mitoai/spotlight-en
docker build --tag mitoai/spotlight-no -f docker/no/Dockerfile docker/no && docker push mitoai/spotlight-no
#docker build --tag mitoai/spotlight-da -f docker/da/Dockerfile docker/da && docker push mitoai/spotlight-da
#docker build --tag mitoai/spotlight-sv -f docker/sv/Dockerfile docker/sv && docker push mitoai/spotlight-sv
