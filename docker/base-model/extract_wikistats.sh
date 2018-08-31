#!/bin/bash
blacklist="false"

while getopts "eo:b:" opt; do
  case $opt in
    b) blacklist="$OPTARG";;
  esac
done


shift $((OPTIND - 1))

if [ $# != 5 ]
then
    usage
    exit
fi

BASE_DIR=$(pwd)

function get_path {
  if [[ "$1"  = /* ]]
  then
    echo "$1"
  else
   echo "$BASE_DIR/$1"
  fi
}

BASE_WDIR=$(get_path $1)
WDIR="$BASE_WDIR/$2"

if [[ "$blacklist" != "false" ]]; then
  blacklist=$(get_path $blacklist)
fi

LANGUAGE=`echo $2 | sed "s/_.*//g"`

echo "Language:          $LANGUAGE"
echo "Working directory: $WDIR"

mkdir -p $WDIR

########################################################################################################
# Extracting wiki stats:
########################################################################################################

cd $BASE_WDIR/wikistatsextractor
# Stop processing if one step fails
set -e
mvn exec:java -Dexec.args="--output_folder $WDIR $LANGUAGE $2 $4Stemmer $WDIR/dump.xml $WDIR/stopwords.$LANGUAGE.list"


