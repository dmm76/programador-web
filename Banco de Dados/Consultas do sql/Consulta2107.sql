
-- CREATE TABLE filmes(
-- 	idFilme INT PRIMARY KEY auto_increment NOT NULL,
-- 	nome VARCHAR(50),
-- 	dataLancamento DATE,
-- 	idProdutora INT,
-- 	FOREIGN	KEY (idProdutora) REFERENCES produtoras(idProdutora)	
-- );

-- DROP TABLE filmes;

-- CREATE TABLE produtoras(
-- 	idProdutora INT PRIMARY KEY	AUTO_INCREMENT NOT NULL,
-- 	nome VARCHAR(50)
-- );

-- CREATE DATABASE exemplo3;

-- 
-- CREATE TABLE jogos(
-- 	idJogo INT PRIMARY KEY auto_increment NOT NULL,
-- 	nome VARCHAR(50),
-- 	dataLancamento DATE,
-- 	idEstudio INT,
-- 	FOREIGN	KEY (idEstudio) REFERENCES Estudio(idEstudio)	
-- );

-- CREATE TABLE estudio(
-- idEstudio INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
-- nome VARCHAR(100) NOT NULL	
-- );

-- INSERT INTO jogos (nome, dataLancamento, idEstudio) VALUE ("Forza Horizon 5", 2025, 1);
-- INSERT INTO Estudio (nome) VALUE ("Rogue Snail");



-- INSERT INTO estudio (nome) VALUES
-- ('Nintendo'),
-- ('Rockstar Games'),
-- ('Electronic Arts'),
-- ('Ubisoft'),
-- ('Sony Interactive Entertainment'),
-- ('Bethesda Game Studios'),
-- ('CD Projekt Red');

-- INSERT INTO jogo (nome, dataLancamento, idEstudio) VALUES
-- -- Nintendo
-- ('The Legend of Zelda: Breath of the Wild', '2017-03-03', 1),
-- ('Super Mario Odyssey', '2017-10-27', 1),
-- 
-- -- Rockstar Games
-- ('Grand Theft Auto V', '2013-09-17', 2),
-- ('Red Dead Redemption 2', '2018-10-26', 2),
-- 
-- -- Electronic Arts
-- ('FIFA 23', '2022-09-30', 3),
-- ('The Sims 4', '2014-09-02', 3),
-- 
-- -- Ubisoft
-- ('Assassin''s Creed Valhalla', '2020-11-10', 4),
-- ('Far Cry 6', '2021-10-07', 4),
-- 
-- -- Sony
-- ('God of War Ragnarök', '2022-11-09', 5),
-- ('The Last of Us Part II', '2020-06-19', 5),
-- 
-- -- Bethesda
-- ('The Elder Scrolls V: Skyrim', '2011-11-11', 6),
-- ('Fallout 4', '2015-11-10', 6),
-- 
-- -- CD Projekt Red
-- ('The Witcher 3: Wild Hunt', '2015-05-19', 7),
-- ('Cyberpunk 2077', '2020-12-10', 7);
-- 
-- 
-- select * from jogos;

-- INSERT INTO produtoras (nome) VALUES ("FOX S/A");

-- INSERT INTO filmes (nome, dataLancamento, idProdutora) VALUES ("A volta daqueles que não foram", "2025-12-01", 1);

-- DELETE FROM produtoras WHERE idProdutora = 2;
-- 
-- UPDATE filmes SET dataLancamento = "2026-01-10" WHERE idFilme = 1;



-- CREATE DATABASE eventos;

-- CREATE TABLE usuarios (
-- 	idUsuario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
-- 	nome VARCHAR(100) NOT NULL,
-- 	email VARCHAR(100) NOT NULL
-- );


-- CREATE TABLE eventos (
-- 	idEvento INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
-- 	titulo VARCHAR(100) NOT NULL,
-- 	idOrganizador INT NOT NULL,
-- 	FOREIGN	KEY (idOrganizador) REFERENCES usuarios(idUsuario)	
-- );


-- CREATE TABLE inscricoes (
-- 	idInscricao INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
-- 	idUsuario INT NOT NULL,
-- 	idEvento INT NOT NULL,
-- 	dataInscricao DATE NOT NULL,
-- 	FOREIGN	KEY (idUsuario) REFERENCES usuarios(idUsuario),	
-- 	FOREIGN	KEY (idEvento) REFERENCES eventos(idEvento)usuariosinscricoes
-- );

-- INSERT INTO livros (titulo, autor) VALUES	("Cem Anos de Solidão", "Gabriel García Márquez");
-- INSERT INTO livros (titulo, autor) VALUES	("Dom Casmurro", "Machado de Assis");
-- INSERT INTO livros (titulo, autor) VALUES	("1984", "George Orwell");
-- INSERT INTO livros (titulo, autor) VALUES	("O Senhor dos Anéis", "J.R.R. Tolkien");
-- INSERT INTO livros (titulo, autor) VALUES	("Grande Sertão: Veredas", "João Guimarães Rosa");
-- 
-- INSERT INTO leitores (nome, email) VALUES	("Ana Souza", "ana.souza@example.com");
-- INSERT INTO leitores (nome, email) VALUES	("Carlos Lima", "carlos.lima@example.com");
-- INSERT INTO leitores (nome, email) VALUES	("Juliana Pereira", "juliana.pereira@example.com");
-- INSERT INTO leitores (nome, email) VALUES	("Rafael Mendes", "rafa.mendes@example.com");
-- INSERT INTO leitores (nome, email) VALUES	("Beatriz Oliveira", "bia.oliveira@example.com");

-- INSERT INTO leitores (nome, email) VALUES	("Beatriz Oliveira", "bia.oliveira@example.com");
-- 
-- ALTER TABLE emprestimos ADD COLUMN dataDevolucao DATE NOT NULL;

-- 
-- INSERT INTO emprestimos (idLivro, idLeitor, dataEmprestimo, dataDevolucao) VALUES	(5, 1, "2025-07-22", "2025-07-29");
-- INSERT INTO emprestimos (idLivro, idLeitor, dataEmprestimo, dataDevolucao) VALUES	(2, 5, "2025-07-22", "2025-07-28");
-- INSERT INTO emprestimos (idLivro, idLeitor, dataEmprestimo, dataDevolucao) VALUES	(3, 4, "2025-07-22", "2025-07-27");
-- INSERT INTO emprestimos (idLivro, idLeitor, dataEmprestimo, dataDevolucao) VALUES	(4, 3, "2025-07-22", "2025-07-26");
-- INSERT INTO emprestimos (idLivro, idLeitor, dataEmprestimo, dataDevolucao) VALUES	(5, 2, "2025-07-22", "2025-07-30");

-- SELECT * FROM emprestimos;
-- 
-- SELECT le.nome AS Leitor, li.titulo AS Titulo_Livro, e.dataEmprestimo AS Data_Empréstimo, e.dataDevolucao AS Data_Devolução
-- FROM livros li
-- INNER JOIN emprestimos e ON li.idLivro = e.idLivro
-- INNER	JOIN leitores le ON le.idLeitor = e.idLeitor
-- ORDER BY le.nome desc; 

-- INSERT INTO usuarios (nome, email) VALUES 
-- ('Carlos Silva', 'carlos@email.com'),
-- ('Mariana Souza', 'mariana@email.com'),
-- ('João Oliveira', 'joao@email.com'),
-- ('Ana Paula', 'ana@email.com'),
-- ('Ricardo Lima', 'ricardo@email.com');
-- 
-- INSERT INTO eventos (titulo, idOrganizador) VALUES 
-- ('Feira de Tecnologia 2025', 1),
-- ('Congresso de Medicina', 2),
-- ('Workshop de Marketing', 3),
-- ('Simpósio de Educação', 4),
-- ('Encontro de Startups', 5);
-- 
-- INSERT INTO inscricoes (idUsuario, idEvento, dataInscricao) VALUES 
-- (1, 2, '2025-07-01'),
-- (2, 3, '2025-07-02'),
-- (3, 1, '2025-07-03'),
-- (4, 5, '2025-07-04'),
-- (5, 4, '2025-07-05');
-- 

-- CREATE DATABASE restaurante;

-- CREATE TABLE funcionarios (
-- 	idFuncionario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
-- 	nome VARCHAR(100) NOT NULL,
-- 	cargo VARCHAR(100) NOT NULL	
-- );
-- 

-- CREATE TABLE mesas(
-- 	idMesa INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
-- 	numero INT NOT NULL,
-- 	capacidade INT NOT NULL,
-- 	idFuncionario INT NOT NULL,
-- 	FOREIGN KEY (idFuncionario) REFERENCES	funcionarios(idFuncionario)
-- );

-- CREATE TABLE pedidos(
-- 	idPedido INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
-- 	idMesa INT NOT NULL,
-- 	dataPedido DATE NOT NULL,
-- 	detalhes VARCHAR(100),
-- 	FOREIGN KEY (idMesa) REFERENCES mesas(idMesa)
-- );
-- 

-- INSERT INTO funcionarios (nome, cargo) VALUES ("Maria Jose", "Garçom");
-- INSERT INTO funcionarios (nome, cargo) VALUES ("Edson Carlos", "Cozinheiro");
-- INSERT INTO funcionarios (nome, cargo) VALUES ("Mauricio de Oliveiro", "Copeiro");
-- INSERT INTO funcionarios (nome, cargo) VALUES ("Pedro Paulo", "Caixa");

-- INSERT INTO mesas (numero, capacidade, idFuncionario) VALUES (2, 5, 1);
-- INSERT INTO mesas (numero, capacidade, idFuncionario) VALUES (3, 6, 2);
-- INSERT INTO mesas (numero, capacidade, idFuncionario) VALUES (4, 4, 1);
-- INSERT INTO mesas (numero, capacidade, idFuncionario) VALUES (5, 2, 2);

-- INSERT INTO pedidos (idMesa, dataPedido, Detalhes) VALUES (4, "2025-07-23", "Bife Completo");
-- INSERT INTO pedidos (idMesa, dataPedido, Detalhes) VALUES (5, "2025-07-23", "Bife Completo");
-- INSERT INTO pedidos (idMesa, dataPedido, Detalhes) VALUES (6, "2025-07-23", "Bife Completo");
-- INSERT INTO pedidos (idMesa, dataPedido, Detalhes) VALUES (7, "2025-07-23", "Bife Completo");

-- CREATE DATABASE reservas;

-- CREATE TABLE clientes(
-- 	idCliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
-- 	nome VARCHAR(100) NOT NULL,
-- 	telefone VARCHAR(20) NOT null
-- );

-- CREATE TABLE quartos(
-- 	idQuarto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
-- 	numero int NOT NULL,
-- 	tipo VARCHAR(50) NOT NULL,
-- 	precoDiaria DECIMAL (10,2) NOT null
-- );

-- CREATE TABLE reservas(
-- 	idReserva INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
-- 	idCliente INT NOT NULL,
-- 	idQuarto INT NOT NULL,
-- 	dataInicio DATE NOT NULL,
-- 	dataFim DATE,
-- 	FOREIGN KEY (idCliente) REFERENCES clientes(idCliente),
-- 	FOREIGN KEY (idQuarto) REFERENCES	quartos(idQuarto)	
-- );
-- 

-- INSERT INTO clientes (nome, telefone) VALUES ("Douglas Marcelo", "(44) 99901-1234");
-- INSERT INTO clientes (nome, telefone) VALUES ("Jorge Matheus", "(44) 99999-4321");
-- INSERT INTO clientes (nome, telefone) VALUES ("Marcelo Nascimento", "(44) 99988-7744");
-- INSERT INTO clientes (nome, telefone) VALUES ("Carlos Doria", "(44) 99977-5585");
-- INSERT INTO clientes (nome, telefone) VALUES ("Mathes Leme", "(44) 99958-8978");

-- INSERT INTO quartos (numero, tipo, precoDiaria) VALUES (6, "quarto-simples", 156.90);
-- INSERT INTO quartos (numero, tipo, precoDiaria) VALUES (3, "quarto-duplo", 179.90);
-- INSERT INTO quartos (numero, tipo, precoDiaria) VALUES (4, "suite", 236.90);
-- INSERT INTO quartos (numero, tipo, precoDiaria) VALUES (5, "suite-master", 356.90);

-- INSERT INTO reservas (idCliente, idQuarto, dataInicio, dataFim) VALUES (2, 4, "2025-07-23", "2025-07-25");
--  INSERT INTO reservas (idCliente, idQuarto, dataInicio, dataFim) VALUES (3, 5, "2025-07-23", "2025-07-25");
-- INSERT INTO reservas (idCliente, idQuarto, dataInicio, dataFim) VALUES (4, 2, "2025-07-23", "2025-07-25");
-- INSERT INTO reservas (idCliente, idQuarto, dataInicio, dataFim) VALUES (5, 3, "2025-07-23", "2025-07-25");
-- 

-- CREATE DATABASE clubeEsportivo;
-- 
-- CREATE TABLE membros(
-- 	idMembro INT PRIMARY	KEY NOT NULL AUTO_INCREMENT,
-- 	nome VARCHAR(100) NOT NULL,
-- 	dataNascimento DATE NOT null
-- );
-- 
-- CREATE TABLE esportes(
-- 	idEsporte INT PRIMARY	KEY NOT NULL AUTO_INCREMENT,
-- 	nomeEsporte VARCHAR(100) NOT NULL,
-- 	equipamentoNecessario VARCHAR(25) NOT null
-- );
-- 
-- 
-- CREATE TABLE inscricoes(
-- 	idInscricao INT PRIMARY	KEY NOT NULL AUTO_INCREMENT,
-- 	idMembro INT NOT NULL,
-- 	idEsporte INT NOT NULL,	
-- 	dataInscricao DATE NOT null
-- );
-- 
-- ALTER TABLE inscricoes
-- ADD CONSTRAINT fk_inscricoes_esporte
-- FOREIGN KEY (idEsporte) REFERENCES esportes(idEsporte);
-- 
-- ALTER TABLE inscricoes
-- ADD CONSTRAINT fk_inscricoes_membros
-- FOREIGN KEY (idMembro) REFERENCES membros(idMembro);

-- INSERT INTO membros (nome, dataNascimento) VALUES	("Zico", "1950-05-13");
-- INSERT INTO membros (nome, dataNascimento) VALUES	("Garrincha", "1952-10-21");
-- INSERT INTO membros (nome, dataNascimento) VALUES	("Teobaldo", "1976-02-07");
-- INSERT INTO membros (nome, dataNascimento) VALUES	("Zidane", "1970-01-10");
-- INSERT INTO membros (nome, dataNascimento) VALUES	("Pele", "1930-07-22");



-- INSERT INTO esportes (nomeEsporte, equipamentoNecessario) VALUES	("Futebol","Bola e Chuteira");
-- INSERT INTO esportes (nomeEsporte, equipamentoNecessario) VALUES	("Voleibol","Bola de Volei");
-- INSERT INTO esportes (nomeEsporte, equipamentoNecessario) VALUES	("Basquetebol","Bola de Basquete");
-- INSERT INTO esportes (nomeEsporte, equipamentoNecessario) VALUES	("Futsal","Bola de Futsal");
-- INSERT INTO esportes (nomeEsporte, equipamentoNecessario) VALUES	("Boliche","Bola de Boliche");


-- INSERT INTO inscricoes (idMembro, idEsporte, dataInscricao) VALUES	(1, 1, "2025-07-23");
-- INSERT INTO inscricoes (idMembro, idEsporte, dataInscricao) VALUES	(2, 1, "2025-07-10");
-- INSERT INTO inscricoes (idMembro, idEsporte, dataInscricao) VALUES	(3, 3, "2025-06-05");
-- INSERT INTO inscricoes (idMembro, idEsporte, dataInscricao) VALUES	(4, 4, "2025-06-22");
-- INSERT INTO inscricoes (idMembro, idEsporte, dataInscricao) VALUES	(5, 5, "2025-07-12");