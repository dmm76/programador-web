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
