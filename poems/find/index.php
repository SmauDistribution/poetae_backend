<?php
require_once("../../config.php");
/*
    Ritorna tutti i poemi che hanno il contenuto, il titolo o la descrizione simile all Content
*/

class API {

    private function Match($out, $content) {
        $titolo = strtolower($out["Titolo"]);
        $descr = strtolower($out["Descrizione"]);
        $poem = strtolower($out["Contenuto"]);

        return strpos($titolo, $content) !== false || strpos($descr, $content) !== false || strpos($poem, $content) !== false;
    }

    function Get() {
        $db = new Connect;
        $records = array();
        $content = strtolower(apache_request_headers()["Content"]);

        $data = $db->prepare("SELECT * FROM Poesia");
        $data->execute();

        while($out = $data->fetch(PDO::FETCH_ASSOC)) {
                        
            if($this->Match($out, $content)) {
                $records[$out["Id"]] = array(
                    "Id" => $out["Id"],
                    "Titolo" => $out["Titolo"],
                    "Descrizione" => $out["Descrizione"]
                );
            }
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