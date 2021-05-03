<?php
require_once("../config.php");
/*
    Ritorna il titolo e l' id delle poesie salvate
*/

class API {

    function Get() {
        $db = new Connect;
        $token = apache_request_headers()["Token"];
        $res = array();

        $user = new User();
        $id = $user->GetUser($token)["Id"];
        
        $data = $db->prepare("SELECT Poesia.Id, Titolo FROM Segnalibri, Utente, Poesia WHERE Utente = :id AND Utente.Id = :userId AND Poesia.Id = Segnalibri.Poesia");
        $data->execute(["id" => $id, "userId" => $id]);

        while($out = $data->fetch(PDO::FETCH_ASSOC)) {
            $res[$out["Id"]] = array(
                "Id" => $out["Id"],
                "Titolo" => $out["Titolo"]
            );
        }

        return json_encode($res);
    }
}

$api = new API;
header(Options::CROSS_ORIGIN);
header(Options::CROSS_HEADERS);
header('Content-Type: application/json');
echo $api->Get();

?>