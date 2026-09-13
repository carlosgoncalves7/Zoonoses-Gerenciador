<?php

class Procedimentos
{

    private $db;
    private $nome;
    private $descricao;

    private $data_procedimento;
    private $id_veterinario;
    private $id_tutor;
    private $id_animal;

    /**
     * @param $db
     * @param $nome
     * @param $descricao
     * @param $data_procedimento
     * @param $id_veterinario
     * @param $id_tutor
     * @param $id_animal
     */
    public function __construct($db, $nome, $descricao, $data_procedimento, $id_veterinario, $id_tutor, $id_animal)
    {
        $this->db = $db;
        $this->nome = $nome;
        $this->descricao = $descricao;
        $this->data_procedimento = $data_procedimento;
        $this->id_veterinario = $id_veterinario;
        $this->id_tutor = $id_tutor;
        $this->id_animal = $id_animal;
    }

    public function getNome()
    {
        return $this->nome;
    }

    public function setNome($nome): void
    {
        $this->nome = $nome;
    }

    public function getDescricao()
    {
        return $this->descricao;
    }

    public function setDescricao($descricao): void
    {
        $this->descricao = $descricao;
    }

    public function getDataProcedimento()
    {
        return $this->data_procedimento;
    }

    public function setDataProcedimento($data_procedimento): void
    {
        $this->data_procedimento = $data_procedimento;
    }

    public function getIdVeterinario()
    {
        return $this->id_veterinario;
    }

    public function setIdVeterinario($id_veterinario): void
    {
        $this->id_veterinario = $id_veterinario;
    }

    public function getIdTutor()
    {
        return $this->id_tutor;
    }

    public function setIdTutor($id_tutor): void
    {
        $this->id_tutor = $id_tutor;
    }

    public function getIdAnimal()
    {
        return $this->id_animal;
    }

    public function setIdAnimal($id_animal): void
    {
        $this->id_animal = $id_animal;
    }




}