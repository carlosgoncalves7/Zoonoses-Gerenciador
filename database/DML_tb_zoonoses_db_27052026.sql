-- DML - DATA MANIPULATION LANGUAGE- INSERT, UPDATE E DELETE

SELECT a.nome AS nome_animal,
a.especie, a.raca, a.idade, a.peso, a.cor,
t.nome AS nome_tutor,
f.nome AS nome_funcionario
FROM animais a
	INNER JOIN tutores t
	ON a.id_tutor = t.id_tutor
	INNER JOIN funcionarios f
	ON a.id_funcionario_cadastro = f.id_funcionario;


-- Inserindo dados nas tabelas
INSERT INTO funcionarios (id_funcionario,nome,email,senha) VALUES
(1, 'Ana Paula Ribeiro', 'ana.ribeiro@empresa.com', '123456'),
(2, 'Marcos Vinicius Santos', 'marcos.santos@empresa.com', 'senha123'),
(3, 'Fernanda Costa Lima', 'fernanda.lima@empresa.com', 'admin789');

INSERT INTO tutores (id_tutor,nome,endereco,cpf,rg,telefone,email,id_funcionario_cadastro)
	VALUES
	(1, 'Carlos Eduardo Silva', 'Rua das Palmeiras, 120 - São Paulo/SP', '123.456.789-01', '12.345.678-9', '(11) 99999-1001', 'carlos.silva@email.com', 1),
	(2, 'Mariana Oliveira Souza', 'Av. Brasil, 450 - Campinas/SP', '234.567.890-12', '23.456.789-0', '(19) 98888-2002', 'mariana.souza@email.com', 2),
	(3, 'Fernando Lima Costa', 'Rua XV de Novembro, 78 - Santos/SP', '345.678.901-23', '34.567.890-1', '(13) 97777-3003', 'fernando.costa@email.com', 1),
	(4, 'Juliana Pereira Alves', 'Rua Central, 890 - Sorocaba/SP', '456.789.012-34', '45.678.901-2', '(15) 96666-4004', 'juliana.alves@email.com', 3),
	(5, 'Ricardo Mendes Rocha', 'Av. Independência, 321 - Ribeirão Preto/SP', '567.890.123-45', '56.789.012-3', '(16) 95555-5005', 'ricardo.rocha@email.com', 2),
	(6, 'Patrícia Gomes Ferreira', 'Rua Aurora, 654 - São José dos Campos/SP', '678.901.234-56', '67.890.123-4', '(12) 94444-6006', 'patricia.ferreira@email.com', 1),
	(7, 'André Luiz Martins', 'Av. Paulista, 1500 - São Paulo/SP', '789.012.345-67', '78.901.234-5', '(11) 93333-7007', 'andre.martins@email.com', 1),
	(8, 'Camila Rodrigues Melo', 'Rua do Comércio, 44 - Guarulhos/SP', '890.123.456-78', '89.012.345-6', '(11) 92222-8008', 'camila.melo@email.com', 3),
	(9, 'Lucas Henrique Barros', 'Rua Bela Vista, 700 - Osasco/SP', '901.234.567-89', '90.123.456-7', '(11) 91111-9009', 'lucas.barros@email.com', 2),
	(10, 'Beatriz Fernandes Lopes', 'Av. Europa, 980 - Santo André/SP', '012.345.678-90', '01.234.567-8', '(11) 90000-1010', 'beatriz.lopes@email.com', 1);
    
INSERT INTO animais (id_animal,nome,especie,raça,idade,peso,cor,id_tutor,id_funcionario_cadastro)
	VALUES
	(1, 'Rex', 'Cachorro', 'Labrador', 5, 28.5, 'Caramelo', 1, 1),
	(2, 'Mimi', 'Gato', 'Siamês', 3, 4.2, 'Branco', 2, 2),
	(3, 'Thor', 'Cachorro', 'Pastor Alemão', 7, 35.0, 'Preto e Marrom', 3, 1),
	(4, 'Luna', 'Gato', 'Persa', 2, 3.8, 'Cinza', 4, 3),
	(5, 'Bob', 'Cachorro', 'Bulldog Francês', 4, 12.3, 'Branco e Preto', 5, 2),
	(6, 'Mel', 'Coelho', 'Mini Lop', 1, 2.1, 'Marrom', NULL, 1),
	(7, 'Pingo', 'Pássaro', 'Calopsita', 2, 0.3, 'Amarelo', NULL, 3),
	(8, 'Nina', 'Cachorro', 'Poodle', 6, 8.7, 'Branco', 6, 1),
	(9, 'Fred', 'Gato', 'Maine Coon', 5, 6.5, 'Cinza Escuro', NULL, 2),
	(10, 'Pandora', 'Cachorro', 'Golden Retriever', 3, 30.2, 'Dourado', 7, 3);
    