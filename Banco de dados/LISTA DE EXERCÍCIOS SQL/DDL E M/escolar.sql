CREATE DATABASE sistema_escolar;
USE sistema_escolar;

CREATE TABLE alunos (
matricula INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
sobrenome VARCHAR(100) NOT NULL,
data_nascimento DATE,
cpf VARCHAR(14) UNIQUE,
email VARCHAR(100),
ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE cursos (
id_curso INT AUTO_INCREMENT PRIMARY KEY,
nome_curso VARCHAR(100) NOT NULL,
carga_horaria INT,
valor DECIMAL(10,2),
nivel VARCHAR(50)
);

CREATE TABLE matriculas (
id_matricula INT AUTO_INCREMENT PRIMARY KEY,
aluno_matricula INT,
curso_id INT,
data_matricula DATE,
status VARCHAR(20)
);

ALTER TABLE alunos ADD COLUMN telefone VARCHAR(20);
ALTER TABLE alunos ADD COLUMN endereco VARCHAR(200);
ALTER TABLE cursos ADD COLUMN professor_responsavel VARCHAR(100);
ALTER TABLE cursos ADD COLUMN turno VARCHAR(20);

ALTER TABLE alunos MODIFY COLUMN nome VARCHAR(150) NOT NULL;
ALTER TABLE cursos MODIFY COLUMN valor DECIMAL(12,2);
ALTER TABLE alunos CHANGE COLUMN telefone telefone_celular VARCHAR(20);
 
 ALTER TABLE matriculas
 ADD CONSTRAINT fk_aluno
 FOREIGN KEY (aluno_matricula) REFERENCES alunos(matricula);
 
 ALTER TABLE matriculas
 ADD CONSTRAINT fk_curso
 FOREIGN KEY (curso_id) REFERENCES cursos(id_curso);
 
 ALTER TABLE alunos ADD CONSTRAINT chk_email CHECK (email LIKE '%@%');
 ALTER TABLE cursos ADD CONSTRAINT chk_carga CHECK (carga_horaria >0);
 ALTER TABLE cursos ADD CONSTRAINT unique_nome UNIQUE (nome_curso);
 
CREATE TABLE tabela_teste (
id INT PRIMARY KEY,
descricao VARCHAR(50)
);

DROP TABLE IF EXISTS tabela_teste;

CREATE TABLE tabela_teste (id INT, descricao VARCHAR(50));
INSERT INTO tabela_teste VALUES (1,'teste');
TRUNCATE TABLE tabela_teste;

INSERT INTO alunos (nome,sobrenome,data_nascimento,cpf,email,ativo)
VALUES ('João','Silva','2000-05-15','111.222.333-44','joao@email.com',TRUE);

INSERT INTO alunos VALUES
(NULL,'Maria','Santos','1999-08-20','222.333.444-55','maria@email.com',TRUE,'11987654321','Rua A, 123');

INSERT INTO cursos (nome_curso,carga_horaria,valor,nivel)VALUES
('Python Básico',40,500.00,'iniciante'),
('Banco de Dados',60, 800.00,'intermediário'),
('Java Avançado',80,1200.00,'Avançado'),
('Web Design',50,600.00,'iniciante');

INSERT INTO alunos (nome, sobrenome, data_nascimento, cpf, email) VALUES
 ('Carlos', 'Oliveira', '2001-03-10', '333.444.555-66', 'carlos@email.com'), 
 ('Ana', 'Costa', '1998-12-05', '444.555.666-77', 'ana@email.com'), 
 ('Pedro', 'Almeida', '2002-07-22', '555.666.777-88', 'pedro@email.com'), 
 ('Julia', 'Ferreira', '2000-11-30', '666.777.888-99', 'julia@email.com'),
 ('Lucas', 'Souza', '1999-04-18', '777.888.999-00', 'lucas@email.com'),
 ('Lara', 'Soares', '2009-08-05', '163.399.199-79', 'lararauffmann@email.com'),
 ('Gabriel', 'Holz', '2009-07-22', '109.672.770-40', 'gabrielholz@email.com'),
 ('Adrian', 'Holz', '2008-06-06', '178.234.543-87', 'adrianholz@email.com'),
 ('Bryan', 'Ferrari', '2008-09-12', '627.178.671-45', 'bryanferrari@email.com'),
 ('Iago', 'Pereira', '2000-10-01', '672.467.865-48', 'iagopereira@email.com');
 
INSERT INTO matriculas(aluno_matricula,curso_id,data_matricula,status)VALUES
(1,1,'2025-01-10','Ativo'),
(2,2,'2025-01-15','Ativo'),
(3,1,'2025-02-01','Ativo'),
(4,3,'2025-02-05','Ativo'),
(5,4,'2025-02-10','Ativo');

SELECT*FROM alunos;

SELECT nome,sobrenome,email FROM alunos WHERE ativo = TRUE;

SELECT nome_curso,carga_horaria,valor FROM cursos WHERE carga_horaria>50;

SELECT nome,sobrenome,data_nascimento FROM alunos WHERE data_nascimento>'2000-01-01';

SELECT * FROM cursos WHERE valor BETWEEN 500 AND 900;

SELECT * FROM alunos WHERE nome LIKE'A%';

SELECT * FROM alunos WHERE sobrenome LIKE'%Silva';

SELECT * FROM cursos WHERE nivel IN ('iniciante','intermediario');

SELECT * FROM alunos WHERE telefone_celular IS NULL;

SELECT * FROM alunos ORDER BY nome ASC, sobrenome ASC;

SELECT nome_curso, valor FROM cursos ORDER BY valor DESC;
 
SELECT nome_curso, valor FROM cursos ORDER BY valor DESC LIMIT 3;

SELECT DISTINCT nivel FROM cursos;

SELECT COUNT(*) AS total_alunos FROM alunos;

SELECT COUNT(*) AS alunos_ativos FROM alunos WHERE ativo = TRUE;

SELECT AVG(VALOR) AS media_preco FROM cursos;

SELECT MAX(carga_horaria) AS maior_carga,MIN(carga_horaria) AS menor_carga FROM cursos;

SELECT SUM(carga_horaria) AS carga_total FROM cursos;

SELECT nivel,COUNT(*) AS quantidade FROM cursos GROUP BY nivel;

SELECT nivel, AVG(valor) AS valor_medio FROM cursos GROUP BY nivel;

SELECT status, COUNT(*) AS total FROM matriculas GROUP BY status;

SELECT nivel, COUNT(*) AS quantidade
FROM cursos
GROUP BY nivel
HAVING COUNT(*)>1;

UPDATE alunos SET telefone_celular = '11999887766' WHERE matricula = 1;

UPDATE cursos SET valor = valor * 1.10 WHERE nivel = 'iniciante';

UPDATE alunos
SET endereco = 'Rua Nova, 456',email='novoemail@email.com'
WHERE matricula = 2;

UPDATE alunos SET ativo = FALSE WHERE email IS NULL;

UPDATE matriculas
SET status = 'Prioridade'
WHERE curso_id = (SELECT id_curso FROM cursos ORDER BY valor DESC LIMIT 1);

DELETE FROM alunos WHERE ativo = FALSE;

DELETE FROM cursos WHERE valor>2000;

DELETE FROM matriculas WHERE status = 'Cancelado';





