CREATE TABLE student(
	id serial primary key,
	primeiro_nome varchar(255) not null,
	ultimo_nome varchar(255) not null,
	data_nascimento DATE not null
);

select * from student
INSERT INTO student (primeiro_nome, ultimo_nome, data_nascimento) VALUES (
	'Vinicius', 'Dias', '1997-10-15'
), (
	'Patricia', 'Freitas', '1986-10-25'
), (
	'Diogo', 'Oliveira', '1984-08-27'
), (
	'Maria', 'Rosa', '1985-01-01'
);

CREATE TABLE category (
	id serial PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);

CREATE TABLE course (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	category_id INTEGER NOT NULL REFERENCES category(id)
);


CREATE TABLE student_course (
	student_id INTEGER NOT NULL REFERENCES student(id),
	course_id INTEGER NOT NULL REFERENCES course(id),
	PRIMARY KEY (student_id, course_id)
);

INSERT INTO category (nome) VALUES ('Front-end'), ('Programação'), ('Bancos de dados'), ('Data Science');
select * from student_course
INSERT INTO course (nome, category_id) VALUES
	('HTML', 1),
	('CSS', 1),
	('JS', 1),
	('PHP', 2),
	('Java', 2),
	('C++', 2),
	('PostgreSQL', 3),
	('MySQL', 3),
	('Oracle', 3),
	('SQL Server', 3),
	('SQLite', 3),
	('Pandas', 4),
	('Machine Learning', 4),
	('Power BI', 4);
	
INSERT INTO student_course VALUES (1, 4), (1, 11), (2, 1), (2, 2), (3, 4), (3, 3), (4, 4), (4, 6), (4, 5);

UPDATE category SET nome='Ciência de dados' WHERE id = 4; --mais fácil se não tem relacionamentos
select * from category;

select student.primeiro_nome, 
	   student.ultimo_nome,
	   --count(course.id) AS numero_cursos
	   count(student_course.course_id) AS numero_cursos
	from student
	join student_course ON student_course.student_id = student.id
	--join course ON course.id = student_course.course_id
	group by student.primeiro_nome, student.ultimo_nome
	order by numero_cursos DESC
	limit 1;
	
select course.nome,
	COUNT(student_course.student_id) as numero_alunos
	from course
	join student_course ON student_course.course_id = course_id
	group by course.nome
	order by numero_alunos DESC
	limit 1;
	