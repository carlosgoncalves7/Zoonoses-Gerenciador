<?php

class Data {

    private $db;

    // instacia no constructor os dados da conexão com o banco de dados
    function __construct($dados, $username="root", $password="root")
    {
    $this->db = new PDO($dados, $username, $password);
    }

    function conectar(){
        return $this->db;
    }
}
