<?php
require_once("../config.php");
/*
    Ritorna il  profilo specificato dall' id
*/

class API {
    /// <SUMMARY>
    /// Ottengo i percorsi di un profilo
    /// </SUMMARY>
    private function GetPaths($db, $id) {
        $percorsi = array();
        $data = $db->prepare("SELECT Percorso.Id, Descrizione FROM Percorsi, Percorso WHERE Percorsi.Profilo = :id AND Percorsi.Percorso = Percorso.Id");
        $data->execute(["id" => $id]);

        while($out = $data->fetch(PDO::FETCH_ASSOC)) {
            $percorsi[$out["Id"]] = array(
                "Id" => $out["Id"],
                "Descrizione" => $out["Descrizione"]
            );
        }

        return $percorsi;
    }

    function Get() {
        $db = new Connect;
        $records = array();
        $id = apache_request_headers()["id"];

        $data = $db->prepare("SELECT * FROM Profilo WHERE Id = :id");
        $data->execute(["id" => $id]);

        while($out = $data->fetch(PDO::FETCH_ASSOC)) {

            $picture = new Pictures();
            $fullname = $picture->TransformFullname($out["Nome"], $out["Cognome"]);
            $path = $picture->GetPathFor($fullname);
            $percorsi = $this->GetPaths($db, $id);

            $records[$out["Id"]] = array(
                "Id" => $out["Id"],
                "Nome" => $out["Nome"],
                "Cognome" => $out["Cognome"],
                "Biografia" => $out["Biografia"],
                "Nascita" => $out["Nascita"],
                "Morte" => $out["Morte"],
                "LuogoNascita" => $out["LuogoNascita"],
                "Immagine" => $path,
                "Percorsi" => $percorsi
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