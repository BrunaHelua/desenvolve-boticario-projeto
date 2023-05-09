integer
real
serial
numeric

varchar(n)
char(n)
text

boolean

date
tim
timestamp

CREATE TABLE aluno (
	id SERIAL,
	nome VARCHAR(255),
	cpf char(11),
	observacao TEXT,
	idade integer,
	dinheiro NUMERIC(10, 2),
	altura REAL,
	ativo BOOLEAN,
	data_nascimento DATE,
	hora_aula TIME,
	matricula TIMESTAMP
);

SELECT * FROM aluno;
INSERT INTO aluno (
	nome, 
	cpf, 
	observacao,
	idade,
	dinheiro, 
	altura,
	ativo,
	data_nascimento,
	hora_aula,
	matricula
)
VALUES (
	'Bruna',
	'12345678901',
	'Lorem ipsum dolor sit amet, consectetur adipiscing 
	elit, sed do eiusmod tempor incididunt ut labore et 
	dolore magna aliqua' ,
	27,
	100.50,
	1.60,
	TRUE,
	'1995-07-18',
	'17:30:00',
	'2023-02-08 12:32:45'
);

SELECT id, nome, cpf FROM aluno;

UPDATE aluno
SET nome = 'Bruna Helua',
	cpf = '12332145666'
WHERE id = 2;

DELETE FROM aluno
WHERE nome = 'Bruna Helua'

INSERT INTO aluno (nome) VALUES ('Matheus D');
INSERT INTO aluno (nome) VALUES ('Matheus F');
INSERT INTO aluno (nome) VALUES ('Maria');
INSERT INTO aluno (nome) VALUES ('Ana');


SELECT id, nome AS "nominho curto" FROM aluno 
WHERE nome NOT LIKE '% %';

SELECT id, nome FROM aluno
WHERE ativo IS NULL;

SELECT nome FROM aluno
WHERE idade BETWEEN 10 AND 30;

SELECT id, nome FROM aluno
WHERE nome LIKE 'Ma%' AND id BETWEEN 2 AND 4;

SELECT id, nome FROM aluno
WHERE nome LIKE 'Ma%' OR id BETWEEN 2 AND 4;

DROP TABLE curso;

CREATE TABLE curso (
	id INTEGER PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);

INSERT INTO curso (id, nome) VALUES (1, 'html');
INSERT INTO curso (id, nome) VALUES  (3, 'devops');

SELECT * FROM curso;

drop table aluno;

create table aluno(
	id serial primary key,
	nome varchar(255) not null
);

INSERT INTO aluno (nome) VALUES ('Bruna H');
INSERT INTO aluno (nome) VALUES ('Matheus D');
INSERT INTO aluno (nome) VALUES ('Matheus F');
INSERT INTO aluno (nome) VALUES ('Maria');
INSERT INTO aluno (nome) VALUES ('Ana');
insert into aluno (nome) values ('Isabelle'); 

select * from aluno;

drop table aluno_curso;
create table aluno_curso(
	aluno_id integer,
	curso_id integer,
	primary key (aluno_id, curso_id),
	
	foreign key (aluno_id)
	references aluno (id),
	
	foreign key (curso_id)
	references curso (id)
); 

insert into aluno_curso (aluno_id, curso_id) values (1,1);
insert into aluno_curso (aluno_id, curso_id) values (2,1);

insert into aluno_curso (aluno_id, curso_id) values (7,1);


select * from aluno_curso;

select * from aluno;
select * from curso;

insert into aluno_curso (aluno_id, curso_id) VALUES (3,2);

insert into curso (id, nome) VALUES (4,'CSS');

select aluno.nome as aluno,
curso.nome as curso
from aluno
join aluno_curso ON aluno.id = aluno_curso.aluno_id
join curso ON curso.id = aluno_curso.curso_id;

select aluno.nome as aluno,
curso.nome as curso
from aluno
cross join curso

select aluno.nome as aluno,
curso.nome as curso
from aluno
full join aluno_curso ON aluno.id = aluno_curso.aluno_id
full join curso ON curso.id = aluno_curso.curso_id;

select aluno.nome as aluno,
curso.nome as curso
from aluno
LEFT join aluno_curso ON aluno.id = aluno_curso.aluno_id
LEFT join curso ON curso.id = aluno_curso.curso_id;

select * from curso;

drop table aluno_curso;
create table aluno_curso(
	aluno_id integer,
	curso_id integer,
	primary key (aluno_id, curso_id),
	
	foreign key (aluno_id)
	references aluno (id)
	on delete cascade,
	
	foreign key (curso_id)
	references curso (id)
);

insert into aluno_curso (aluno_id, curso_id) values (1,1);
insert into aluno_curso (aluno_id, curso_id) values (2,1);
insert into aluno_curso (aluno_id, curso_id) VALUES (3,2);
insert into aluno_curso (aluno_id, curso_id) VALUES (1,3);
insert into aluno_curso (aluno_id, curso_id) VALUES (3,1);

select * from aluno_curso;

delete from aluno where id = 1;

select * from aluno;

CREATE TABLE aluno_curso (
    aluno_id INTEGER,
        curso_id INTEGER,
        PRIMARY KEY (aluno_id, curso_id),

        FOREIGN KEY (aluno_id),
         REFERENCES aluno (id),
         ON DELETE CASCADE
         ON UPDATE CASCADE

        FOREIGN KEY (curso_id),
         REFERENCES curso (id)

);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1)
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1)

SELECT 
        aluno.id as aluno_id,
        aluno.nome as "Nome do Aluno",
        curso.id as "curso_id",
        curso.nome as "Nome do Curso"
    FROM aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    JOIN curso ON curso.id = aluno_curso.curso_id;