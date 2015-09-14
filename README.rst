solr5-install.sh
==============

Get a Solr instance running and use it in your tests.


Usage
-----

::

  export SOLR_VERSION="5.1.0" 
  export SOLR_PORT=8983 
  bash ./solr5-install.sh

SOLR_VERSION:
.............

You have to specify one of these versions:

- 5.1.0
- 5.2.0


SOLR_PORT:
..........

If you want your Solr instance to run on a different TCP port, define this variable;
Solr will run on the default port 8983 if left blank.




solr5-addcore.sh
==============

Create Solr cores

Usage
-----

::

  export SOLR_CORENAME="test1 test2 test3" 
  export SOLR_CONFIGSET="default"
  bash ./solr5-addcore.sh

SOLR_CORENAME:
..........

Select the core or cores separated by space

SOLR_CONFIGSET:
..........

Select the configset for cores, by default "basic"


solr5-addcore.sh
==============

Stop Solr instance

Usage
-----

::

  export SOLR_VERSION="5.1.0" 
  export SOLR_PORT=8983 
  bash ./solr5-stop.sh
