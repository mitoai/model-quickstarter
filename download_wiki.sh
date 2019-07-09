#!/usr/bin/env bash
WIKI_LANGUAGE=$1
WIKI_DUMP_DATE=$2

dump=${WIKI_LANGUAGE}wiki-${WIKI_DUMP_DATE}-pages-articles.xml

if [ -f ${dump} ]; then
  echo "${dump} already present. Skipping ..."
else
  echo "Loading Wikipedia dump ${dump} ..."

  #curl -# "https://dumps.wikimedia.org/${WIKI_LANGUAGE}wiki/${WIKI_DUMP_DATE}/${dump}.bz2" | bzcat > ${dump}
  gsutil cp "gs://indexing/raw/wikipedia/${dump}.bz2" "${dump}.bz2" && bzcat ${dump}.bz2 > ${dump} && rm ${dump}.bz2
fi
