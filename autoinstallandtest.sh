#!/usr/bin/env bash

set -e

cd $(dirname $0)

if [ !-f "composer.phar" ]; then 
curl -sS https://getcomposer.org/installer | php
 fi

#install dependencies 
php composer.phar install --dev
#install solr
export SOLR_VERSION="5.1.0"
bash ./solr5-install.sh

#create cores
export SOLR_CORENAME="cbtest_test"
export SOLR_CONFIGSET="default"
bash ./solr5-addcore.sh

#vendor/bin/phpunit vendor/reprovinci/solr-php-client/tests

vendor/bin/phpunit Test.php

#stop solr 
#bash solr5-stop.sh