<?php
$config = parse_ini_file('config.ini', true);
$server = $config['servers'][array_rand($config['servers'])];
$memcache = new Memcache;
list($host, $port) = explode(':', $server);
$memcache->connect($host, $port) or die ("Could not connect");

$version = $memcache->getVersion();
echo "Server's version: ".$version."<br/>\n";

if(!($data = $memcache->get('key')))
{
    $data = new stdClass;
    $data->str_attr = 'test';
    $data->int_attr = 123;

    $memcache->set('key', $data, false, 10) or die ("Failed to save data at the server");
    echo "Store data in the cache (data will expire in 10 seconds)<br/>\n";
}  else
{
     echo "Data from the cache:<br/>\n";
}

var_dump($data);
?>