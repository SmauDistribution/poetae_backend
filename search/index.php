<?php
require_once("../config.php");
/*
    Cerca i profili per nome o cognome
*/

class API {

    function Get() {
        $db = new Connect;
        $records = array();
        $content = strtolower(apache_request_headers()["Content"]);

        $data = $db->prepare("SELECT Id, Nome, Cognome FROM Profilo");
        $data->execute();

        while($out = $data->fetch(PDO::FETCH_ASSOC)) {

            $name = strtolower($out["Nome"]);
            $surname = strtolower($out["Cognome"]);
            $picture = new Pictures();
            $path = $picture->GetPathFor($out["Nome"].$out["Cognome"]);

            if(strpos($name, $content) === 0 || strpos($surname, $content) === 0) {
                $records[$out["Id"]] = array(
                    "Id" => $out["Id"],
                    "Nome" => $out["Nome"],
                    "Cognome" => $out["Cognome"],
                    "Immagine" => $path
                );
            }
        }

        return json_encode($records);
    }
}

$api = new API;
header(Options::CROSS_ORIGIN);
header('Content-Type: application/json');
echo $api->Get();

?>