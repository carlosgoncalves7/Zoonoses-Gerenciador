<?php

class Tutor
{

    private $conexaoDB;
    private $nome;
    private $endereco;
    private $cpf;
    private $rg;
    private $telefone;
    private $email;
    private $id_funcionario;

    public function __construct($conexao)
    {
        $this->conexaoDB = $conexao;
    }

    public function verificarCPFexiste(string $cpf)
    {
        try {
            $sql = "SELECT id_tutor FROM tutores WHERE cpf = :cpf";
            $stmt = $this->conexaoDB->prepare($sql);
            $stmt->bindValue(":cpf", $cpf, PDO::PARAM_STR);
            $stmt->execute();
            if ($stmt->rowCount() == 1) {
                // JSON_UNESCAPED_UNICODE : INPEDE QUE O JSON ENCODE TRANSFORMAR LETRAS COM ACENTO EM CARACTER UNICODE(ex: \u00e7), ao encodar mantem as palavra visualmente legiveis
                // JSON_PRETTY_PRINT - mantem a estrutura do encode json formatada pra ser visualmente legivel pra ser ler um objeto json
                //echo json_encode("O CPF já está cadastrado", JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
                return true;
            }
        } catch (PDOException $e) {
            echo "Erro com Banco de Dados: " . $e->getMessage();
        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }

    }

    public function validarCadastroTutor()
    {
        $validar = $this->verificarCPFexiste($this->cpf);
        if ($validar) {
            throw new Exception("Não foi possivel cadastrar o tutor. CPF já existe no sistema.");
        }

        return;
    }
    public function getTodosTutores()
    {
        try {
            $sql = "SELECT * FROM tutores";
            $stmt = $this->conexaoDB->prepare($sql);
            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC); // Listar coleções completas de dados de uma vez.
            if (empty($rows)) {
                return [];
            }
            return $rows;
        } catch (PDOException $e) {
            echo "Falha ao consultar o Banco de Dados: " . $e->getMessage();
        } catch (Exception $e) {
            echo "Falha ao consultar: " . $e->getMessage();
        }
        return;
    }

    public function consultarTutor(int $id)
    {
        try {
            $sql = "SELECT * FROM tutores WHERE id_tutor = :id";
            $stmt = $this->conexaoDB->prepare($sql);
            $stmt->bindValue(":id", $id);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC); // Array Associativo Simples (1 registro) ou false
            return $row;
        } catch (PdoException $e) {
            echo "Falha ao consultar o Banco de Dados: " . $e->getMessage();
        } catch (Exception $e) {
            echo "Falha ao consultar Tutor: " . $e->getMessage();
        }
        return;
    }


    public function getNome()
    {
        return $this->nome;
    }

    public function setNome($nome): void
    {
        $this->nome = $nome;
    }

    public function getEndereco()
    {
        return $this->endereco;
    }

    public function setEndereco($endereco): void
    {
        $this->endereco = $endereco;
    }

    public function getCpf()
    {
        return $this->cpf;
    }

    public function setCpf($cpf): void
    {
        $this->cpf = $cpf;
    }

    public function getRg()
    {
        return $this->rg;
    }

    public function setRg($rg): void
    {
        $this->rg = $rg;
    }

    public function getTelefone()
    {
        return $this->telefone;
    }

    public function setTelefone($telefone): void
    {
        $this->telefone = $telefone;
    }

    public function getEmail()
    {
        return $this->email;
    }

    public function setEmail($email): void
    {
        $this->email = $email;
    }

    public function getIdFuncionario()
    {
        return $this->id_funcionario;
    }

    public function setIdFuncionario($id_funcionario): void
    {
        $this->id_funcionario = $id_funcionario;
    }


}