#!/bin/bash
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
STOPWORDS=$(get_path $3)
WDIR="$BASE_WDIR/$2"

LANGUAGE=`echo $2 | sed "s/_.*//g"`

echo "Language:          $LANGUAGE"
echo "Working directory: $WDIR"
echo "Stopwords:         $STOPWORDS"
echo "Ignore list:       $IGNORE_LIST"
echo "Target:            $TARGET_DIR"

mkdir -p $WDIR

########################################################################################################
# Download Wikipedia dump:
########################################################################################################

echo "Loading Wikipedia dump..."
dumpDate="20181201"
dumpName="${LANGUAGE}wiki-${dumpDate}-pages-articles.xml.bz2"
# gsutil cp "gs://indexing/raw/wikipedia/$dumpName" .
wget -q "https://storage.googleapis.com/indexing/raw/wikipedia/$dumpName"
bzcat $dumpName > $WDIR/dump.xml

cd $WDIR
cp $STOPWORDS stopwords.$LANGUAGE.list

touch "$LANGUAGE.tokenizer_model"

