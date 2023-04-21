#!/bin/bash


pwd=`pwd`
scriptdir=`dirname $0`
cd $scriptdir
scriptdir=`pwd`

skip_mvn_build=0
with_query=0

function help() {
    echo "Usage:"
    echo " this script build EAR and liberty container"
    echo ""
    echo "-h          show this help"
    echo "-s          skip maven build"
    echo "-q          build EAR with QueryService (in adittion to MapService and ConversationServiceWatson)"
}

while getopts "sq" arg; do
    case $arg in
	s)
	    skip_mvn_build=1
	    ;;
	q)
	    with_query=1
	    ;;
	h)
	    help
	    ;;
    esac
done

if [[ $skip_mvn_build -eq 0 ]]; then
    pushd $scriptdir/mvn-build
    ./build-ear.sh
    popd
fi

if [[ $with_query -eq 0 ]]; then
    cp ./mvn-build/home/NavCogConvEAR/target/navcog-conv.ear liberty-build/
else
    cp ./mvn-build/home/NavCogConvQueryEAR/target/navcog-conv.ear liberty-build/
fi

pushd $scriptdir/liberty-build
docker-compose build
popd


