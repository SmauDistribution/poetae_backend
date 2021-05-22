<?php
require_once("../config.php");
/*
    Ritorna tutti i poemi di uno specifico poeta se è stato specificato
    Ritorna invece un poema specifico se è stato specificato l'Id
*/

class API {

    private function GetPoems($author, $db) {
        $records = array();
        $data = $db->prepare("SELECT * FROM Poesia WHERE Autore = :author_id");
        $data->execute(["author_id" => $author]);

        while($out = $data->fetch(PDO::FETCH_ASSOC)) {
            $records[$out["Id"]] = array(
                "Id" => $out["Id"],
                "Titolo" => $out["Titolo"],
                "Descrizione" => $out["Descrizione"],
                "Contenuto" => $out["Contenuto"],
            );
        }

        return $records;
    }

    /// <SUMMARY>
    /// Ottengo la poesia specificata dall' id
    /// </SUMMARY>
    private function GetPoemsBy($id, $db) {
        $records = array();
        $data = $db->prepare("SELECT Poesia.*, Profilo.Nome, Profilo.Cognome FROM Poesia, Profilo WHERE Poesia.Id = :id AND Poesia.Autore = Profilo.Id");
        $data->execute(["id" => $id]);

        while($out = $data->fetch(PDO::FETCH_ASSOC)) {

            $picture = new Pictures();
            $fullname = $picture->TransformFullname($out["Nome"], $out["Cognome"]);
            $path = $picture->GetPathFor($fullname);

            $records[$out["Id"]] = array(
                "Id" => $out["Id"],
                "Titolo" => $out["Titolo"],
                "Descrizione" => $out["Descrizione"],
                "Nome" => $out["Nome"],
                "Cognome" => $out["Cognome"],
                "Immagine" => $path,
                "Contenuto" => $out["Contenuto"]
            );
        }

        return $records;
    }

    function Get() {
        $db = new Connect;
        $records = array();
        
        //
        if(isset(apache_request_headers()["Profile"])) {
            $author = apache_request_headers()["Profile"];
            $records = $this->GetPoems($author, $db);
        }
        else {
            $id = apache_request_headers()["id"];
            $records = $this->GetPoemsBy($id, $db);
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