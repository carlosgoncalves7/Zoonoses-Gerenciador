<?php

require_once("./class/Data.php");

// 1. Configuração de CORS (Obrigatório para o fetch funcionar do seu frontend)
// Permite qualquer origem (em produção, substitua pelo seu domínio)
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");

$input = file_get_contents('php://input');
$usuario = json_decode($input, true);

if (empty($usuario)) {
    echo json_encode([
        "default" => false
    ]);
    exit();
}

$email = $usuario['email'];
$senha = $usuario['senha'];

// conexão manual
$mysqlhost = "mysql:host=localhost;";
$porta = "port=3306;";
$dbname = "dbname=zoonoses_db;";
$dados = $mysqlhost . $porta . $dbname;
$db = new Data($dados, "root", "root");

$conexao = null;
// Por haver possibilidade de dar erro usamos o try catch
try {
    $conexao = $db->conectar();
    // configura o pdo pra lançar exceções em casos de erro
    $conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    //echo $conexao->getAttribute(PDO::ATTR_SERVER_INFO);

} catch (PDOException $e) {
    $msg = "Erro de Banco de Dados " . $e->getMessage();
    file_put_contents("error.log", $msg, FILE_APPEND);
} catch (Exception $e) {
    $msg = "Error : " . $e->getMessage();
    file_put_contents("generico.log", $msg, FILE_APPEND);
}


$sql = "SELECT email, senha FROM funcionarios WHERE email = :email AND senha = :senha";
$cmd = $conexao->prepare($sql);
$cmd->bindValue(":email", $email, PDO::PARAM_STR);
$cmd->bindValue(":senha", $senha, PDO::PARAM_STR);
$cmd->execute();

$response = $cmd->fetch(PDO::FETCH_ASSOC);
// empty - verifica se esta variavel esta vazia ou não
// verdadeiro - se estiver vazia 
// falso - se estiver preenchida


$status = ["authentication" => true];

if (!empty($response)) {
    echo json_encode([
        "authentication" => true,
    ]);
}