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


-- Copiando estrutura do banco de dados para BibliotecaEscolar
CREATE DATABASE IF NOT EXISTS `bibliotecaescolar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `BibliotecaEscolar`;

-- Copiando estrutura para tabela BibliotecaEscolar.alunos
CREATE TABLE IF NOT EXISTS `alunos` (
  `idAluno` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `serie` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`idAluno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela BibliotecaEscolar.alunos: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela BibliotecaEscolar.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela BibliotecaEscolar.categorias: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela BibliotecaEscolar.emprestimos
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela BibliotecaEscolar.emprestimos: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela BibliotecaEscolar.funcionarios
CREATE TABLE IF NOT EXISTS `funcionarios` (
  `idFuncionario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL DEFAULT '0',
  `funcao` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idFuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela BibliotecaEscolar.funcionarios: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela BibliotecaEscolar.livros
CREATE TABLE IF NOT EXISTS `livros` (
  `idLivro` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL DEFAULT '0',
  `autor` varchar(50) NOT NULL DEFAULT '0',
  `anoPublicacao` year(4) NOT NULL DEFAULT 2000,
  `idCategoria` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idLivro`),
  KEY `fk_livro_categoria` (`idCategoria`),
  CONSTRAINT `fk_livro_categoria` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela BibliotecaEscolar.livros: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
