-- DDL - DATA DEFINITION LANGUAGE - CREATE TABLE, ALTER TABLE, DROP TABLE
/*
--- CRIANDO O BANCO DE DADOS
*/
CREATE database zoonoses_db;
/*
CONECTANDO AO BANCO
*/
use zoonoses_db;

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

CREATE TABLE medicos_vet (
	crmv integer PRIMARY KEY NOT NULL,
	id_medico integer NOT NULL,
	nome varchar(255),
	email varchar(255)
);

CREATE TABLE tutor (
  id_tutor int PRIMARY KEY NOT NULL,
  nome varchar(255),
  endereco varchar(255),
  cpf varchar(255),
  rg varchar(255),
  telefone varchar(255),
  email varchar(255),
  id_funcionario_cadastro int NOT NULL
);
-- corrigindo nome de tutores
ALTER TABLE tutor
	RENAME TO tutores;

-- Criar chave estrangeira do funcionario que cadastra
ALTER TABLE tutor ADD foreign key (id_funcionario_cadastro)
	references funcionarios (id_funcionario);

CREATE TABLE animal (
  id_animal int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nome varchar(255) NOT NULL,
  especie varchar(255),
  raça varchar(255),
  idade int,
  peso double,
  cor varchar(255) NOT NULL,
  id_tutor int,
  id_funcionario_cadastro int NOT NULL
);
ALTER TABLE animal RENAME TO animais;

ALTER TABLE animais MODIFY COLUMN id_tutor int;
-- alterando nome da coluna
ALTER TABLE animais RENAME COLUMN raça TO raca;
-- Criando chave estrangeira do tutor e do funcionario que cadastra
ALTER TABLE animais ADD foreign key (id_tutor)
	references tutor (id_tutor);

ALTER TABLE animais ADD foreign key (id_funcionario_cadastro)
	references funcionarios (id_funcionario);
    
CREATE TABLE procedimento (
  id_procedimento int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nome varchar(255) NOT NULL,
  descricao varchar(255),
  crmv_medico int NOT NULL,
  id_tutor int NOT NULL,
  id_animal int NOT NULL
  -- FOREIGN KEY (crmv_medico) REFERENCES medicos_vet(crmv)
);

ALTER TABLE procedimento RENAME TO procedimentos;

-- uma coluna estrangeira so pode ser adicionado quando a mesma e primary key ou unique na sua table original
-- Criando chave estrangeira medico, tutor e animal
ALTER TABLE procedimento ADD foreign key (crmv_medico)
	references medicos_vet (crmv);
    
ALTER TABLE procedimento ADD foreign key (id_tutor)
	references tutor (id_tutor);
    
ALTER TABLE procedimento ADD foreign key (id_animal)
	references animal (id_animal);

