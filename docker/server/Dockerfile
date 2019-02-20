ARG WIKI_LANGUAGE

FROM eu.gcr.io/ntnu-smartmedia/spotlight-base-model-$WIKI_LANGUAGE:latest

EXPOSE 80

ENV RELEASE_FILENAME="dbpedia-spotlight-1.0.0.jar"

ENV WIKI_LANGUAGE=$WIKI_LANGUAGE
ENV WIKI_LANGUAGE_NAME=
ENV WIKI_LOCALE=
ENV MEMORY=

RUN mkdir -p /opt/spotlight \
&&  cd /opt/spotlight \
&&  curl -O "https://netix.dl.sourceforge.net/project/dbpedia-spotlight/spotlight/$RELEASE_FILENAME"

WORKDIR /opt/spotlight

ADD . .

RUN chmod +x spotlight.sh

ENTRYPOINT ["./spotlight.sh"]
