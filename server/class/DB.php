<?php

class DB
{

    private $pdo;

    // instacia no constructor os dados da conexão com o banco de dados
    function __construct($data, $dbname, $pass)
    {

        try {
            $this->pdo = new PDO($data, $dbname, $pass);
            // configura o pdo pra lançar exceções em casos de erro
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            //echo $conexao->getAttribute(PDO::ATTR_SERVER_INFO);

        } catch (PDOException $e) {
            
            $msg = "Erro de Banco de Dados " . $e->getMessage();
            file_put_contents("error.log", $msg, FILE_APPEND);
            
        } catch (Exception $e) {
            $msg = "Error : " . $e->getMessage();
            file_put_contents("generico.log", $msg, FILE_APPEND);
        }
    }
}