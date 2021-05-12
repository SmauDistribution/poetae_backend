<?php
require_once("../../config.php");
/*
    Restituisce tutti gli anni di nascita dei profili in ordine e senza ripetizioni
*/

class API {

    function Get() {
        $db = new Connect;
        $records = array();
        $year = apache_request_headers()["year"];

        $data = $db->prepare("SELECT * FROM Profilo WHERE YEAR(Nascita) = :year");
        $data->execute(["year" => $year]);

        while($out = $data->fetch(PDO::FETCH_ASSOC)) {

            $picture = new Pictures();
            $fullname = $picture->TransformFullname($out["Nome"], $out["Cognome"]);
            $path = $picture->GetPathFor($fullname);

            $records[$out["Id"]] = array(
                "Id" => $out["Id"],
                "Nome" => $out["Nome"],
                "Cognome" => $out["Cognome"],
                "Biografia" => $out["Biografia"],
                "Nascita" => $out["Nascita"],
                "Morte" => $out["Morte"],
                "LuogoNascita" => $out["LuogoNascita"],
                "Immagine" => $path
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