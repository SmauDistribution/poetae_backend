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
    CONST CROSS_HEADERS = 'Access-Control-Allow-Headers: *';
    CONST STATIC_PATH = 'C:/Users/smaud/Documents/Scuola/Esame/';
    CONST STATIC_FOLDER = 'Risorse/';
    CONST HOSTNAME = 'http://localhost/';
}

class Pictures {
    function CheckFile($fullname) {
        $filename = $this->GetFileName($fullname);
        $format = "";
        $path = Options::STATIC_PATH.Options::STATIC_FOLDER;

        if(file_exists($path.$filename.".jpeg"))
            $format = ".jpeg";

        if(file_exists($path.$filename.".jpg")) {
            $format = ".jpg";
        }

        if(file_exists($path.$filename.".png")) {
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
        $path = Options::HOSTNAME.Options::STATIC_FOLDER.$filename.$format;
        return $path;
    }
}

class User {
    private ?Connect $db;

    public function __construct() {
        $this->db = new Connect;
    }

    function Auth($user, $pass) {
        $hash = md5($pass);
        $data = $this->db->prepare("SELECT Password FROM Utente WHERE Username = :user AND Password = :pass");
        $data->execute(["user" => $user, "pass" => $hash]);

        $out = $data->fetch(PDO::FETCH_ASSOC);
        if($out == null)
            return false;

        return true;
    }

    function GetUser($token) {
        $user = explode(".", $token)[0];
        $pass = explode(".", $token)[1];
        $res = array();
        $data = $this->db->prepare("SELECT * FROM Utente WHERE Password = :pass");
        $data->execute(["pass" => $pass]);

        while($out = $data->fetch(PDO::FETCH_ASSOC)) {
            if(md5($out["Username"]) == $user && $out["Password"] == $pass) {
                $res = array(
                    "Id" => $out["Id"],
                    "Username" => $out["Username"]
                );
                break;
            }
        }

        return $res;
    }

    function AuthBy($token) {
        $user = explode(".", $token)[0];
        $pass = explode(".", $token)[1];
        $data = $this->db->prepare("SELECT Username, Password FROM Utente WHERE Password = :pass");
        $data->execute(["pass" => $pass]);

        while($out = $data->fetch(PDO::FETCH_ASSOC)) {
            if(md5($out["Username"]) == $user && $out["Password"] == $pass)
                return true;
        }

        return false;
    }

    function GetToken($user, $pass) {
        $hash = md5($pass);
        $userhash = md5($user);
        return $userhash.".".$hash;
    }
}

?>