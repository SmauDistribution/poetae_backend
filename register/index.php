<?php
require_once("../config.php");
/*
    Registra l' utente
*/

class API {

    function Post() {
        $db = new Connect;
        $pictures = array();
        $user = apache_request_headers()["Username"];
        $pass = apache_request_headers()["Password"];

        $hash = md5($pass);
        $data = $db->prepare("INSERT INTO Utente (Username, Password) VALUES (:user, :hash)");
        $data->execute(["user" => $user, "hash" => $hash]);
    }
}

$api = new API;
header(Options::CROSS_ORIGIN);
header(Options::CROSS_HEADERS);
header('Content-Type: application/json');

if($_SERVER["REQUEST_METHOD"] === "POST")
    echo $api->Post();
else if($_SERVER["REQUEST_METHOD"] !== "OPTIONS")
    http_response_code(405);

?>