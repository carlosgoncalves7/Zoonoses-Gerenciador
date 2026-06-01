<?php



class Login
{
    private $db;
    private $email;
    private $senha;

    public function __construct($db, $email, $senha)
    {
        $this->db = $db;
        $this->email = $email;
        $this->senha = $senha;
    }

    public function validar()
    {
        $res = array();
        $sql = "SELECT email, senha FROM funcionarios WHERE email = :email AND senha = :senha";
        $cmd = $this->db->prepare($sql);
        $cmd->bindValue(":email", $this->email, PDO::PARAM_STR);
        $cmd->bindValue(":senha", $this->senha, PDO::PARAM_STR);
        $cmd->execute();

        $res = $cmd->fetch(PDO::FETCH_ASSOC);
        //empty - verifica se esta variavel esta vazia ou não
        //verdadeiro - se estiver vazia 
        //falso - se estiver preenchida
        if (!empty($res)) {
            return $res;
        } else {
            return false;
        }
    }
}