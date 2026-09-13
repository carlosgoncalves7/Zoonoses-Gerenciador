<?php
class Animais {
    
    private $conexaoDB;
    private $nome;
    private $especie;
    private $raca;
    private $idade;
    private $peso;
    private $cor;
    private $sexo;
    
    public function __construct($db, $nome, $especie, $raca, $idade, $peso)
    {
        $this->conexaoDB = $db;
        $this->nome = $nome;
        $this->especie = $especie;
        $this->raca = $raca;
        $this->idade = $idade;
        $this->peso = $peso;
    }

    public function cadastrar(int $id_tutor,int $id_usuario)
    {
        try {
            $sql = "INSERT INTO animais (nome,especie,raca,idade,peso,cor,sexo,id_tutor,id_usuario)
                VALUES              (:nome, :esp, :raca, :idade, :peso, :cor, :sexo, :id_tutor, :id_usuario)";

            $stmt = $this->conexaoDB->prepare($sql);
            $stmt->bindValue("nome",$this->nome);
            $stmt->bindValue("esp",$this->especie);
            $stmt->bindValue("raca",$this->raca);
            $stmt->bindValue("idade",$this->idade);
            $stmt->bindValue("peso",$this->peso);
            $stmt->bindValue("cor",$this->getCor());
            $stmt->bindValue("sexo",$this->getSexo());
            $stmt->bindValue(":id_tutor",$id_tutor, PDO::PARAM_INT);
            $stmt->bindValue("id_func_cad",$id_usuario, PDO::PARAM_INT);
            $stmt->execute();

            if($stmt->rowCount() == 1) {
                return json_encode(["status" => "sucesso", "mensagem" => "Animal cadastrado com sucesso!"], JSON_UNESCAPED_UNICODE);
            }
            return json_encode(["status" => "erro", "mensagem" => "Nenhum dado foi inserido."], JSON_UNESCAPED_UNICODE);
        } catch(PDOException $e) {
            error_log("Erro no Banco de Dados [cadastrar]: " . $e->getMessage());
            throw new Exception("Não foi possivel realizar cadastro do Animal. Tente novamente mais tarde.");
        }
    }

    public function atualizar(int $id_animal,int $id_usuario){
        try{
            $sql = "UPDATE animais";
        } catch (PDOException $e) {

        }
    }

    public function excluir(int $id_animal){
        try {
            $sql = "DELETE FROM animais WHERE id_animal = $id_animal";
            $stmt = $this->conexaoDB->prepare($sql);
            $stmt->execute();
            if($stmt->rowCount() == 1) {
                return json_encode(["status" => "sucesso", "mensagem" => "Animal excluido com sucesso!"], JSON_UNESCAPED_UNICODE);
            }

            return json_encode(["status" => "erro", "mensagem" => "Não foi possuir excluir"], JSON_UNESCAPED_UNICODE);
        } catch(PDOException $e) {
            error_log("Erro no Banco de Dados [excluir]: " . $e->getMessage());
            throw new Exception("Não foi possível realizar cadastro do Animal. Tente novamente mais tarde.");
        }
    }

    public function getNome()
    {
        return $this->nome;
    }

    public function setNome($nome): void
    {
        $this->nome = $nome;
    }

    public function getEspecie()
    {
        return $this->especie;
    }

    public function setEspecie($especie): void
    {
        $this->especie = $especie;
    }

    public function getRaca()
    {
        return $this->raca;
    }

    public function setRaca($raca): void
    {
        $this->raca = $raca;
    }

    public function getIdade()
    {
        return $this->idade;
    }

    public function setIdade($idade): void
    {
        $this->idade = $idade;
    }

    public function getPeso()
    {
        return $this->peso;
    }

    public function setPeso($peso): void
    {
        $this->peso = $peso;
    }

    public function getCor()
    {
        return $this->cor;
    }

    public function setCor($cor): void
    {
        $this->cor = $cor;
    }

    public function getSexo()
    {
        return $this->sexo;
    }

    public function setSexo($sexo): void
    {
        $this->sexo = $sexo;
    }
    
}