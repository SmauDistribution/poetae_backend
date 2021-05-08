<?php
require_once("../config.php");
/*
    Invia l' hash per autenticare l' utente
*/

class API {
    function Get() {
        $res = array();
        $username = apache_request_headers()["Username"];
        $password = apache_request_headers()["Password"];
        
        $user = new User();
        if($user->Auth($username, $password) == false) {
            http_response_code(403);
            return "";
        }

        $res["Token"] = $user->GetToken($username, $password);
        return json_encode($res);
    }
}

$api = new API;
header(Options::CROSS_ORIGIN);
header(Options::CROSS_HEADERS);
header('Content-Type: application/json');
if($_SERVER["REQUEST_METHOD"] === "GET")
    echo $api->Get();

?>