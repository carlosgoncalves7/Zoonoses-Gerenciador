<?php

// require_once('./api.php');

// $sql = "SELECT nome, email FROM funcionarios";

// $stm = $conexao->prepare($sql);
// $stm->execute();
// $data = $stm->fetchAll(PDO::FETCH_ASSOC);


// echo json_encode($data);
//$db = new PDO($dados, "root", "root");
// MODO DE LIDAR COM O ERRO NO EXCEPTION DEFINI QUAL TIPO DE EXCEÇÃO VOU RECEBER
//$db->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
// CONSTANTE DEFINIDO PELA CLASS DO PDO - METODO STATICO - ARMAZENA AS INFORMAÇÕES DO SERVIDOR 
//echo $db->getAttribute(PDO::ATTR_SERVER_INFO);


echo json_encode([
    "message" => "Hello World",
    "status" => "success"
]);