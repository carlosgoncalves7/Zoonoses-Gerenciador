<?php

require_once("./headers.php");
require_once("./config.database.php");
require_once("./class/DB.php");


$DSN = $DB_HOST . $DB_PORT . $DB_NAME;
$db = new DB($DSN, $DB_USER, $DB_PASS);

$cmd = $db->getPDO();

$sql = "SELECT 
    a.*,
    -- a.nome AS nome_animal,
    -- a.especie, a.raca, a.idade, a.peso, a.cor,
    t.nome AS tutor,
    f.nome AS funcionario
        FROM animais a
	        LEFT JOIN tutores t
	            ON a.id_tutor = t.id_tutor
	        LEFT JOIN funcionarios f
	            ON a.id_funcionario_cadastro = f.id_funcionario
            WHERE especie = 'Gato'";


$stm = $cmd->prepare($sql);
$stm->execute();

$response = $stm->fetchAll(PDO::FETCH_ASSOC);

// empty - verifica se esta variavel esta vazia ou não
// verdadeiro - se estiver vazia 
// falso - se estiver preenchida
if(!empty($response)){
    echo json_encode($response);
}
else{
    echo "Nao existe esse usuario";
}