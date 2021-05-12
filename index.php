<?php
require_once("config.php");
/*
    Ritorna solo l' immagine e il nome e cognome di tutti i profili
*/

class API {

    function Get() {
        $db = new Connect;
        $pictures = array();
        $data = $db->prepare("SELECT Id, Nome, Cognome FROM Profilo");
        $data->execute();

        while($out = $data->fetch(PDO::FETCH_ASSOC)) {
            $pic = new Pictures();
            $fullname = $pic->TransformFullname($out["Nome"], $out["Cognome"]);
            $format = $pic->CheckFile($fullname);
            $path = $pic->GetPathFor($fullname);

            if($format != "") {
                $pictures[$out["Id"]] = array(
                    "Id" => $out["Id"],
                    "Nome" => $out["Nome"],
                    "Cognome" => $out["Cognome"],
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