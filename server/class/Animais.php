<?php

class Animais {
    
    private $db;
    private $nome;
    private $especie;
    private $raca;
    private $idade;
    private $peso;
    private $idtutor;
    private $idfuncionario;
    
    public function __construct($db, $nome, $especie, $raca, $idade, $peso, $idtutor, $idfuncionario)
    {
        $this->db = $db;
        $this->nome = $nome;
        $this->especie = $especie;
        $this->raca = $raca;
        $this->idade = $idade;
        $this->peso = $peso;
        $this->idtutor = $idtutor;
        $this->idfuncionario = $idfuncionario;
    }

    
}