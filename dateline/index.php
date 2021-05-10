<?php
require_once("../config.php");
/*
    Restituisce tutti gli anni di nascita dei profili in ordine e senza ripetizioni
*/

class API {

    private function GetProfilesBy($year, $db) {
        $records = array();

        $data = $db->prepare("SELECT * FROM Profilo WHERE YEAR(Nascita) = :year");
        $data->execute(["year" => $year]);

        while($out = $data->fetch(PDO::FETCH_ASSOC)) {

            $name = strtolower($out["Nome"]);
            $surname = strtolower($out["Cognome"]);
            $picture = new Pictures();
            $path = $picture->GetPathFor($out["Nome"].$out["Cognome"]);

            $records[$out["Id"]] = array(
                "Id" => $out["Id"],
                "Immagine" => $path
            );
        }

        return $records;
    }

    function Get() {
        $db = new Connect;
        $records = array();

        $data = $db->prepare("SELECT DISTINCT YEAR(Nascita) AS 'Nascita', Id FROM Profilo ORDER BY Nascita");
        $data->execute();

        while($out = $data->fetch(PDO::FETCH_ASSOC)) {

            $profiles = $this->GetProfilesBy($out["Nascita"], $db);

            if($out["Nascita"] != null) {
                $records[$out["Id"]] = array(
                    "Id" => $out["Id"],
                    "Anno" => $out["Nascita"],
                    "Profiles" => $profiles,
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