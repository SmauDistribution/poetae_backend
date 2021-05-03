<?php
require_once("../config.php");
/*
    Invia l' hash per autenticare l' utente
*/

class API {
    function Get() {
        $db = new Connect;
        $res = array();
        $user = strtolower(apache_request_headers()["Username"]);
        $pass = strtolower(apache_request_headers()["Password"]);

        $hash = md5($pass);
        $data = $db->prepare("SELECT Password FROM Utente WHERE Username = :user AND Password = :pass");
        $data->execute(["user" => $user, "pass" => $hash]);

        $out = $data->fetch(PDO::FETCH_ASSOC);
        
        if($out == null) {
            http_response_code(403);
            return "";
        }

        $res["Token"] = $out["Password"];
        return json_encode($res);
    }
}

$api = new API;
header(Options::CROSS_ORIGIN);
header(Options::CROSS_HEADERS);
header('Content-Type: application/json');
echo $api->Get();

?>