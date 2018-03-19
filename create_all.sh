#!/bin/bash
set -e

./index_db.sh -b no/ignore.list wdir no_NO no/stopwords.list Norwegian docker/no/model
./index_db.sh -b sv/ignore.list wdir sv_SE sv/stopwords.list Swedish   docker/sv/model
./index_db.sh                   wdir da_DK da/stopwords.list Danish    docker/da/model
./index_db.sh -b en/ignore.list wdir en_US en/stopwords.list English   docker/en/model
./index_db.sh -b de/ignore.list wdir de_DE de/stopwords.list German    docker/de/model
./index_db.sh -b es/ignore.list wdir es_ES es/stopwords.list Spanish   docker/es/model
./index_db.sh -b fr/ignore.list wdir fr_FR fr/stopwords.list French    docker/fr/model
