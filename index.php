<?php
require_once("config.php");
/*
    Ritorna solo l' immagine di tutti i profili
*/

class API {

    function Get() {
        $db = new Connect;
        $pictures = array();
        $data = $db->prepare("SELECT Id, Nome, Cognome FROM Profilo");
        $data->execute();

        while($out = $data->fetch(PDO::FETCH_ASSOC)) {
            $fullname = $out["Nome"].$out["Cognome"];
            $pic = new Pictures();
            $format = $pic->CheckFile($fullname);
            $path = $pic->GetPathFor($fullname);

            if($format != "") {
                $pictures[$out["Id"]] = array(
                    "Id" => $out["Id"],
                    "Immagine" => $path
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