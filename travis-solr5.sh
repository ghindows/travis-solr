#!/usr/bin/env bash

SOLR_VERSION=${SOLR_VERSION:-5.2.0}
SOLR="solr-$SOLR_VERSION"
SOLR_USER=$USER

wget -nv --output-document=/opt/$SOLR.tgz http://www.us.apache.org/dist/lucene/solr/$SOLR_VERSION/$SOLR.tgz
tar -C /opt --extract --file /opt/$SOLR.tgz
rm /opt/$SOLR.tgz
ln -s /opt/$SOLR /opt/solr

bash /opt/solr/bin/solr -f &