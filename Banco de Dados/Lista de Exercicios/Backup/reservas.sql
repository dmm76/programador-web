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


-- Copiando estrutura do banco de dados para reservas
CREATE DATABASE IF NOT EXISTS `reservas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `reservas`;

-- Copiando estrutura para tabela reservas.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela reservas.clientes: ~5 rows (aproximadamente)
INSERT INTO `clientes` (`idCliente`, `nome`, `telefone`) VALUES
	(1, 'Douglas Marcelo', '(44) 99901-1234'),
	(2, 'Jorge Matheus', '(44) 99999-4321'),
	(3, 'Marcelo Nascimento', '(44) 99988-7744'),
	(4, 'Carlos Doria', '(44) 99977-5585'),
	(5, 'Mathes Leme', '(44) 99958-8978');

-- Copiando estrutura para tabela reservas.quartos
CREATE TABLE IF NOT EXISTS `quartos` (
  `idQuarto` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `precoDiaria` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idQuarto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela reservas.quartos: ~6 rows (aproximadamente)
INSERT INTO `quartos` (`idQuarto`, `numero`, `tipo`, `precoDiaria`) VALUES
	(1, 1, 'quarto-simples', 156.90),
	(2, 2, 'quarto-simples', 156.90),
	(3, 6, 'quarto-simples', 156.90),
	(4, 5, 'suite-master', 356.90),
	(5, 3, 'quarto-duplo', 179.90),
	(6, 4, 'suite', 236.90);

-- Copiando estrutura para tabela reservas.reservas
CREATE TABLE IF NOT EXISTS `reservas` (
  `idReserva` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idQuarto` int(11) NOT NULL,
  `dataInicio` date NOT NULL,
  `dataFim` date DEFAULT NULL,
  PRIMARY KEY (`idReserva`),
  KEY `idCliente` (`idCliente`),
  KEY `idQuarto` (`idQuarto`),
  CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`idQuarto`) REFERENCES `quartos` (`idQuarto`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela reservas.reservas: ~5 rows (aproximadamente)
INSERT INTO `reservas` (`idReserva`, `idCliente`, `idQuarto`, `dataInicio`, `dataFim`) VALUES
	(1, 1, 6, '2025-07-23', '2025-07-25'),
	(2, 2, 4, '2025-07-23', '2025-07-25'),
	(3, 3, 5, '2025-07-23', '2025-07-25'),
	(4, 4, 2, '2025-07-23', '2025-07-25'),
	(5, 5, 3, '2025-07-23', '2025-07-25');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
