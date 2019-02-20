FROM eu.gcr.io/ntnu-smartmedia/spotlight-base

ENV MAVEN_OPTS="-Xmx26G"
ARG WIKI_LANGUAGE_NAME="Norwegian"
ARG WIKI_LANGUAGE="no"
ARG WIKI_LOCALE="no_NO"
ARG BASE_WDIR=/opt/spotlight/wdir
ARG WDIR=$BASE_WDIR/$WIKI_LOCALE
ARG TARGET_DIR="$WDIR/${WIKI_LANGUAGE}/model"
ARG WIKI_MIRROR="https://dumps.wikimedia.org"
ARG WIKI_DUMP_DATE="20190201"
ARG OPENNLP="None"

RUN mkdir -p $WDIR
WORKDIR /opt/spotlight

# Download Wikipedia dump:
RUN echo "Loading Wikipedia dump..."
ARG dump=$WIKI_MIRROR/${WIKI_LANGUAGE}wiki/${WIKI_DUMP_DATE}/${WIKI_LANGUAGE}wiki-${WIKI_DUMP_DATE}-pages-articles.xml.bz2
RUN echo Downloading $dump ....
RUN curl -# "$dump" | bzcat > $WDIR/dump.xml
RUN wget -O $WDIR/page_props.sql.gz "$WIKI_MIRROR/${WIKI_LANGUAGE}wiki/${WIKI_DUMP_DATE}/${WIKI_LANGUAGE}wiki-${WIKI_DUMP_DATE}-page_props.sql.gz"
ADD $WIKI_LANGUAGE $WDIR/$WIKI_LANGUAGE
RUN (cd $WDIR && cp $WDIR/$WIKI_LANGUAGE/stopwords.list stopwords.$WIKI_LANGUAGE.list && touch "$WIKI_LANGUAGE.tokenizer_model")

# DBpedia extraction:
WORKDIR $BASE_WDIR/extraction-framework/dump

ARG DUMP_DIR=$WDIR/${WIKI_LANGUAGE}wiki/${WIKI_DUMP_DATE}
RUN mkdir -p $DUMP_DIR
RUN ln -s $WDIR/dump.xml          $DUMP_DIR/${WIKI_LANGUAGE}wiki-${WIKI_DUMP_DATE}-dump.xml
RUN ln -s $WDIR/page_props.sql.gz $DUMP_DIR/${WIKI_LANGUAGE}wiki-${WIKI_DUMP_DATE}-page_props.sql.gz

RUN /bin/bash -c  "(cd $BASE_WDIR/extraction-framework/core && ../run generate-settings)"
RUN /bin/bash -c  "(cd $BASE_WDIR/extraction-framework/core && ../run download-mappings)"

ARG DBPEDIA_PROPS=dbpedia.properties
RUN touch $DBPEDIA_PROPS \
&& echo "base-dir=$WDIR" >> $DBPEDIA_PROPS \
&& echo "source=dump.xml" >> $DBPEDIA_PROPS \
&& echo "require-download-complete=false" >> $DBPEDIA_PROPS \
&& echo "languages=$WIKI_LANGUAGE" >> $DBPEDIA_PROPS \
&& echo "locale=$WIKI_LANGUAGE" >> $DBPEDIA_PROPS \
&& echo "wiki=$WIKI_LANGUAGE" >> $DBPEDIA_PROPS \
&& echo "ontology=../ontology.xml" >> $DBPEDIA_PROPS \
&& echo "mappings=../mappings" >> $DBPEDIA_PROPS \
&& echo "uri-policy.uri=uri:en; generic:en; xml-safe-predicates:*" >> $DBPEDIA_PROPS \
&& echo "format.nt.gz=n-triples;uri-policy.uri" >> $DBPEDIA_PROPS

RUN /bin/bash -c "if [[ ",ga,ar,be,bg,bn,ced,cs,cy,da,eo,et,fa,fi,gl,hi,hr,hu,id,ja,lt,lv,mk,mt,sk,sl,sr,tr,ur,vi,war,zh," == *",$WIKI_LANGUAGE,"* ]]; then echo "extractors=.RedirectExtractor,.MappingExtractor" >> $DBPEDIA_PROPS; else echo "extractors=.RedirectExtractor,.DisambiguationExtractor,.MappingExtractor" >> $DBPEDIA_PROPS; fi"
RUN apt update && apt install -y tree vim
RUN /bin/bash -c  "(cd $BASE_WDIR/extraction-framework/dump && ../run extraction dbpedia.properties)"

RUN tree -lf $DUMP_DIR
RUN (zcat $DUMP_DIR/${WIKI_LANGUAGE}wiki-${WIKI_DUMP_DATE}-instance-types*.nt.gz > $WDIR/instance_types.nt || true)
RUN (zcat $DUMP_DIR/${WIKI_LANGUAGE}wiki-${WIKI_DUMP_DATE}-disambiguations-unredirected.nt.gz > $WDIR/disambiguations.nt || true)
RUN (zcat $DUMP_DIR/${WIKI_LANGUAGE}wiki-${WIKI_DUMP_DATE}-redirects.nt.gz > $WDIR/redirects.nt || true)

# Extracting wiki stats:
WORKDIR $BASE_WDIR/wikistatsextractor
RUN mvn exec:java -Dexec.args="--output_folder $WDIR $WIKI_LANGUAGE $WIKI_LOCALE ${WIKI_LANGUAGE_NAME}Stemmer $WDIR/dump.xml $WDIR/stopwords.$WIKI_LANGUAGE.list"

# Building Spotlight model:
WORKDIR $BASE_WDIR/dbpedia-spotlight
RUN mvn -pl index exec:java \
  -Dexec.mainClass=org.dbpedia.spotlight.db.CreateSpotlightModel \
  -Dexec.args="$WIKI_LOCALE $WDIR $TARGET_DIR $OPENNLP $WDIR/${WIKI_LANGUAGE}/stopwords.list ${WIKI_LANGUAGE_NAME}Stemmer"

RUN curl https://raw.githubusercontent.com/dbpedia-spotlight/model-quickstarter/master/model_readme.txt > $TARGET_DIR/README.txt
RUN curl "$WIKI_MIRROR/${WIKI_LANGUAGE}wiki/${WIKI_DUMP_DATE}/${WIKI_LANGUAGE}wiki-${WIKI_DUMP_DATE}-pages-articles.xml.bz2-rss.xml" \
  | grep link \
  | sed -e 's/^.*<link>//' -e 's/<[/]link>.*$//' \
  | uniq >> $TARGET_DIR/README.txt

RUN echo "Collecting data..."
WORKDIR $BASE_WDIR
RUN ls -al
RUN ls -al $WDIR
RUN mkdir -p data/$WIKI_LANGUAGE && mv $WDIR/*Counts data/$WIKI_LANGUAGE
RUN gzip $WDIR/*.nt &
