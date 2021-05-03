<?php
require_once("../../config.php");
/*
    Assegna un segnalibro ad una poesia
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

        if($this->AlreadyExists($db, $user_id, $poem) == false) {

            $data = $db->prepare("INSERT INTO Segnalibri (Utente, Poesia) VALUES (:user, :poem)");
            $data->execute(["user" => $user_id, "poem" => $poem]);
        }

        return "";
    }
}

$api = new API;
header(Options::CROSS_ORIGIN);
header(Options::CROSS_HEADERS);
header('Content-Type: application/json');
echo $api->Get();

?>