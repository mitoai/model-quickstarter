#!/usr/bin/env sh

java -Dfile.encoding=UTF-8 -Xmx${JAVA_XMX} -jar ./${RELEASE_FILENAME} ./${LANGUAGE}  http://0.0.0.0:80/rest
