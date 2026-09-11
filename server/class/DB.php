<?php

class DB
{
    private $conexao;

    // instacia no constructor os dados da conexão com o banco de dados
    function __construct()
    {
        $host = getenv("DB_HOST");
        $dbname = getenv("DB_NAME");
        $port = getenv("DB_PORT");
        $user = getenv("DB_USER");
        $pass = getenv("DB_PASS");


        try {
            $dsn = "mysql:host=$host;port=$port;dbname=$dbname";
            $this->conexao = new PDO($dsn, $user, $pass);
            //echo "Connected\n";
            $this->conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // configura o pdo pra lançar exceções em casos de erro
            //echo $this->pdo->getAttribute(PDO::ATTR_SERVER_INFO);

        } catch (PDOException $e) {
            
            $msg = "Falha na conexão com o banco de dados: " . $e->getMessage();
            //file_put_contents("error.log", $msg, FILE_APPEND);
            echo $msg;

        } catch (Exception $e) {
            $msg = "Não foi possivel conectar: " . $e->getMessage();
            //file_put_contents("generico.log", $msg, FILE_APPEND);
            echo $msg;
        }
    }

    public function getConexao(){
        return $this->conexao;
    }
}