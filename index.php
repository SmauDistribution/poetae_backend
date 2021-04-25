<?php
require_once("config.php");
/*
    Ritorna solo l' immagine di tutti i profili
*/

class API {

    private function CheckFile($filename) {
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

    function Get() {
        $db = new Connect;
        $pictures = array();
        $data = $db->prepare("SELECT Id, Nome, Cognome FROM Profilo");
        $data->execute();

        while($out = $data->fetch(PDO::FETCH_ASSOC)) {
            $fullname = $out["Nome"].$out["Cognome"];
            $filename = "Profili/".strtolower($fullname);
            $format = "";

            //Trova se il file esiste, in caso affermativo assegna anche il suo formato
            $format = $this->CheckFile($filename);
            $path = Options::STATIC_FOLDER.$filename.$format;

            if($format != "") {
                $pictures[$out["Id"]] = array(
                    "Id" => $out["Id"],
                    "Picture" => $path
                );
            }
        }

        return json_encode($pictures);
    }
}

$api = new API;
header(Options::CROSS_ORIGIN);
header('Content-Type: application/json');
echo $api->Get();

?>