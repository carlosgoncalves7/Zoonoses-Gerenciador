<?php

class Tutor {
    
    private $db;
    private $nome;
    private $endereco;
    private $cpf;
    private $telefone;
    private $email;

    public function __construct($db, $nome, $endereco, $cpf, $telefone, $email)
    {
        $this->db = $db;
        $this->nome = $nome;
        $this->endereco = $endereco;
        $this->cpf = $cpf;
        $this->telefone = $telefone;
        $this->email = $email;
    }

    
}