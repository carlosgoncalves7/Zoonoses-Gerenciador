<?php


// 1. Configuração de CORS (Obrigatório para o fetch funcionar do seu frontend)
// Permite qualquer origem (em produção, substitua pelo seu domínio)
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");

require_once("./config.database.php");
require_once("./class/DB.php");

$input = file_get_contents('php://input');
$cadastro = json_decode($input, true);

$DSN = $DB_HOST . $DB_PORT . $DB_NAME;
$db = new DB($DSN, $DB_USER, $DB_PASS);

$cmd = $db->getPDO();

$cmd->beginTransaction();


// "name": "cacas",
//   "cpf": "csacasc",
//   "rg": "cascs",
//   "email": "csca",
//   "telefone": "cscasc",
//   "endereco": "csca",
//   "animal": {
//     "animalName": "scacsac",
//     "especie": "",
//     "raca": "csaca",
//     "cor": "cscasc",
//     "idade": "sacsacs",
//     "sexo": ""
//   }




echo json_encode([
    "message" => "Deu certo"
]);