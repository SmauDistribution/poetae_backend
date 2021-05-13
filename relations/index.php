<?php
require_once("../config.php");
/*
    Restituisce tutti i profili e per ogni profili i sottoprofili che hanno una relazione con il profilo in questione
*/

class API {

    private function GetSubprofilesFor($id, $db) {
        $relations = array();

        //Fai la join dei profili2 di tutti i profili1
        $relation = "SELECT Profilo.* FROM Profilo, Relazione WHERE Profilo1 = :id  AND (Profilo2 = Profilo.Id)";
        
        //Fai la join dei profili1 di tutti i profili2
        $inverse_relation = "SELECT Profilo.* FROM Profilo, Relazione WHERE Profilo2 = :inverse_id AND (Profilo1 = Profilo.Id)";
        $query = $relation." UNION ".$inverse_relation; //Unisci query

        $data = $db->prepare($query);
        $data->execute(["id" => $id, "inverse_id" => $id]);
        while($profile = $data->fetch(PDO::FETCH_ASSOC)) {

            $picture = new Pictures();
            $fullname = $picture->TransformFullname($profile["Nome"], $profile["Cognome"]);
            $path = $picture->GetPathFor($fullname);

            $relations[$profile["Id"]] = array(
                "Id" => $profile["Id"],
                "Nome" => $profile["Nome"],
                "Cognome" => $profile["Cognome"],
                "Immagine" => $path
            );
        }

        return $relations;
    }

    function Get() {
        $db = new Connect;
        $records = array();

        $profiles = $db->prepare("SELECT * FROM Profilo");
        $profiles->execute();

        while($out = $profiles->fetch(PDO::FETCH_ASSOC)) {

            $picture = new Pictures();
            $fullname = $picture->TransformFullname($out["Nome"], $out["Cognome"]);
            $path = $picture->GetPathFor($fullname);

            $relations = $this->GetSubprofilesFor($out["Id"], $db);

            $records[$out["Id"]] = array(
                "Id" => $out["Id"],
                "Nome" => $out["Nome"],
                "Cognome" => $out["Cognome"],
                "Immagine" => $path,
                "Relazioni" => $relations
            );
        }

        return json_encode($records);
    }
}

$api = new API;
header(Options::CROSS_ORIGIN);
header('Content-Type: application/json');
echo $api->Get();

?>