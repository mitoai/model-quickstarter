FROM java:openjdk-8-jre

EXPOSE 80

ARG RELEASE_SERVER="downloads.dbpedia-spotlight.org"
ARG RELEASE_FILENAME="dbpedia-spotlight-1.0.0.jar"
ENV JAVA_XMX="8GB"
ENV LANGUAGE='en'

RUN mkdir -p /opt/spotlight \
&&  cd /opt/spotlight \
&&  curl -O "http://$RELEASE_SERVER/spotlight/$RELEASE_FILENAME"

WORKDIR /opt/spotlight

ADD . .

ENTRYPOINT ["./spotlight.sh"]


