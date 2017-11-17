#!/bin/bash

wget --no-check-certificate -q https://raw.githubusercontent.com/dbpedia-spotlight/model-quickstarter/master/index_db.sh
chmod +x index_db.sh

mkdir wdir
mkdir models
mkdir data

mvn_version=`mvn -version | grep "Apache Maven" | sed -r "s/Apache Maven (\S+).*/\1/"`
if [[ "$mvn_version" > "3.0.0" ]]; then
   echo "Maven 3 ok."
else
   echo "One of our dependencies requires Maven 3. Please check your maven version with 'mvn -version'" 
   exit -1
fi
