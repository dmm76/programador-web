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


-- Copiando estrutura do banco de dados para clubeesportivo
CREATE DATABASE IF NOT EXISTS `clubeesportivo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `clubeesportivo`;

-- Copiando estrutura para tabela clubeesportivo.esportes
CREATE TABLE IF NOT EXISTS `esportes` (
  `idEsporte` int(11) NOT NULL AUTO_INCREMENT,
  `nomeEsporte` varchar(100) NOT NULL,
  `equipamentoNecessario` varchar(25) NOT NULL,
  PRIMARY KEY (`idEsporte`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela clubeesportivo.esportes: ~5 rows (aproximadamente)
INSERT INTO `esportes` (`idEsporte`, `nomeEsporte`, `equipamentoNecessario`) VALUES
	(1, 'Futebol', 'Bola e Chuteira'),
	(2, 'Voleibol', 'Bola de Volei'),
	(3, 'Basquetebol', 'Bola de Basquete'),
	(4, 'Futsal', 'Bola de Futsal'),
	(5, 'Boliche', 'Bola de Boliche');

-- Copiando estrutura para tabela clubeesportivo.inscricoes
CREATE TABLE IF NOT EXISTS `inscricoes` (
  `idInscricao` int(11) NOT NULL AUTO_INCREMENT,
  `idMembro` int(11) NOT NULL,
  `idEsporte` int(11) NOT NULL,
  `dataInscricao` date NOT NULL,
  PRIMARY KEY (`idInscricao`),
  KEY `fk_inscricoes_esporte` (`idEsporte`),
  KEY `fk_inscricoes_membros` (`idMembro`),
  CONSTRAINT `fk_inscricoes_esporte` FOREIGN KEY (`idEsporte`) REFERENCES `esportes` (`idEsporte`),
  CONSTRAINT `fk_inscricoes_membros` FOREIGN KEY (`idMembro`) REFERENCES `membros` (`idMembro`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela clubeesportivo.inscricoes: ~5 rows (aproximadamente)
INSERT INTO `inscricoes` (`idInscricao`, `idMembro`, `idEsporte`, `dataInscricao`) VALUES
	(1, 1, 1, '2025-07-23'),
	(2, 2, 1, '2025-07-10'),
	(3, 3, 3, '2025-06-05'),
	(4, 4, 4, '2025-06-22'),
	(5, 5, 5, '2025-07-12');

-- Copiando estrutura para tabela clubeesportivo.membros
CREATE TABLE IF NOT EXISTS `membros` (
  `idMembro` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `dataNascimento` date NOT NULL,
  PRIMARY KEY (`idMembro`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela clubeesportivo.membros: ~5 rows (aproximadamente)
INSERT INTO `membros` (`idMembro`, `nome`, `dataNascimento`) VALUES
	(1, 'Zico', '1950-05-13'),
	(2, 'Garrincha', '1952-10-21'),
	(3, 'Teobaldo', '1976-02-07'),
	(4, 'Zidane', '1970-01-10'),
	(5, 'Pele', '1930-07-22');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
