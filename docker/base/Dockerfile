FROM maven:3.6.0-jdk-8

ENV MAVEN_OPTS="-Xmx26G"

RUN mkdir -p /opt/spotlight/wdir \
&&  cd /opt/spotlight/wdir

WORKDIR /opt/spotlight/wdir

# Install DBPedia Extraction Framework
RUN git clone git://github.com/dbpedia/extraction-framework \
 && (cd extraction-framework && mvn install)

# Install Spotlight
RUN git clone git://github.com/dbpedia-spotlight/dbpedia-spotlight-model \
 && mv dbpedia-spotlight-model dbpedia-spotlight \
 && (cd dbpedia-spotlight && mvn install)

# Install Wiki Extraction Framework
RUN git clone https://github.com/dbpedia-spotlight/wikistatsextractor \
 && (cd wikistatsextractor && mvn install)
