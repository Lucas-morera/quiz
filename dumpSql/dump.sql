-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.44 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.7.0.6872
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para quiz
CREATE DATABASE IF NOT EXISTS `quiz` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `quiz`;

-- Copiando estrutura para tabela quiz.perguntas
CREATE TABLE IF NOT EXISTS `perguntas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PERGUNTA` text,
  `QUESTAO_1` varchar(50) DEFAULT '',
  `QUESTAO_2` varchar(50) DEFAULT '',
  `QUESTAO_3` varchar(50) DEFAULT '',
  `QUESTAO_4` varchar(50) DEFAULT '',
  `RESPOSTA` varchar(50) DEFAULT '',
  `ACTIVE` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela quiz.perguntas: 21 rows
/*!40000 ALTER TABLE `perguntas` DISABLE KEYS */;
INSERT INTO `perguntas` (`ID`, `PERGUNTA`, `QUESTAO_1`, `QUESTAO_2`, `QUESTAO_3`, `QUESTAO_4`, `RESPOSTA`, `ACTIVE`) VALUES
	(1, 'Quem foi a primeira pessoa a viajar no espaço ?', 'Yuri Gagarin', 'A cadela Laika', 'Marcos Pontes', 'Neil Armstrong', 'Yuri Gagarin', 'Y'),
	(2, 'Qual a montanha mais alta do mundo ?', 'Mauna Kea', 'Dhaulagiri', 'Monte Everest', 'Pico da Neblina', 'Monte Everest', 'Y'),
	(3, 'Onde se localiza Machu Picchu?', 'Colômbia', 'Peru', 'Bolívia', 'Índia', 'Peru', 'Y'),
	(4, 'Qual país tem o formato de uma bota ?', 'Butão', 'Itália', 'Portugal', 'México', 'Itália', 'Y'),
	(5, 'Quem inventou a lâmpada ?', 'Graham Bell', 'Steve Jobs', 'Henry Ford', 'Thomas Edison', 'Thomas Edison', 'Y'),
	(6, 'A que temperatura a água ferve ?', '200 ºC', '-10 ºC', '180 ºC', '100 ºC', '100 ºC', 'Y'),
	(7, 'Quantos ossos temos no nosso corpo ?', '126', '206', '18', '300', '206', 'Y'),
	(8, 'Qual o maior planeta do sistema solar ?', 'Júpter', 'Marte', 'Terra', 'Saturno', 'Júpter', 'Y'),
	(9, 'Qual o planeta mais próximo do sol ?', 'Netuno', 'Júpter', 'Marte', 'Mercúrio', 'Mercúrio', 'Y'),
	(10, 'Quantos continentes existem ?', '6', '4', '8', '20', '6', 'Y'),
	(11, 'Qual a maior floresta tropical do mundo?', 'Mata Atlântica', 'Pampas', 'Floresta amazônica', 'Caatinga', 'Floresta amazônica', 'Y'),
	(12, 'Quem pintou monalisa ?', 'Leonardo da Vinci', 'Van Gogh', 'Tarsila do Amaral', 'Pablo Vitar', 'Leonardo da Vinci', 'Y'),
	(13, 'Qual o nome popular do cloreto de sódio ?', 'Vinagre', 'Água', 'Papel', 'Sal de cozinha', 'Sal de cozinha', 'Y'),
	(14, 'Que animal põe o maior ovo ?', 'Beija-flor', 'Avestruz', 'Tartaruga-gigante', 'Galinha', 'Avestruz', 'Y'),
	(15, 'O que os pandas comem ?', 'Bambu', 'Frutas e mel', 'Carne', 'Mel', 'Bambu', 'Y'),
	(16, 'Quantos andares tem o maior prédio do mundo?', '100', '163', '522', '255', '163', 'Y'),
	(17, 'Qual a nacionalidade de Napolião Bonaparte ?', 'Francesa', 'Inglaterra', 'Mexicana', 'Brasileira', 'Francesa', 'Y'),
	(18, 'Em que região se localiza o estado de Minas Gerais ?', 'Oeste', 'Sudeste', 'Sul', 'Centro-Oeste', 'Sudeste', 'Y'),
	(19, 'Que fruto nasce da Oliveira ?', 'Amêndoa', 'Açaí', 'Acerola', 'Azeitona', 'Azeitona', 'Y'),
	(20, 'Qual o plural de chapéu ?', 'Chapéis', 'Chapéus', 'Chapuzes', 'Chapéuzes', 'Chapéus', 'N'),
	(21, 'Qual o ano atual ?', '2022', '2025', '2024', '2016', '2024', 'Y');
/*!40000 ALTER TABLE `perguntas` ENABLE KEYS */;

-- Copiando estrutura para tabela quiz.score
CREATE TABLE IF NOT EXISTS `score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_fk` int(11) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela quiz.score: 0 rows
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
/*!40000 ALTER TABLE `score` ENABLE KEYS */;

-- Copiando estrutura para tabela quiz.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `senha` varchar(1000) DEFAULT NULL,
  `email` varchar(90) DEFAULT NULL,
  `telefone` varchar(60) DEFAULT NULL,
  `cpf` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela quiz.usuarios: 0 rows
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
