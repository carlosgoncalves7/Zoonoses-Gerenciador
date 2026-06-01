select * from animais;

SELECT a.nome AS nome_animal,
a.especie, a.raca, a.idade, a.peso, a.cor,
t.nome AS nome_tutor,
f.nome AS nome_funcionario
FROM animais a
	INNER JOIN tutores t
	ON a.id_tutor = t.id_tutor
	INNER JOIN funcionarios f
	ON a.id_funcionario_cadastro = f.id_funcionario;
    
SELECT a.nome AS nome_animal,
a.especie, a.raca, a.idade, a.peso, a.cor,
t.nome AS nome_tutor,
f.nome AS nome_funcionario
FROM animais a
	INNER JOIN tutores t
	ON a.id_tutor = t.id_tutor
	INNER JOIN funcionarios f
	ON a.id_funcionario_cadastro = f.id_funcionario
    where especie = 'Gato';
    
