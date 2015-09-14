#!/usr/bin/env bash

set -e

cd $(dirname $0)

export SOLR_VERSION=${SOLR_VERSION:-5.1.0}
export SOLR_NAME="solr-$SOLR_VERSION"
export SOLR_DIR="`pwd`/${SOLR_NAME}"
export SOLR_USER=$USER
export SOLR_PORT=${SOLR_PORT:-8983}

export SOLR_CONFIGSET=${SOLR_CONFIGSET:-default}

echo "Waiting solr to launch on ${SOLR_PORT}..."

while ! nc -z localhost $SOLR_PORT; do   
  sleep 0.1 # wait for 1/10 of the second before check again
done


if [ -n "$SOLR_CORENAME" ]; then
  echo "Add solr cores"
for CORENAME in $SOLR_CORENAME
do
   export CMD="${SOLR_DIR}/bin/solr create_core -c ${CORENAME} -n ${SOLR_CONFIGSET}"
     echo "Configuring Core named ${CORENAME}"
    exec $CMD
done
fi