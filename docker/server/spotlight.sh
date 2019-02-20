#!/usr/bin/env bash
java -Dfile.encoding=UTF-8 -Xmx$MEMORY -jar ./dbpedia-spotlight-1.0.0.jar ./wdir/$WIKI_LOCALE/$WIKI_LANGUAGE/model  http://0.0.0.0:80/rest
