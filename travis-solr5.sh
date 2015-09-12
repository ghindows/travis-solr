#!/usr/bin/env bash

SOLR_VERSION=${SOLR_VERSION:-5.2.0}
SOLR="solr-$SOLR_VERSION"
SOLR_USER=$USER
SOLR_SOURCE="http://www.us.apache.org/dist/lucene/solr/${SOLR_VERSION}/${SOLR}.tgz"

echo "Download ${SOLR} from "
wget -nv --output-document=`pwd`/$SOLR.tgz $SOLR_SOURCE
echo "Extracting Solr ${SOLR_VERSION} to `pwd`/${SOLR}/"
tar -xf $SOLR.tgz
echo "Changing into `pwd`/${SOLR}/" 
cd $SOLR
export CMD="bin/solr start -p 8983 -f"
echo 'Starting server on port 8983'
exec $CMD