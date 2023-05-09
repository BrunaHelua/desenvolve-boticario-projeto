select * from course;
select * from category;

select * from course where category_id in (1, 2);

--busca
select * from course where category_id in (
select id from category where nome not like '% %');

select course.nome from course where category_id in (
select id from category where nome like '% de %');

select * from course;
select * from category;

select category.nome as categoria,
	count(course.id) as numero_cursos
	from category
	join course on course.category_id = category.id
	group by categoria
	having count(course.id) > 3; 

-- tratar uma query como uma tabela, será possível usar buscas mais complexas?
select categoria, numero_cursos
from (
	select category.nome as categoria,
	count(course.id) as numero_cursos
	from category
	join course on course.category_id = category.id
	group by categoria
) as tabela_query_categoria_cursos
where numero_cursos > 3;


  SELECT course.nome,
         COUNT(student_course.student_id) numero_alunos
    FROM course
    JOIN student_course ON student_course.course_id = course.id
GROUP BY 1
     HAVING COUNT(student_course.student_id) > 2
ORDER BY numero_alunos DESC;

select teste.nome_curso, teste.numero_alunos
from
	(SELECT course.nome as nome_curso,
         COUNT(student_course.student_id) numero_alunos
    FROM course
    JOIN student_course ON student_course.course_id = course.id
GROUP BY 1
ORDER BY numero_alunos DESC
) as teste
where teste.numero_alunos > 2

select (primeiro_nome ||' ' || ultimo_nome) as nome_completo from student;

select CONCAT('Bruna', ' ', null);
select CONCAT('Bruna', ' ', 'Tiburcio');
select UPPER(CONCAT('Bruna', ' ', 'Tiburcio' || ' '));
select TRIM(UPPER(CONCAT('Bruna', ' ', 'Tiburcio')) || ' ');

select (primeiro_nome ||' ' || ultimo_nome) as nome_completo, data_nascimento from student;

select (primeiro_nome ||' ' || ultimo_nome) as nome_completo, NOW(), data_nascimento from student;

select (primeiro_nome ||' ' || ultimo_nome) as nome_completo, NOW()::DATE, data_nascimento from student;

select (primeiro_nome ||' ' || ultimo_nome) as nome_completo, NOW()::DATE - data_nascimento from student;

select (primeiro_nome ||' ' || ultimo_nome) as nome_completo, (NOW()::DATE - data_nascimento)/365 from student;

select (primeiro_nome ||' ' || ultimo_nome) as nome_completo, AGE(data_nascimento) AS idade from student;

select (primeiro_nome ||' ' || ultimo_nome) as nome_completo, 
	EXTRACT(YEAR FROM AGE(data_nascimento)) AS idade 
	from student;

SELECT pi();

SELECT NOW()::DATE;

SELECT TO_CHAR(NOW(), 'DD/MM/YYYY');

SELECT TO_CHAR(128.3::REAL, '999D99');
SELECT TO_CHAR(NOW(), 'DD, MONTH, YYYY');

select categoria, numero_cursos
from (
	select category.nome as categoria,
	count(course.id) as numero_cursos
	from category
	join course on course.category_id = category.id
	group by categoria
) as tabela_query_categoria_cursos
where numero_cursos > 3;

CREATE VIEW vw_cursos_por_categoria2 AS
	select category.nome as categoria,
	count(course.id) as numero_cursos
	from category
	join course on course.category_id = category.id
	group by categoria
	--having COUNT(course.id) > 3

select * from vw_cursos_por_categoria2

select categoria, numero_cursos
from vw_cursos_por_categoria2 AS categoria_cursos
where numero_cursos >= 3;

select category.id, vw_cursos_por_categoria2.* 
	from vw_cursos_por_categoria2 
	join category on category.nome = vw_cursos_por_categoria2.categoria  -- busca por nome é mais custosa na performance


CREATE VIEW vw_cursos_programacao AS SELECT nome FROM course WHERE category_id = 2;

select * from vw_cursos_programacao WHERE

