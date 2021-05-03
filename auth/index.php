<?php
require_once("../config.php");
/*
    Controlla se l' utente è autorizzato
*/

class API {
    function Get() {
        $token = apache_request_headers()["Token"];
        
        $user = new User();
        if($user->AuthBy($token) == false) {
            http_response_code(403);
            return "";
        }

        $res = $user->GetUser($token);
        return json_encode($res);
    }
}

$api = new API;
header(Options::CROSS_ORIGIN);
header(Options::CROSS_HEADERS);
header('Content-Type: application/json');
echo $api->Get();

?>