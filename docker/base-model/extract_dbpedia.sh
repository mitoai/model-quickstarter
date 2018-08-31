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
WDIR="$BASE_WDIR/$2"

LANGUAGE=`echo $2 | sed "s/_.*//g"`

echo "Language:          $LANGUAGE"
echo "Working directory: $WDIR"

mkdir -p $WDIR

########################################################################################################
# DBpedia extraction:
########################################################################################################

dumpdate=$(date +%Y%m%d)
dumpdir=$WDIR/${LANGUAGE}wiki/${dumpdate}

mkdir -p $dumpdir
ln -s $WDIR/dump.xml $dumpdir/${LANGUAGE}wiki-${dumpdate}-dump.xml

cat << EOF > dbpedia.properties
base-dir=$WDIR
source=dump.xml
require-download-complete=false
languages=$LANGUAGE
ontology=../ontology.xml
mappings=../mappings
uri-policy.uri=uri:en; generic:en; xml-safe-predicates:*
format.nt.gz=n-triples;uri-policy.uri
EOF

if [[ ",ga,ar,be,bg,bn,ced,cs,cy,da,eo,et,fa,fi,gl,hi,hr,hu,id,ja,lt,lv,mk,mt,sk,sl,sr,tr,ur,vi,war,zh," == *",$LANGUAGE,"* ]]; then #Languages with no disambiguation definitions
     echo "extractors=.RedirectExtractor,.MappingExtractor" >> dbpedia.properties
else
     echo "extractors=.RedirectExtractor,.DisambiguationExtractor,.MappingExtractor" >> dbpedia.properties
fi

../run extraction dbpedia.properties

zcat $dumpdir/${LANGUAGE}wiki-${dumpdate}-instance-types*.nt.gz > $WDIR/instance_types.nt
zcat $dumpdir/${LANGUAGE}wiki-${dumpdate}-disambiguations-unredirected.nt.gz > $WDIR/disambiguations.nt
zcat $dumpdir/${LANGUAGE}wiki-${dumpdate}-redirects.nt.gz > $WDIR/redirects.nt

rm -Rf $dumpdir
