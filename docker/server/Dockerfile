FROM eu.gcr.io/ntnu-smartmedia/spotlight-base-model-no:latest

EXPOSE 80

ENV RELEASE_FILENAME="dbpedia-spotlight-1.0.0.jar"

RUN mkdir -p /opt/spotlight \
&&  cd /opt/spotlight \
&&  curl -O "https://netix.dl.sourceforge.net/project/dbpedia-spotlight/spotlight/$RELEASE_FILENAME"

WORKDIR /opt/spotlight

ADD . .
RUN chmod +x spotlight.sh

ENTRYPOINT ["./spotlight.sh"]


