<?php

require_once("./headers.php");
require_once("./class/DB.php");

// $input = file_get_contents('php://input');
// $usuario = json_decode($input, true);

// conexão manual
$mysqlhost = "mysql:host=localhost;";
$porta = "port=3306;";
$dbname = "dbname=zoonoses_db;";
$dados = $mysqlhost . $porta . $dbname;
$db = new DB($dados, "root", "root");

$conexao = null;
// Por haver possibilidade de dar erro usamos o try catch
try {
$conexao = $db->conectar();
// configura o pdo pra lançar exceções em casos de erro
$conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
//echo $conexao->getAttribute(PDO::ATTR_SERVER_INFO);

} catch (PDOException $e){
    $msg = "Erro de Banco de Dados " . $e->getMessage();
    file_put_contents("error.log", $msg, FILE_APPEND);

} catch (Exception $e){
    $msg = "Error : " . $e->getMessage();
    file_put_contents("generico.log", $msg, FILE_APPEND);
}

$sql = "SELECT a.nome AS nome_animal,
a.especie, a.raca, a.idade, a.peso, a.cor,
t.nome AS tutor,
f.nome AS funcionario
FROM animais a
	INNER JOIN tutores t
	ON a.id_tutor = t.id_tutor
	INNER JOIN funcionarios f
	ON a.id_funcionario_cadastro = f.id_funcionario";
// $sql = "SELECT * FROM animal";

$cmd = $conexao->prepare($sql);
$cmd->execute();

$response = $cmd->fetchAll(PDO::FETCH_ASSOC);

file_put_contents("animais.json", json_encode($response));
// empty - verifica se esta variavel esta vazia ou não
// verdadeiro - se estiver vazia 
// falso - se estiver preenchida
if(!empty($response)){
    echo json_encode($response);
}
else{
    echo "Nao existe esse usuario";
}