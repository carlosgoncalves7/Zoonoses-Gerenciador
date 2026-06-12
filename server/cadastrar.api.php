<?php

$simulacao = true;
// 1. Configuração de CORS (Obrigatório para o fetch funcionar do seu frontend)
// Permite qualquer origem (em produção, substitua pelo seu domínio)
require_once("./headers.php");
require_once("./config.database.php");
require_once("./class/DB.php");
$DSN = $DB_HOST . $DB_PORT . $DB_NAME;
$db = new DB($DSN, $DB_USER, $DB_PASS);

$cmd = $db->getPDO();
$cmd->beginTransaction();

$input = file_get_contents('php://input');
$cadastro = json_decode($input, true);

// JSON_UNESCAPED_UNICODE : INPEDE QUE O JSON ENCODE TRANSFORMAR LETRAS COM ACENTO EM CARACTER UNICODE(ex: \u00e7), ao encodar mantem as palavra visualmente legiveis
// JSON_PRETTY_PRINT - mantem a estrutura do encode json formatada pra ser visualmente legivel pra ser ler um objeto json

//file_put_contents("dados.json", json_encode($cadastro, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT), FILE_APPEND);
// json.encode() --  transforma array associativo em objeto json
// ex: $age = array("Peter"=>35, "Ben"=>37, "Joe"=>43);
// echo json_encode($age);
// saida: {"Peter":35,"Ben":37,"Joe":43}
// -------------------------------------
// json.decode(value) -- converte um objeto json em um objeto de php
// json.decode(value,true) -- com o argumento true converte um objeto json em um array associativo de php

$pessoa = json_decode(file_get_contents("dados.json"), true);

$pessoa["cpf"];

// if(!$cadastro){
//     echo "nao existe dado";
//     exit;
// } else {
//     echo "existe dado sim";
//     exit;
// }

// "name": "Carlos Alessandro Ferreira Gonçalves",
//     "cpf": "111.111.111-00",
//     "rg": "11.111.111-00",
//     "email": "carlos.teste@gmail.com",
//     "telefone": "18 99199-0099",
//     "endereco": "Rua fita cacete com limão, N° 007 - Jardim Imaginario",

try {

    $sql = "SELECT id_tutor FROM tutores WHERE cpf = :cpf";

    $stmt = $cmd->prepare($sql);
    $stmt->bindValue(":cpf", $pessoa["cpf"]);
    $stmt->execute();
    $response = $stmt->fetch(PDO::FETCH_ASSOC);
    echo "verifca antes:";
    var_dump($response);
    if (!$response) {
        // echo "usuario não encontrado";
        // INSERT INTO tutores (nome,endereco,cpf,rg,telefone,email,id_funcionario_cadastro)
        //VALUES
        //('Carlos Eduardo Silva', 'Rua das Palmeiras, 120 - São Paulo/SP', '123.456.789-01', '12.345.678-9', '(11) 99999-1001', 'carlos.silva@email.com', 1),
        $sql2 = "INSERT INTO tutores (nome, endereco, cpf, rg, telefone, email, id_funcionario_cadastro)
        VALUES (:nome, :endereco, :cpf, :rg, :tel, :email, :id_func_cad)";

        $stmt2 = $cmd->prepare($sql2);
        $stmt2->bindValue("nome", $pessoa["name"]);
        $stmt2->bindValue("endereco", $pessoa["endereco"]);
        $stmt2->bindValue("cpf", $pessoa["cpf"]);
        $stmt2->bindValue("rg", $pessoa["rg"]);
        $stmt2->bindValue("tel", $pessoa["telefone"]);
        $stmt2->bindValue("email", $pessoa["email"]);
        $stmt2->bindValue("id_func_cad", 1);
        $stmt2->execute();
        if ($stmt2->rowCount() > 0) {
            $cmd->rollBack();
            echo "Novo tutor cadastrado com sucesso";
            $sql3 = "SELECT * FROM tutores WHERE cpf = '" . $pessoa["cpf"] . "'";
            $stmt3 = $cmd->prepare($sql3);
            $stmt3->execute();
            $data = $stmt3->fetch(PDO::FETCH_ASSOC);
            echo "DADOS:";
            var_dump($data);
        } else {
            echo "novo tutor NÃO cadastrado";
        }

        $sql3 = "SELECT * FROM tutores WHERE cpf = '" . $pessoa["cpf"] . "'";
        $stmt3 = $cmd->prepare($sql3);
        $stmt3->execute();
        $data = $stmt3->fetch(PDO::FETCH_ASSOC);
        echo "DADOS:";
        var_dump($data);
    } else {
        echo "usuarios já existe no cadastro";
        echo "<pre>";
        var_dump($response["id_tutor"]);
        $cmd->rollBack();
    }
} catch (PDOException $e) {
    echo "Error" . $e->getMessage();
} catch (Exception $e) {
    echo "Error" . $e->getMessage();
}
// echo json_encode([
//     "message" => "Deu certo",
//     "data" => $cadastro
// ], JSON_UNESCAPED_UNICODE);

// "animal": {
//         "animalName": "Sol",
//         "especie": "Cachorro",
//         "raca": "SRD",
//         "cor": "amarelo",
//         "idade": "6",
//         "sexo": "Fêmea"
//     }