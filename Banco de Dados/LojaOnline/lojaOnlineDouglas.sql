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


-- Copiando estrutura do banco de dados para lojaonline
CREATE DATABASE IF NOT EXISTS `lojaonline` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `lojaonline`;

-- Copiando estrutura para tabela lojaonline.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela lojaonline.categorias: ~10 rows (aproximadamente)
INSERT INTO `categorias` (`idCategoria`, `nome`) VALUES
	(1, 'Alimentos'),
	(2, 'Bebidas'),
	(3, 'Higiene'),
	(4, 'Limpeza'),
	(5, 'Utilidades'),
	(6, 'Alimentos'),
	(7, 'Bebidas'),
	(8, 'Higiene'),
	(9, 'Limpeza'),
	(10, 'Utilidades');

-- Copiando estrutura para tabela lojaonline.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '0',
  `telefone` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela lojaonline.clientes: ~0 rows (aproximadamente)
INSERT INTO `clientes` (`idCliente`, `nome`, `email`, `telefone`) VALUES
	(1, 'Carlos Silva', 'carlos.silva@email.com', '(44) 99999-1111'),
	(2, 'Fernanda Lopes', 'fernanda.lopes@email.com', '(44) 98888-2222'),
	(3, 'João Pedro', 'joao.pedro@email.com', '(44) 97777-3333'),
	(4, 'Mariana Dias', 'mariana.dias@email.com', '(44) 96666-4444'),
	(5, 'Paulo Henrique', 'paulo.henrique@email.com', '(44) 95555-5555'),
	(6, 'Carlos Silva', 'carlos.silva@email.com', '(44) 99999-1111'),
	(7, 'Fernanda Lopes', 'fernanda.lopes@email.com', '(44) 98888-2222'),
	(8, 'João Pedro', 'joao.pedro@email.com', '(44) 97777-3333'),
	(9, 'Mariana Dias', 'mariana.dias@email.com', '(44) 96666-4444'),
	(10, 'Paulo Henrique', 'paulo.henrique@email.com', '(44) 95555-5555');

-- Copiando estrutura para tabela lojaonline.itenspedido
CREATE TABLE IF NOT EXISTS `itenspedido` (
  `idItem` int(11) NOT NULL AUTO_INCREMENT,
  `idPedido` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  PRIMARY KEY (`idItem`),
  KEY `fk_itenspedido_pedido` (`idPedido`),
  KEY `fk_itenspedido_produto` (`idProduto`),
  CONSTRAINT `fk_itenspedido_pedido` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`idPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_itenspedido_produto` FOREIGN KEY (`idProduto`) REFERENCES `produtos` (`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela lojaonline.itenspedido: ~0 rows (aproximadamente)
INSERT INTO `itenspedido` (`idItem`, `idPedido`, `idProduto`, `quantidade`) VALUES
	(1, 1, 1, 2),
	(2, 2, 2, 3),
	(3, 3, 3, 5),
	(4, 4, 4, 1),
	(5, 5, 5, 4);

-- Copiando estrutura para tabela lojaonline.pedidos
CREATE TABLE IF NOT EXISTS `pedidos` (
  `idPedido` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `dataPedido` date NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_pedido_cliente` (`idCliente`),
  CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela lojaonline.pedidos: ~0 rows (aproximadamente)
INSERT INTO `pedidos` (`idPedido`, `idCliente`, `dataPedido`, `status`) VALUES
	(1, 1, '2025-07-15', 0),
	(2, 2, '2025-07-16', 0),
	(3, 3, '2025-07-17', 0),
	(4, 4, '2025-07-18', 0),
	(5, 5, '2025-07-19', 0);

-- Copiando estrutura para tabela lojaonline.produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `idProduto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` int(11) NOT NULL DEFAULT 0,
  `preco` int(11) NOT NULL DEFAULT 0,
  `estoque` int(11) NOT NULL DEFAULT 0,
  `idCategoria` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idProduto`),
  KEY `fk_produto_categoria` (`idCategoria`),
  CONSTRAINT `fk_produto_categoria` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela lojaonline.produtos: ~0 rows (aproximadamente)
INSERT INTO `produtos` (`idProduto`, `nome`, `preco`, `estoque`, `idCategoria`) VALUES
	(1, 0, 24, 100, 1),
	(2, 0, 8, 80, 2),
	(3, 0, 2, 200, 3),
	(4, 0, 3, 150, 4),
	(5, 0, 6, 75, 5),
	(6, 0, 24, 100, 1),
	(7, 0, 8, 80, 2),
	(8, 0, 2, 200, 3),
	(9, 0, 3, 150, 4),
	(10, 0, 6, 75, 5);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
