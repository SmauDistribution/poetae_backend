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
    CONST STATIC_FOLDER = 'C:/Users/smaud/Documents/Scuola/Esame/Risorse/';
}

class Pictures {
    function CheckFile($fullname) {
        $filename = $this->GetFileName($fullname);
        $format = "";
        if(file_exists(Options::STATIC_FOLDER.$filename.".jpeg"))
            $format = ".jpeg";

        if(file_exists(Options::STATIC_FOLDER.$filename.".jpg")) {
            $format = ".jpg";
        }

        if(file_exists(Options::STATIC_FOLDER.$filename.".png")) {
            $format = ".png";
        }

        return $format;
    }

    function GetFileName($fullname) {
        return "Profili/".strtolower($fullname);
    }

    function GetPathFor($fullname) {
        $filename = $this->GetFileName($fullname);
        $format = "";

        //Trova se il file esiste, in caso affermativo assegna anche il suo formato
        $format = $this->CheckFile($fullname);
        $path = Options::STATIC_FOLDER.$filename.$format;
        return $path;
    }
}

?>