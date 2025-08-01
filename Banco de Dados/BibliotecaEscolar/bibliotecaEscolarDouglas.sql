-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para bibliotecaescolar
CREATE DATABASE IF NOT EXISTS `bibliotecaescolar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `bibliotecaescolar`;

-- Copiando estrutura para tabela bibliotecaescolar.alunos
CREATE TABLE IF NOT EXISTS `alunos` (
  `idAluno` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `serie` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`idAluno`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bibliotecaescolar.alunos: ~5 rows (aproximadamente)
INSERT INTO `alunos` (`idAluno`, `nome`, `serie`, `email`) VALUES
	(1, 'Ana Silva', '1º Ano', 'ana.silva@email.com'),
	(2, 'Bruno Costa', '2º Ano', 'bruno.costa@email.com'),
	(3, 'Carla Souza', '3º Ano', 'carla.souza@email.com'),
	(4, 'Diego Ramos', '1º Ano', 'diego.ramos@email.com'),
	(5, 'Eduarda Lima', '2º Ano', 'eduarda.lima@email.com');

-- Copiando estrutura para tabela bibliotecaescolar.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bibliotecaescolar.categorias: ~0 rows (aproximadamente)
INSERT INTO `categorias` (`idCategoria`, `nome`) VALUES
	(1, 'Romance'),
	(2, 'Ficção Científica'),
	(3, 'Biografia'),
	(4, 'História'),
	(5, 'Autoajuda'),
	(6, 'Romance'),
	(7, 'Ficção Científica'),
	(8, 'Biografia'),
	(9, 'História'),
	(10, 'Autoajuda'),
	(11, 'Romance'),
	(12, 'Ficção Científica'),
	(13, 'Biografia'),
	(14, 'História'),
	(15, 'Autoajuda');

-- Copiando estrutura para tabela bibliotecaescolar.emprestimos
CREATE TABLE IF NOT EXISTS `emprestimos` (
  `idEmprestimo` int(11) NOT NULL AUTO_INCREMENT,
  `idAluno` int(11) NOT NULL DEFAULT 0,
  `idLivro` int(11) NOT NULL DEFAULT 0,
  `dataEmprestimo` date NOT NULL,
  `dataDevolucao` date NOT NULL,
  PRIMARY KEY (`idEmprestimo`),
  KEY `fk_emprestimo_aluno` (`idAluno`),
  KEY `fk_emprestimo_livro` (`idLivro`),
  CONSTRAINT `fk_emprestimo_aluno` FOREIGN KEY (`idAluno`) REFERENCES `alunos` (`idAluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_emprestimo_livro` FOREIGN KEY (`idLivro`) REFERENCES `livros` (`idLivro`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bibliotecaescolar.emprestimos: ~0 rows (aproximadamente)
INSERT INTO `emprestimos` (`idEmprestimo`, `idAluno`, `idLivro`, `dataEmprestimo`, `dataDevolucao`) VALUES
	(1, 1, 2, '2025-07-01', '2025-07-15'),
	(2, 2, 4, '2025-07-05', '2025-07-20'),
	(3, 3, 1, '2025-07-07', '2025-07-21'),
	(4, 4, 5, '2025-07-10', '0000-00-00'),
	(5, 5, 3, '2025-07-11', '0000-00-00');

-- Copiando estrutura para tabela bibliotecaescolar.funcionarios
CREATE TABLE IF NOT EXISTS `funcionarios` (
  `idFuncionario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL DEFAULT '0',
  `funcao` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idFuncionario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bibliotecaescolar.funcionarios: ~0 rows (aproximadamente)
INSERT INTO `funcionarios` (`idFuncionario`, `nome`, `funcao`) VALUES
	(1, 'Fernanda Rocha', 'Bibliotecária'),
	(2, 'João Mendes', 'Auxiliar'),
	(3, 'Luciana Alves', 'Coordenadora'),
	(4, 'Ricardo Teixeira', 'Assistente'),
	(5, 'Patrícia Moraes', 'Atendente');

-- Copiando estrutura para tabela bibliotecaescolar.livros
CREATE TABLE IF NOT EXISTS `livros` (
  `idLivro` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL DEFAULT '0',
  `autor` varchar(50) NOT NULL DEFAULT '0',
  `anoPublicacao` year(4) NOT NULL DEFAULT 2000,
  `idCategoria` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idLivro`),
  KEY `fk_livro_categoria` (`idCategoria`),
  CONSTRAINT `fk_livro_categoria` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bibliotecaescolar.livros: ~0 rows (aproximadamente)
INSERT INTO `livros` (`idLivro`, `titulo`, `autor`, `anoPublicacao`, `idCategoria`) VALUES
	(1, 'Orgulho e Preconceito', 'Jane Austen', '0000', 1),
	(2, '1984', 'George Orwell', '1949', 2),
	(3, 'Steve Jobs', 'Walter Isaacson', '2011', 3),
	(4, 'Uma Breve História do Tempo', 'Stephen Hawking', '1988', 4),
	(5, 'O Poder do Hábito', 'Charles Duhigg', '2012', 5);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
