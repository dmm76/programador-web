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


-- Copiando estrutura do banco de dados para biblioteca
CREATE DATABASE IF NOT EXISTS `biblioteca` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `biblioteca`;

-- Copiando estrutura para tabela biblioteca.emprestimos
CREATE TABLE IF NOT EXISTS `emprestimos` (
  `idEmprestimo` int(11) NOT NULL AUTO_INCREMENT,
  `idLivro` int(11) NOT NULL,
  `idLeitor` int(11) NOT NULL,
  `dataEmprestimo` date NOT NULL,
  `dataDevolucao` date NOT NULL,
  PRIMARY KEY (`idEmprestimo`),
  KEY `idLivro` (`idLivro`),
  KEY `idLeitor` (`idLeitor`),
  CONSTRAINT `emprestimos_ibfk_1` FOREIGN KEY (`idLivro`) REFERENCES `livros` (`idLivro`),
  CONSTRAINT `emprestimos_ibfk_2` FOREIGN KEY (`idLeitor`) REFERENCES `leitores` (`idLeitor`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela biblioteca.emprestimos: ~6 rows (aproximadamente)
INSERT INTO `emprestimos` (`idEmprestimo`, `idLivro`, `idLeitor`, `dataEmprestimo`, `dataDevolucao`) VALUES
	(1, 1, 1, '2025-07-22', '2025-07-29'),
	(2, 5, 1, '2025-07-22', '2025-07-29'),
	(3, 2, 5, '2025-07-22', '2025-07-28'),
	(4, 3, 4, '2025-07-22', '2025-07-27'),
	(5, 4, 3, '2025-07-22', '2025-07-26'),
	(6, 5, 2, '2025-07-22', '2025-07-30');

-- Copiando estrutura para tabela biblioteca.leitores
CREATE TABLE IF NOT EXISTS `leitores` (
  `idLeitor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`idLeitor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela biblioteca.leitores: ~5 rows (aproximadamente)
INSERT INTO `leitores` (`idLeitor`, `nome`, `email`) VALUES
	(1, 'Ana Souza', 'ana.souza@example.com'),
	(2, 'Carlos Lima', 'carlos.lima@example.com'),
	(3, 'Juliana Pereira', 'juliana.pereira@example.com'),
	(4, 'Rafael Mendes', 'rafa.mendes@example.com'),
	(5, 'Beatriz Oliveira', 'bia.oliveira@example.com');

-- Copiando estrutura para tabela biblioteca.livros
CREATE TABLE IF NOT EXISTS `livros` (
  `idLivro` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `autor` varchar(100) NOT NULL,
  PRIMARY KEY (`idLivro`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela biblioteca.livros: ~5 rows (aproximadamente)
INSERT INTO `livros` (`idLivro`, `titulo`, `autor`) VALUES
	(1, 'Cem Anos de Solidão', 'Gabriel García Márquez'),
	(2, 'Dom Casmurro', 'Machado de Assis'),
	(3, '1984', 'George Orwell'),
	(4, 'O Senhor dos Anéis', 'J.R.R. Tolkien'),
	(5, 'Grande Sertão: Veredas', 'João Guimarães Rosa');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
