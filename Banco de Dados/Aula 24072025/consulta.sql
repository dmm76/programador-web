-- CREATE DATABASE banco001;
-- USE banco001;
-- CREATE TABLE pedidos(
-- idPedido INT PRIMARY KEY AUTO_INCREMENT,
-- nomeCliente VARCHAR(100),
-- valor DECIMAL(10,2),
-- qtde INT);

-- INSERT INTO pedidos(nomeCliente, valor, qtde) VALUES
-- ("Paulo", 2000.30, 200),
-- ("Pedro", 2099.00, 23),
-- ("Murilo", 150.00, 50),
-- ("Bruno", 50.00, 1),
-- ("Antonia", 2450.00, 1),
-- ("Reuel", 240.90, 3),
-- ("Marculino", 752.65, 152),
-- ("Júlia", 234.00, 350);

-- SELECT * FROM pedidos;

-- SELECT ROUND(AVG(valor),2) AS "Média Valores" FROM pedidos;

-- ELECT MIN(valor) AS "Menor Valor", MAX(valor) AS "Maior Valor" FROM pedidos;

-- SELECT SUM(valor) AS "Total Pedido" FROM pedidos;

-- SELECT * FROM pedidos WHERE nomeCliente LIKE "P%";

-- SELECT ROUND(AVG(qtde),2) AS "Média Qtde" FROM pedidos;

-- CREATE DATABASE gravadora;
-- USE gravadora;
-- CREATE TABLE cds(
-- idCd INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
-- nome VARCHAR(45) NOT NULL,
-- dataCompra DATE NOT NULL,
-- valorPago DECIMAL(10,2),
-- localCompra VARCHAR(45)
-- );

-- CREATE TABLE musicas(
-- idMusica INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
-- idCd INT NOT NULL,
-- nome VARCHAR(45) NOT NULL,
-- artista VARCHAR(45),
-- tempo TIME,
-- FOREIGN KEY (idCd) REFERENCES cds(idCd)
-- );

-- INSERT INTO cds (nome, dataCompra, valorPago, localCompra) VALUES
-- ('CD do Queen', '2025-07-20', 59.90, 'Amazon'),
-- ('CD do Nirvana', '2025-07-21', 49.90, 'Submarino'),
-- ('CD do Metallica', '2025-07-22', 39.90, 'Saraiva'),
-- ('CD do Pink Floyd', '2025-07-23', 69.90, 'Fnac'),
-- ('CD do Led Zeppelin', '2025-07-24', 44.90, 'Americanas');


-- INSERT INTO musicas (idCd, nome, artista, tempo) VALUES
-- (1, 'Bohemian Rhapsody', 'Queen', '05:55'),
-- (1, 'Don’t Stop Me Now', 'Queen', '03:29'),
-- 
-- (2, 'Smells Like Teen Spirit', 'Nirvana', '05:01'),
-- (2, 'Come As You Are', 'Nirvana', '03:39'),
-- 
-- (3, 'Enter Sandman', 'Metallica', '05:32'),
-- (3, 'Nothing Else Matters', 'Metallica', '06:28'),

(4, 'Comfortably Numb', 'Pink Floyd', '06:22'),
(4, 'Wish You Were Here', 'Pink Floyd', '05:34'),

(5, 'Stairway to Heaven', 'Led Zeppelin', '08:02'),
(5, 'Kashmir', 'Led Zeppelin', '08:37');