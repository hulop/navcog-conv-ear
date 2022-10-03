#!/bin/bash


pwd=`pwd`
scriptdir=`dirname $0`
cd $scriptdir
scriptdir=`pwd`

if [[ $1 == 'clean' ]]; then
    rm -rf $scriptdir/home/MapService/MapService/target
    rm -rf $scriptdir/home/ConversationServiceWatson/ConversationServiceWatson/target
    rm -rf $scriptdir/home/NavCogConvEAR/target
    exit
fi

docker-compose build ear-build
docker-compose run ear-build
