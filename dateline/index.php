<?php
require_once("../config.php");
/*
    Restituisce tutti gli anni di nascita dei profili in ordine e senza ripetizioni
*/

class API {

    function Get() {
        $db = new Connect;
        $records = array();

        $data = $db->prepare("SELECT DISTINCT YEAR(Nascita) AS 'Nascita', Id FROM Profilo ORDER BY Nascita");
        $data->execute();

        while($out = $data->fetch(PDO::FETCH_ASSOC)) {

            if($out["Nascita"] != null) {
                $records[$out["Id"]] = array(
                    "Id" => $out["Id"],
                    "Anno" => $out["Nascita"]
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