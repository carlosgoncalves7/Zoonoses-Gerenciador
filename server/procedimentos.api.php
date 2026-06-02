<?php

require_once("./headers.php");
require_once("./config.database.php");
require_once("./class/DB.php");

$DSN = $DB_HOST . $DB_PORT . $DB_NAME;
$db = new DB($DSN, $DB_USER, $DB_PASS);

$cmd = $db->getPDO();

$sql = "SELECT 
a.nome,
a.especie,
a.sexo,
t.nome AS tutor,
p.id_procedimento,
p.nome AS nome_procedimento,
p.data_procedimento AS data,
p.descricao,
v.nome AS veterinario
FROM animais a
	INNER JOIN tutores t
		ON a.id_tutor = t.id_tutor
    INNER JOIN procedimentos p
		ON t.id_tutor = p.id_tutor
	INNER JOIN veterinarios v
		ON p.id_veterinario = v.id_veterinario;";

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