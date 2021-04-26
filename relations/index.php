<?php
require_once("../config.php");
/*
    Restituisce tutti i profili e per ogni profili i sottoprofili che hanno una relazione con il profilo in questione
*/

class API {

    private function GetSubprofilesFor($id, $db) {
        $relations = array();
        $data = $db->prepare("SELECT * FROM Profilo, Relazione WHERE  Profilo1 = :id AND Profilo2 = Profilo.Id");
        $data->execute(["id" => $id]);
        while($profile = $data->fetch(PDO::FETCH_ASSOC)) {
            $relations[$profile["Id"]] = array(
                "Id" => $profile["Id"],
                "Nome" => $profile["Nome"],
                "Cognome" => $profile["Cognome"]
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

            $name = strtolower($out["Nome"]);
            $surname = strtolower($out["Cognome"]);
            $picture = new Pictures();
            $path = $picture->GetPathFor($out["Nome"].$out["Cognome"]);

            $relations = $this->GetSubprofilesFor($out["Id"], $db);

            $records[$out["Id"]] = array(
                "Id" => $out["Id"],
                "Nome" => $out["Nome"],
                "Cognome" => $out["Cognome"],
                "Biografia" => $out["Biografia"],
                "Nascita" => $out["Nascita"],
                "Morte" => $out["Morte"],
                "LuogoNascita" => $out["LuogoNascita"],
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