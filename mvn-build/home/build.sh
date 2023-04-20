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
pushd NavCogConvEAR
mvn package
popd

