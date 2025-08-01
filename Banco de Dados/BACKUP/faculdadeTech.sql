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


-- Copiando estrutura do banco de dados para FaculdadeTech
CREATE DATABASE IF NOT EXISTS `faculdadetech` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `FaculdadeTech`;

-- Copiando estrutura para tabela FaculdadeTech.alunos
CREATE TABLE IF NOT EXISTS `alunos` (
  `idAluno` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL DEFAULT '0',
  `matricula` int(11) NOT NULL,
  `idCurso` int(11) NOT NULL,
  PRIMARY KEY (`idAluno`),
  KEY `fk_aluno_curso` (`idCurso`),
  CONSTRAINT `fk_aluno_curso` FOREIGN KEY (`idCurso`) REFERENCES `cursos` (`idCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela FaculdadeTech.alunos: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela FaculdadeTech.cursos
CREATE TABLE IF NOT EXISTS `cursos` (
  `idCurso` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `duracaoMeses` int(11) NOT NULL,
  PRIMARY KEY (`idCurso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela FaculdadeTech.cursos: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela FaculdadeTech.disciplinas
CREATE TABLE IF NOT EXISTS `disciplinas` (
  `idDisciplina` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `idCurso` int(11) NOT NULL,
  PRIMARY KEY (`idDisciplina`),
  KEY `fk_disciplina_curso` (`idCurso`),
  CONSTRAINT `fk_disciplina_curso` FOREIGN KEY (`idCurso`) REFERENCES `cursos` (`idCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela FaculdadeTech.disciplinas: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela FaculdadeTech.professores
CREATE TABLE IF NOT EXISTS `professores` (
  `idProfessor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `especialidade` varchar(50) NOT NULL,
  PRIMARY KEY (`idProfessor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela FaculdadeTech.professores: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela FaculdadeTech.turmas
CREATE TABLE IF NOT EXISTS `turmas` (
  `idTurma` int(11) NOT NULL AUTO_INCREMENT,
  `idDisciplina` int(11) NOT NULL,
  `idProfessor` int(11) NOT NULL,
  `semestre` int(11) NOT NULL,
  PRIMARY KEY (`idTurma`),
  KEY `fk_turma_disciplina` (`idDisciplina`),
  KEY `fk_turma_professor` (`idProfessor`),
  CONSTRAINT `fk_turma_disciplina` FOREIGN KEY (`idDisciplina`) REFERENCES `disciplinas` (`idDisciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_turma_professor` FOREIGN KEY (`idProfessor`) REFERENCES `professores` (`idProfessor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela FaculdadeTech.turmas: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
