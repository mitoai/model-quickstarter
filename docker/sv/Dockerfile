FROM java:openjdk-8-jre

ENV RELEASE_SERVER    downloads.dbpedia-spotlight.org
ENV RELEASE_FILENAME  dbpedia-spotlight-1.0.0.jar

RUN mkdir -p /opt/spotlight && \
    cd /opt/spotlight && \
    curl -O "http://$RELEASE_SERVER/spotlight/$RELEASE_FILENAME"

RUN touch spotlight.sh && \
    chmod +x spotlight.sh && \
    echo "java -Dfile.encoding=UTF-8 -Xmx8G -jar /opt/spotlight/dbpedia-spotlight-1.0.0.jar /opt/spotlight  http://0.0.0.0:80/rest" >> spotlight.sh

ADD model /opt/spotlight/

EXPOSE 80

ENTRYPOINT ./spotlight.sh


