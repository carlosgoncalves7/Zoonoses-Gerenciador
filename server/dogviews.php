<?php

require_once("./headers.php");
require_once("./config.database.php");
require_once("./class/DB.php");

// $input = file_get_contents('php://input');
// $usuario = json_decode($input, true);
$DSN = $DB_HOST . $DB_PORT . $DB_NAME;
$db = new DB($DSN, $DB_USER, $DB_PASS);

$cmd = $db->getPDO();

$sql = "SELECT count(*) as total FROM animais where especie = 'Cachorro'";

$stm = $cmd->prepare($sql);
$stm->execute();

$response = $stm->fetchAll(PDO::FETCH_ASSOC);

// empty - verifica se esta variavel esta vazia ou não
// verdadeiro - se estiver vazia 
// falso - se estiver preenchida
if (!empty($response)) {
    echo json_encode($response);
} else {
    echo json_encode([
        "message" => "Não foi encontrado resultados"
    ]);
}