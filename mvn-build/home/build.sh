#!/bin/bash


pushd MapService
sh download-lib.sh
popd
pushd MapService/MapService
mvn package
mvn install
popd


pushd ConversationServiceWatson/ConversationServiceWatson
mvn package
mvn install
popd


pushd QueryService
sh download-lib.sh
popd
pushd QueryService/QueryService
mvn package
mvn install
popd


pushd NavCogConvEAR
mvn package
popd
pushd NavCogConvQueryEAR
mvn package
popd

