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

    public function verificarCPFexiste(string $cpf): bool
    {
        try {
            $sql = "SELECT id_tutor FROM tutores WHERE cpf = :cpf";
            $stmt = $this->conexaoDB->prepare($sql);
            $stmt->bindValue(":cpf", $cpf, PDO::PARAM_STR);
            $stmt->execute();
            return $stmt->rowCount() > 0;
        } catch (PDOException $e) {
            //$msg = "Error: " . $e->getMessage();
            //file_put_contents("error.log", $msg, FILE_APPEND);

            // Log seguro do erro real para o desenvolvedor:
            error_log("Erro no Banco de Dados [verificarCPFexiste]: " . $e->getMessage());
            throw new Exception("Não foi possivel verificar o CPF no momento. Tente novamente mais tarde");
        }
    }

    public function validarCadastroTutor($cpf)
    {
        $validar = $this->verificarCPFexiste($cpf);
        if ($validar) {
            throw new Exception("Não foi possivel cadastrar o tutor. CPF já existe no sistema.");
        }
        return $this->cadastrarTutor();
    }

    public function cadastrarTutor()
    {
        try {
            $sql = "INSERT INTO tutores (nome,endereco,cpf,rg,telefone,email,id_funcionario_cadastro)
            VALUES
            (:nome, :endereco, :cpf, :rg, :telefone, :email, :id_funcionario)";

            $stmt = $this->conexaoDB->prepare($sql);
            $stmt->bindValue(":nome", $this->getNome());
            $stmt->bindValue(":endereco", $this->getEndereco());
            $stmt->bindValue(":cpf", $this->getCpf());
            $stmt->bindValue(":rg", $this->getRg());
            $stmt->bindValue(":telefone", $this->getTelefone());
            $stmt->bindValue(":email", $this->getEmail());
            $stmt->bindValue(":id_funcionario", $this->getIdFuncionario());
            $stmt->execute();
            if($stmt->rowCount() == 1) {
                return json_encode(["status" => "sucesso", "mensagem" => "Cadastrado com sucesso!"], JSON_UNESCAPED_UNICODE);
            }

            return json_encode(["status" => "erro", "mensagem" => "Nenhum dado foi inserido."], JSON_UNESCAPED_UNICODE);

        } catch (PDOException $e){
            // Log seguro do erro real para o desenvolvedor:
            error_log("Erro no Banco de Dados [cadastrarTutor]: " . $e->getMessage());
            throw new Exception("Não foi possivel realizar cadastro do Tutor. Tente novamente mais tarde.");
        }
    }

    /**
     * Busca todos os tutores cadastrados.
     *
     * @return array Array com os tutores encontrados.
     * @throws Exception Caso ocorra uma falha na consulta ao banco de dados.
     */
    public function getTodosTutores()
    {
        try {
            $sql = "SELECT * FROM tutores";
            $stmt = $this->conexaoDB->prepare($sql);
            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC); // Listar coleções completas de dados de uma vez.
            if (empty($rows)) {
                return json_encode(["status" => "erro","mensagem" => "Dados não encontrados", "tutores" => []], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
            }
            return json_encode(["status" => "sucesso","mensagem" => "Dados encontrados", "tutores" => $rows], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
        } catch (PDOException $e) {
            error_log("Erro no Banco de Dados [getTodosTutores]: " . $e->getMessage());
            throw new Exception("Não foi possivel carregar os dados dos Tutores. Tente novamente mais tarde.");
        }
    }

    public function consultarTutor(int $id)
    {
        // $reponse = [];
        try {
            $sql = "SELECT * FROM tutores WHERE id_tutor = :id";
            $stmt = $this->conexaoDB->prepare($sql);
            $stmt->bindValue(":id", $id);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC); // Array Associativo Simples (1 registro) ou false
            if($row->rowCount() == 1) {
                return json_encode(["status" => "sucesso","mensagem" => "Dados encontrados", "tutor" => $row], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
            }
            return json_encode(["status" => "erro","mensagem" => "Nenhum dado encontrado", "tutor" => []], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
        } catch (PdoException $e) {
            error_log($e->getMessage());
            throw new Exception("Falha interna ao consultar buscar os dados.");
        }
        //return $reponse;
    }


    public function getNome()
    {
        return $this->nome;
    }

    public function setNome(String $nome): void
    {
        $this->nome = $nome;
    }

    public function getEndereco()
    {
        return $this->endereco;
    }

    public function setEndereco(String $endereco): void
    {
        $this->endereco = $endereco;
    }

    public function getCpf()
    {
        return $this->cpf;
    }

    public function setCpf(String $cpf)
    {
        //$padraoCPF = "/^\d{3}\.\d{3}\.\d{3\-\d{2}$/";
        $CPFlimpo = preg_replace("/\D/",'', trim($cpf)); // remove todo caracter que não for número.
        if(strlen($CPFlimpo) !== 11) {
            throw new Exception ("O CPF deve possuir 11 dígitos");
        }
        $this->cpf = $CPFlimpo;
    }

    public function getRg()
    {
        return $this->rg;
    }

    public function setRg(String $rg): void
    {
        //$padraoRG = "/^\d{2}\.\d{3}\.\d{3\-\d{2}$/";
        $RGlimpo = preg_replace("/\D/",'', trim($rg)); // remove todo caracter que não for número.
        if(strlen($RGlimpo) !== 9) {
            throw new Exception ("O RG deve possuir 9 dígitos");
        }
        $this->rg = $RGlimpo;
    }

    public function getTelefone()
    {

        return $this->telefone;
    }

    public function setTelefone(String $telefone): void
    {
        //$padraoTelefone = "/^(\d{2})\s\d{5}\-\d{4}$/";

        $Telefonelimpo = preg_replace("/\D/",'', trim($telefone)); // remove todo caracter que não for número.
        if(strlen($Telefonelimpo) !== 9 or strlen($Telefonelimpo) !== 11) {
            throw new Exception ("O Número de Telefone inválido");
        }
        $this->telefone = $Telefonelimpo;
    }

    public function getEmail()
    {
        return $this->email;
    }

    public function setEmail(String $email): void
    {
        $this->email = $email;
    }

    public function getIdFuncionario()
    {
        return $this->id_funcionario;
    }

    public function setIdFuncionario(int $id_funcionario): void
    {
        $this->id_funcionario = $id_funcionario;
    }


}