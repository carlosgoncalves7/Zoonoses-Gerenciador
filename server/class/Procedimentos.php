<?php

class Procedimentos
{

    private $db;
    private $nome;
    private $descricao;
    private $crmv;
    private $idtutor;
    private $idanimal;

    public function __construct($db, $nome, $descricao, $crmv, $idtutor, $idanimal)
    {
        $this->db = $db;
        $this->nome = $nome;
        $this->descricao = $descricao;
        $this->crmv = $crmv;
        $this->idtutor = $idtutor;
        $this->idanimal = $idanimal;
    }
}