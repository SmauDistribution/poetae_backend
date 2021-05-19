<?php
require_once("../../config.php");
/*
    Ritorna tutti i poemi
*/

class API {
    function Get() {
        $db = new Connect;
        $records = array();
        
        $records = array();
        $data = $db->prepare("SELECT * FROM Poesia");
        $data->execute();

        while($out = $data->fetch(PDO::FETCH_ASSOC)) {
            $records[$out["Id"]] = array(
                "Id" => $out["Id"],
                "Titolo" => $out["Titolo"],
                "Descrizione" => $out["Descrizione"],
            );
        }

        return json_encode($records);
    }
}

$api = new API;
header(Options::CROSS_ORIGIN);
header(Options::CROSS_HEADERS);
header('Content-Type: application/json');
echo $api->Get();

?>