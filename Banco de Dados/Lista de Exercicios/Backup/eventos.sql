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


-- Copiando estrutura do banco de dados para eventos
CREATE DATABASE IF NOT EXISTS `eventos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `eventos`;

-- Copiando estrutura para tabela eventos.eventos
CREATE TABLE IF NOT EXISTS `eventos` (
  `idEvento` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `idOrganizador` int(11) NOT NULL,
  PRIMARY KEY (`idEvento`),
  KEY `idOrganizador` (`idOrganizador`),
  CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`idOrganizador`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela eventos.eventos: ~5 rows (aproximadamente)
INSERT INTO `eventos` (`idEvento`, `titulo`, `idOrganizador`) VALUES
	(1, 'Feira de Tecnologia 2025', 1),
	(2, 'Congresso de Medicina', 2),
	(3, 'Workshop de Marketing', 3),
	(4, 'Simpósio de Educação', 4),
	(5, 'Encontro de Startups', 5);

-- Copiando estrutura para tabela eventos.inscricoes
CREATE TABLE IF NOT EXISTS `inscricoes` (
  `idInscricao` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idEvento` int(11) NOT NULL,
  `dataInscricao` date NOT NULL,
  PRIMARY KEY (`idInscricao`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idEvento` (`idEvento`),
  CONSTRAINT `inscricoes_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  CONSTRAINT `inscricoes_ibfk_2` FOREIGN KEY (`idEvento`) REFERENCES `eventos` (`idEvento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela eventos.inscricoes: ~5 rows (aproximadamente)
INSERT INTO `inscricoes` (`idInscricao`, `idUsuario`, `idEvento`, `dataInscricao`) VALUES
	(1, 1, 2, '2025-07-01'),
	(2, 2, 3, '2025-07-02'),
	(3, 3, 1, '2025-07-03'),
	(4, 4, 5, '2025-07-04'),
	(5, 5, 4, '2025-07-05');

-- Copiando estrutura para tabela eventos.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela eventos.usuarios: ~5 rows (aproximadamente)
INSERT INTO `usuarios` (`idUsuario`, `nome`, `email`) VALUES
	(1, 'Carlos Silva', 'carlos@email.com'),
	(2, 'Mariana Souza', 'mariana@email.com'),
	(3, 'João Oliveira', 'joao@email.com'),
	(4, 'Ana Paula', 'ana@email.com'),
	(5, 'Ricardo Lima', 'ricardo@email.com');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
