<?php

if (!@include __DIR__ . '/vendor/autoload.php') {
    die('You must set up the project dependencies, run the following commands:
        wget http://getcomposer.org/composer.phar
        php composer.phar install');
}

require_once 'vendor/reprovinci/solr-php-client/Apache/Solr/Service.php';

class Test extends PHPUnit_Framework_TestCase
{
    private $solr;
    private $config = [
        'solr_host' => 'localhost',
        'solr_port' => 8983,
        'solr_core' => 'cbtest_test'
    ];

    public function setUp()
    {
        $this->solr = $solr = new \Apache_Solr_Service($this->config['solr_host'], $this->config['solr_port'], "/solr/".$this->config['solr_core']."/");

    }

    public function testConnection()
    {
        $this->assertTrue(is_numeric($this->solr->ping()));
    }


    public function testAddDocument() {
        $doc = new Apache_Solr_Document();
        $doc->id = 1;
        $doc->name="test";
        $doc->dstatus = 0;
        $response = $this->solr->addDocument($doc);

        $this->assertTrue($response->getHttpStatus() == '200', "ERROR:".var_dump($response));
    }

    public function testQuery() {
        $this->assertTrue(true);
    }
    
}

?>
