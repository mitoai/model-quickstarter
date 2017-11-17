#!/bin/bash

echo "Cleaning up since last run ..."
rm -r -v wdir/en_US
rm -r -v wdir/no_NO
rm -r -v wdir/da_DK
rm -r -v wdir/sv_SE
rm -r -v wdir/de_DE
rm -r -v wdir/es_ES
rm -r -v wdir/fr_FR
rm -r -v data
rm -r -v docker/models
mkdir -v data
mkdir -v docker/models

echo "Indexing ..."
./index_db.sh -b no/ignore.list wdir no_NO no/stopwords.list Norwegian docker/no/model
./index_db.sh -b sv/ignore.list wdir sv_SE sv/stopwords.list Swedish   docker/sv/model
./index_db.sh                   wdir da_DK da/stopwords.list Danish    docker/da/model
./index_db.sh -b en/ignore.list wdir en_US en/stopwords.list English   docker/en/model
./index_db.sh -b de/ignore.list wdir de_DE de/stopwords.list German    docker/de/model
./index_db.sh -b es/ignore.list wdir es_ES es/stopwords.list Spanish   docker/es/model
./index_db.sh -b fr/ignore.list wdir fr_FR fr/stopwords.list French    docker/fr/model


echo "Creating docker images ..."
docker build --tag mitoai/spotlight-en -f docker/en/Dockerfile docker/en && docker push mitoai/spotlight-en
docker build --tag mitoai/spotlight-no -f docker/no/Dockerfile docker/no && docker push mitoai/spotlight-no
docker build --tag mitoai/spotlight-da -f docker/da/Dockerfile docker/da && docker push mitoai/spotlight-da
docker build --tag mitoai/spotlight-sv -f docker/sv/Dockerfile docker/sv && docker push mitoai/spotlight-sv
docker build --tag mitoai/spotlight-de -f docker/de/Dockerfile docker/de && docker push mitoai/spotlight-de
docker build --tag mitoai/spotlight-es -f docker/es/Dockerfile docker/es && docker push mitoai/spotlight-es
docker build --tag mitoai/spotlight-fr -f docker/fr/Dockerfile docker/fr && docker push mitoai/spotlight-fr
