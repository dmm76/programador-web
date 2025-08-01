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


-- Copiando estrutura do banco de dados para restaurante
CREATE DATABASE IF NOT EXISTS `restaurante` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `restaurante`;

-- Copiando estrutura para tabela restaurante.funcionarios
CREATE TABLE IF NOT EXISTS `funcionarios` (
  `idFuncionario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  PRIMARY KEY (`idFuncionario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela restaurante.funcionarios: ~6 rows (aproximadamente)
INSERT INTO `funcionarios` (`idFuncionario`, `nome`, `cargo`) VALUES
	(1, 'João Carlos', 'Garçom'),
	(2, 'Maria Jose', 'Garçom'),
	(3, 'Maria Jose', 'Garçom'),
	(4, 'Edson Carlos', 'Cozinheiro'),
	(5, 'Mauricio de Oliveiro', 'Copeiro'),
	(6, 'Pedro Paulo', 'Caixa');

-- Copiando estrutura para tabela restaurante.mesas
CREATE TABLE IF NOT EXISTS `mesas` (
  `idMesa` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `capacidade` int(11) NOT NULL,
  `idFuncionario` int(11) NOT NULL,
  PRIMARY KEY (`idMesa`),
  KEY `idFuncionario` (`idFuncionario`),
  CONSTRAINT `mesas_ibfk_1` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionarios` (`idFuncionario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela restaurante.mesas: ~5 rows (aproximadamente)
INSERT INTO `mesas` (`idMesa`, `numero`, `capacidade`, `idFuncionario`) VALUES
	(3, 1, 5, 1),
	(4, 2, 5, 1),
	(5, 3, 6, 2),
	(6, 4, 4, 1),
	(7, 5, 2, 2);

-- Copiando estrutura para tabela restaurante.pedidos
CREATE TABLE IF NOT EXISTS `pedidos` (
  `idPedido` int(11) NOT NULL AUTO_INCREMENT,
  `idMesa` int(11) NOT NULL,
  `dataPedido` date NOT NULL,
  `detalhes` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `idMesa` (`idMesa`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`idMesa`) REFERENCES `mesas` (`idMesa`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela restaurante.pedidos: ~5 rows (aproximadamente)
INSERT INTO `pedidos` (`idPedido`, `idMesa`, `dataPedido`, `detalhes`) VALUES
	(3, 3, '2025-07-23', 'Bife Completo'),
	(4, 4, '2025-07-23', 'Bife Completo'),
	(5, 5, '2025-07-23', 'Bife Completo'),
	(6, 6, '2025-07-23', 'Bife Completo'),
	(7, 7, '2025-07-23', 'Bife Completo');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
