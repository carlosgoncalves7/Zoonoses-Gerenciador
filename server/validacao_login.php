<?php

require_once("./headers.php");
require_once("./config.database.php");
require_once("./class/DB.php");
require_once("./class/Login.php");

$input = file_get_contents('php://input');
$usuario = json_decode($input, true);

// if (empty($usuario)) {
//     echo json_encode([
//         "default" => false
//     ]);
//     exit();
// }
// Data Source Name (Nome da Fonte de Dados)

$DSN = $DB_HOST . $DB_PORT . $DB_NAME;

$email = $usuario['email'] ?? '';
$senha = $usuario['senha'] ?? '';

$db = new DB($DSN, $DB_USER, $DB_PASS);
// var_dump($db);
$user = new Login($db->getPDO(), $email, $senha);

if ($user->validar()) {

    $banco = $db->getPDO();
    
    $sql = "SELECT email, senha FROM funcionarios WHERE email = :email AND senha = :senha";
    $cmd = $banco->prepare($sql);
    $cmd->bindValue(":email", $email, PDO::PARAM_STR);
    $cmd->bindValue(":senha", $senha, PDO::PARAM_STR);
    $cmd->execute();

    $response = $cmd->fetch(PDO::FETCH_ASSOC);
    // //empty - verifica se esta variavel esta vazia ou não
// //verdadeiro - se estiver vazia 
// //falso - se estiver preenchida

    if (!empty($response)) {
        echo json_encode([
            "authentication" => true,
            "user" => $response
        ]);
    }
}
else {
    echo json_encode([
        "authentication" => false,
        "message" => "Usuário não existe"
    ]);
}

// Por haver possibilidade de dar erro usamos o try catch
// try {
//     // configura o pdo pra lançar exceções em casos de erro
//     $conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
//     //echo $conexao->getAttribute(PDO::ATTR_SERVER_INFO);

// } catch (PDOException $e) {
//     $msg = "Erro de Banco de Dados " . $e->getMessage();
//     file_put_contents("error.log", $msg, FILE_APPEND);
// } catch (Exception $e) {
//     $msg = "Error : " . $e->getMessage();
//     file_put_contents("generico.log", $msg, FILE_APPEND);
// }