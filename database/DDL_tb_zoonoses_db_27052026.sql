-- DDL - DATA DEFINITION LANGUAGE - CREATE TABLE, ALTER TABLE, DROP TABLE
/*
--- CRIANDO O BANCO DE DADOS
*/
CREATE database zoonoses_db;
/*
CONECTANDO AO BANCO
*/
-- =============
-- TABELAS BASE
CREATE TABLE admin (
  id_admin integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nome varchar(255) NOT NULL,
  email varchar(255),
  senha varchar(255)
);

CREATE TABLE funcionarios (
	id_funcionario integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome varchar(200) NOT NULL,
    email varchar(200) NOT NULL,
    senha varchar(100) NOT NULL
);

CREATE TABLE veterinarios (
	id_veterinario integer PRIMARY KEY AUTO_INCREMENT NOT NULL,
  crmv integer  NOT NULL UNIQUE,
	nome varchar(255) NOT NULL,
	email varchar(255)

  -- CONSTRAINT uq_vet_email UNIQUE (email)
  -- CONSTRAINT uq_crmv UNIQUE (crmv)
);

ALTER TABLE veterinarios modify id_veterinario INT NOT NULL AUTO_INCREMENT;

CREATE TABLE tutores (
  id_tutor int PRIMARY KEY auto_increment NOT NULL,
  nome varchar(255),
  endereco varchar(255),
  cpf varchar(255) UNIQUE,
  rg varchar(255) UNIQUE,
  telefone varchar(255),
  email varchar(255) UNIQUE,
  id_funcionario_cadastro int NOT NULL,

  -- criando um nome pra regra constraint e definindo a coluna como unica
  -- como uma regra declarada com nome ex: [uq_cpf] quando alguem tentar registrar
  -- insert por exemplo, o banco vai responder com um erro de
  -- com a regra possuindo um nome, ele vai exibir direto o nome da coluna que ja possuia o 
  -- valor que tentou inserir, fica mais facil de descobrir a coluna, se nao o banco responde 
  -- com um nome aleatório
  CONSTRAINT uq_cpf UNIQUE (cpf),
  CONSTRAINT uq_rg UNIQUE (rg),
  CONSTRAINT uq_email UNIQUE (email)
);

-- Criar chave estrangeira do funcionario que cadastra
ALTER TABLE tutores ADD foreign key (id_funcionario_cadastro)
	references funcionarios (id_funcionario);

CREATE TABLE animais (
  id_animal int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nome varchar(255) NOT NULL,
  especie varchar(255),
  raca varchar(255),
  idade int,
  peso double,
  cor varchar(255) NOT NULL,
  sexo varchar(20) NOT NULL,
  id_tutor int,
  id_funcionario_cadastro int NOT NULL
);
-- alterando nome da coluna
-- Criando chave estrangeira do tutor e do funcionario que cadastra
ALTER TABLE animais ADD foreign key (id_tutor)
	references tutores (id_tutor);

ALTER TABLE animais ADD foreign key (id_funcionario_cadastro)
	references funcionarios (id_funcionario);
    
CREATE TABLE procedimentos (
  id_procedimento int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nome varchar(255) NOT NULL,
  descricao varchar(255),
  data_procedimento varchar(40) NOT NULL DEFAULT '2026-06-02',
  id_veterinario int NOT NULL,
  id_tutor int NOT NULL,
  id_animal int NOT NULL
);

-- ALTER TABLE procedimento RENAME TO procedimentos;
-- uma coluna estrangeira so pode ser adicionado quando a mesma e primary key ou unique na sua table original
-- Criando chave estrangeira medico, tutor e animal
ALTER TABLE procedimentos 
ADD FOREIGN KEY (id_veterinario) 
REFERENCES veterinarios(id_veterinario);
    
ALTER TABLE procedimentos 
ADD foreign key (id_tutor)
references tutores (id_tutor);
    
ALTER TABLE procedimentos 
ADD foreign key (id_animal)
	references animais (id_animal);

