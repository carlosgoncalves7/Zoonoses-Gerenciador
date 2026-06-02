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
    crmv integer  NOT NULL,
	nome varchar(255) NOT NULL,
	email varchar(255)
);

ALTER TABLE veterinarios modify id_veterinario INT NOT NULL AUTO_INCREMENT;

CREATE TABLE tutores (
  id_tutor int PRIMARY KEY auto_increment NOT NULL,
  nome varchar(255),
  endereco varchar(255),
  cpf varchar(255),
  rg varchar(255),
  telefone varchar(255),
  email varchar(255),
  id_funcionario_cadastro int NOT NULL
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
select * from procedimentos;
select * from medicos_vet;
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

