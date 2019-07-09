#!/usr/bin/env bash
echo "Downloading dumps for ${1} ..."
./download_wiki.sh no ${1}
./download_wiki.sh sv ${1}
./download_wiki.sh en ${1}
./download_wiki.sh da ${1}
./download_wiki.sh de ${1}
./download_wiki.sh es ${1}
./download_wiki.sh fr ${1}
