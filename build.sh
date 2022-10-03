#!/bin/bash


pwd=`pwd`
scriptdir=`dirname $0`
cd $scriptdir
scriptdir=`pwd`


pushd $scriptdir/mvn-build
./build-ear.sh
popd

cp ./mvn-build/home/NavCogConvEAR/target/navcog-conv.ear liberty-build/
pushd $scriptdir/liberty-build
docker-compose build
popd


