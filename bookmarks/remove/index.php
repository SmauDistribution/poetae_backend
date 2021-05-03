<?php
require_once("../../config.php");
/*
    Rimuove un segnalibro
*/

class API {
    private function AlreadyExists($db, $id, $poem) {
        $data = $db->prepare("SELECT Id FROM Segnalibri WHERE Poesia = :poem AND Utente = :id");
        $data->execute(["id" => $id, "poem" => $poem]);
        $res = $data->fetchAll(PDO::FETCH_ASSOC);

        return count($res) > 0;
    }

    function Get() {
        $db = new Connect;
        $token = apache_request_headers()["Token"];
        $poem = apache_request_headers()["Poem"];
        $user = new User();
        $user_id = $user->GetUser($token)["Id"];

        $data = $db->prepare("DELETE FROM Segnalibri WHERE Utente = :user AND Poesia = :poem");
        $data->execute(["user" => $user_id, "poem" => $poem]);

        return "";
    }
}

$api = new API;
header(Options::CROSS_ORIGIN);
header(Options::CROSS_HEADERS);
header('Content-Type: application/json');
echo $api->Get();

?>