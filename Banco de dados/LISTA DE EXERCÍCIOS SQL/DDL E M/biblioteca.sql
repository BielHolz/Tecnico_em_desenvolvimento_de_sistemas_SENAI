CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE autores (
id_autor INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
nacionalidade VARCHAR(50)
);

CREATE TABLE livros (
id_livro INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(200) NOT NULL,
isbn VARCHAR(20) UNIQUE,
ano_publicacao YEAR,
categoria VARCHAR(50),
autor_id INT,
FOREIGN KEY (autor_id) REFERENCES autores(id_autor)
);

CREATE TABLE usuarios (
id_usuario INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
cpf VARCHAR(14) UNIQUE,
telefone VARCHAR(20),
data_cadastro DATE DEFAULT (CURRENT_DATE)
);

CREATE TABLE emprestimos (
id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
livro_id INT,
usuario_id INT,
data_emprestimo DATE,
data_devolucao_prevista DATE,
data_devolucao_real DATE,
status VARCHAR(20),
FOREIGN KEY (livro_id) REFERENCES livros (id_livro),
FOREIGN KEY (usuario_id) REFERENCES usuarios (id_usuario)
);

INSERT INTO autores (nome,nacionalidade) VALUES
('Machado de Assis','Brasileira'),
('Clarice Linspector','Brasileira'),
('George Orwell','Britânica');

INSERT INTO livros (titulo, isbn, ano_publicacao, categoria, autor_id) VALUES 
('Dom Casmurro', '978-8535908863', 1899, 'Romance', 1),
 ('A Hora da Estrela', '978-8520923948', 1977, 'Romance', 2),
('1984', '978-0451524935', 1949, 'Ficção', 3);

INSERT INTO usuarios (nome, cpf, telefone) VALUES
('José Silva', '123.456.789-00', '11987654321'), 
('Maria Oliveira', '234.567.890-11', '11876543210');

INSERT INTO emprestimos (livro_id, usuario_id, data_emprestimo, data_devolucao_prevista, status) VALUES 
(1, 1, '2025-10-01', '2025-10-15', 'Em andamento'),
(2, 2, '2025-10-05', '2025-10-19', 'Em andamento');

SELECT u.nome AS usuario, l.titulo AS livro, e.data_emprestimo, 
e.data_devolucao_prevista 
FROM emprestimos e 
JOIN usuarios u ON e.usuario_id = u.id_usuario 
JOIN livros l ON e.livro_id = l.id_livro 
WHERE e.status = 'Em andamento';

SELECT a.nome, COUNT(l.id_livro) AS total_livros 
FROM autores a 
LEFT JOIN livros l ON a.id_autor = l.autor_id 
GROUP BY a.nome;

SELECT u.nome, l.titulo, e.data_devolucao_prevista 
FROM emprestimos e JOIN usuarios u ON e.usuario_id = u.id_usuario 
JOIN livros l ON e.livro_id = l.id_livro 
WHERE e.data_devolucao_prevista < CURDATE() AND e.data_devolucao_real IS 
NULL;







