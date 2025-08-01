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


-- Copiando estrutura do banco de dados para exemplo1
CREATE DATABASE IF NOT EXISTS `exemplo1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `exemplo1`;

-- Copiando estrutura para tabela exemplo1.produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `idProduto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `preco` decimal(10,2) NOT NULL DEFAULT 0.00,
  `quantidade` int(11) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela exemplo1.produtos: ~10 rows (aproximadamente)
INSERT INTO `produtos` (`idProduto`, `nome`, `descricao`, `preco`, `quantidade`, `categoria`) VALUES
	(1, 'banana prata', 'banana prata kg', 5.63, 1000, 'frutas'),
	(2, 'mamão papaya', 'mamão papaya unidade', 6.89, 1000, 'frutas'),
	(3, 'maça importada', 'maça argentina', 8.98, 1000, 'frutas'),
	(4, 'tangerina', 'tangerina', 6.99, 1000, 'frutas'),
	(5, 'ponca', 'ponca grande', 5.99, 1000, 'frutas'),
	(6, 'uva', 'uva da região', 8.99, 1000, 'frutas'),
	(7, 'alface americana', 'alface americana', 5.66, 500, 'verduras'),
	(8, 'rúcula', 'rúcula', 6.55, 500, 'verduras'),
	(9, 'repolho manteiga', 'repolho manteiga', 4.56, 500, 'verduras'),
	(10, 'tomate italiano', 'tomate italiano', 9.87, 500, 'frutas');

-- Copiando estrutura para tabela exemplo1.unidades
CREATE TABLE IF NOT EXISTS `unidades` (
  `idUnidade` int(11) NOT NULL AUTO_INCREMENT,
  `razaoSocial` varchar(50) NOT NULL,
  `cnpj` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL DEFAULT '',
  `endereco` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`idUnidade`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela exemplo1.unidades: ~1 rows (aproximadamente)
INSERT INTO `unidades` (`idUnidade`, `razaoSocial`, `cnpj`, `tipo`, `cidade`, `endereco`) VALUES
	(1, 'Mercadinho Borba Gato Maringa', '321.654.987/0001-89', 'matriz', 'Maringá', 'Rua dos Jerânios, 234');

-- Copiando estrutura para tabela exemplo1.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL DEFAULT '0',
  `cpf` varchar(100) DEFAULT '0',
  `cnpj` varchar(100) DEFAULT '0',
  `tipo` varchar(100) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '0',
  `senha` varchar(30) NOT NULL DEFAULT '0',
  `endereco` varchar(100) NOT NULL DEFAULT '0',
  `telefone` varchar(25) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela exemplo1.usuarios: ~5 rows (aproximadamente)
INSERT INTO `usuarios` (`idCliente`, `nome`, `cpf`, `cnpj`, `tipo`, `email`, `senha`, `endereco`, `telefone`) VALUES
	(1, 'Paulo Jose Braga', '025.568.781-98', '0', 'pf', 'paulojose@gmail.com', '1234', 'Rua Esmeralda, 345', '44  3225-5623'),
	(2, 'José Claudio Tupion', '321.654.987-56', '0', 'pf', 'joseClaudio22@gmail.com', '1234', 'Rua da Graça, 369', '44 3265-7894'),
	(3, 'Maria Carla Lipe', '011.011.011-99', '0', 'pf', 'maria_lipe@gmail.com', '1234', 'Rua dos Jasmins, 21', '44 9632-4567'),
	(4, 'Josué Carlos Permuta', '055.655.566-25', '0', 'pf', 'josue@uol.com.br', '1234', 'Avenda Herval, 456', '44 9874-5623'),
	(5, 'Hendreus Fila Bolo', '258.258.258-89', '0', 'pf', 'filabolo@gmail.com', '4231', 'Avenida Colombo, 654', '44 9587-5656');

-- Copiando estrutura para tabela exemplo1.usuarios_agora_nao
CREATE TABLE IF NOT EXISTS `usuarios_agora_nao` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nomeUsuario` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `senha` varchar(30) NOT NULL DEFAULT '',
  `endereco` varchar(255) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela exemplo1.usuarios_agora_nao: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela exemplo1.vendas
CREATE TABLE IF NOT EXISTS `vendas` (
  `idVenda` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idVendedor` int(11) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`idVenda`) USING BTREE,
  KEY `id_compra_vendedor` (`idVendedor`),
  KEY `FK_vendas_usuarios` (`idCliente`),
  CONSTRAINT `FK_vendas_usuarios` FOREIGN KEY (`idCliente`) REFERENCES `usuarios` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_compra_vendedor` FOREIGN KEY (`idVendedor`) REFERENCES `vendedores` (`idvendedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela exemplo1.vendas: ~5 rows (aproximadamente)
INSERT INTO `vendas` (`idVenda`, `idCliente`, `idVendedor`, `data`) VALUES
	(1, 1, 5, '2025-07-18'),
	(2, 3, 4, '2025-07-18'),
	(3, 5, 4, '2025-07-18'),
	(4, 4, 5, '2025-07-18'),
	(5, 2, 1, '2025-07-18');

-- Copiando estrutura para tabela exemplo1.venda_produtos
CREATE TABLE IF NOT EXISTS `venda_produtos` (
  `idVendaProdutos` int(11) NOT NULL AUTO_INCREMENT,
  `idVenda` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `quantidade` float NOT NULL DEFAULT 0,
  `precoUnitario` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`idVendaProdutos`) USING BTREE,
  KEY `fik_vendasProdutos_vendas` (`idVenda`),
  KEY `fk_vendas_Produtos_produto` (`idProduto`),
  CONSTRAINT `fik_vendasProdutos_vendas` FOREIGN KEY (`idVenda`) REFERENCES `vendas` (`idVenda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vendas_Produtos_produto` FOREIGN KEY (`idProduto`) REFERENCES `produtos` (`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela exemplo1.venda_produtos: ~8 rows (aproximadamente)
INSERT INTO `venda_produtos` (`idVendaProdutos`, `idVenda`, `idProduto`, `quantidade`, `precoUnitario`, `total`) VALUES
	(2, 1, 1, 2.5, 5.66, 14.56),
	(3, 1, 7, 1.56, 5.66, 8.59),
	(4, 1, 3, 3.25, 8.99, 26.97),
	(5, 1, 4, 1.68, 1.55, 2.89),
	(6, 2, 6, 2.56, 5.55, 16.55),
	(7, 3, 3, 2.56, 8.99, 25.63),
	(8, 4, 8, 1, 5.66, 5.66),
	(9, 5, 5, 3.56, 4.56, 15.12);

-- Copiando estrutura para tabela exemplo1.vendedores
CREATE TABLE IF NOT EXISTS `vendedores` (
  `idvendedor` int(11) NOT NULL AUTO_INCREMENT,
  `idloja` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefone` varchar(50) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  PRIMARY KEY (`idvendedor`),
  KEY `fk_vendedor_unidade` (`idloja`),
  CONSTRAINT `fk_vendedor_unidade` FOREIGN KEY (`idloja`) REFERENCES `unidades` (`idUnidade`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela exemplo1.vendedores: ~5 rows (aproximadamente)
INSERT INTO `vendedores` (`idvendedor`, `idloja`, `nome`, `email`, `telefone`, `endereco`) VALUES
	(1, 1, 'Douglas Marcelo Monquero', 'douglas@gmail.com', '44 99901-3434', 'rua dos ipes, 312 - Maringá - Paraná'),
	(2, 1, 'Josue Vargas', 'josue@gmail.com', '44 99900-0505', 'rua dos lagos, 1234 - Maringá - Paraná'),
	(3, 1, 'Luciana Braga', 'lu@gmail.com', '44 98654-7894', 'avenida maus, 432 - Maringá - Paraná'),
	(4, 1, 'Daniela Vue', 'dv@gmail.com', '44 98652-2314', 'avenda brasil, 987 - Maringá - Paraná'),
	(5, 1, 'Gabriel El', 'gabri@marvel.com.br', '44 98652-1254', 'avenida kripton, 876 - Maringá - Paraná');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
