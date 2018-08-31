#!/usr/bin/env sh

java -Dfile.encoding=UTF-8 -Xmx4g -jar ./dbpedia-spotlight-1.0.0.jar ./wdir/no_NO/no/model  http://0.0.0.0:80/rest
