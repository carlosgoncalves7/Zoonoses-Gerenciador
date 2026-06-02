select * from animais;
select * from veterinarios;
select * from procedimentos;

select 
a.id_animal,
t.id_tutor,
a.sexo
from animais a
inner join tutores t
on a.id_tutor = t.id_tutor;

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
    
select a.nome,
a.especie,
a.sexo,
t.nome,
p.data_procedimento,
p.descricao,
v.nome
from animais a
	inner join tutores t
		on a.id_tutor = t.id_tutor
    inner join procedimentos p
		on t.id_tutor = p.id_tutor
	inner join veterinarios v
		on p.id_veterinario = v.id_veterinario;
    
    
