#!/bin/bash

if [ ! -e swagger-codegen-cli.jar ]
then
  echo "Downloading codegen ..."
  wget http://central.maven.org/maven2/io/swagger/swagger-codegen-cli/2.3.1/swagger-codegen-cli-2.3.1.jar -O swagger-codegen-cli.jar
fi

if [ -e java ]
then
  echo "Removing past client generated ..."
  rm -fr java
fi


echo "Generating Java client ..."
mkdir java
java -jar swagger-codegen-cli.jar generate -i http://localhost:8080/geonetwork/srv/v2/api-docs -l java -c apiconfig.json -o java


echo "Building client ..."
cd java
mvn clean install

echo "Done."
