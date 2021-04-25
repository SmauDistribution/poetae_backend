<?php

class Connect extends PDO
{
    public function __construct() {
        parent::__construct("mysql:host=localhost;dbname=poetaedb", "root", "root1234");
        array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8");
        $this->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); //Nel caso di errori, usa le eccezioni 
        $this->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
    }
}

class Options {
    CONST CROSS_ORIGIN = 'Access-Control-Allow-Origin: *';
    CONST STATIC_FOLDER = '../../Risorse/';
}

?>