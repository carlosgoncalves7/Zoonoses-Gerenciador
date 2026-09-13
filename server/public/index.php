<?php

//header("Access-Control-Allow-Origin: *");
//header("Access-Control-Allow-Methods: POST");
//header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");

// ACTIVE RECORD
require_once "../app/models/DB.php";
require_once "../app/models/Tutor.php";

$db = new DB();

$tutor = new Tutor($db->getConexao());
echo $tutor->TodosTutores();
//echo $tutor->setCPF("125.445.48844.96");
//echo $tutor->verificarCPFexiste("567.890.993-45");
//echo $tutor->validarCadastroTutor("567.890.993-45");
//echo $tutor->validarCadastroTutor("567.890.193-45");

//$tutor->setCpf("555.444.222-22");
exit();