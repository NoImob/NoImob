

DROP DATABASE IF EXISTS `noimob`;

CREATE DATABASE noimob;
USE `noimob`;


CREATE TABLE IF NOT EXISTS `locador` (
  `locador_id` int(11) NOT NULL AUTO_INCREMENT,
  `locador_nome_usuario` varchar(30) NOT NULL,
  `locador_nome` varchar(20) NOT NULL,
  `locador_sobrenome` varchar(30) NOT NULL,
  `locador_foto` varchar(10)  NULL,
  `locador_email` varchar(30) NOT NULL,
  `locador_tel` varchar(20)  NULL,
  `locador_senha` varchar(10) NOT NULL,
  `locador_confirmar_senha` varchar(10) NOT NULL,
  PRIMARY KEY (`locador_id`)
) ;


CREATE TABLE IF NOT EXISTS `locatario` (
  `locatario_id` int(11) NOT NULL AUTO_INCREMENT,
  `locatario_nome_usuario` varchar(30) NOT NULL,
  `locatario_nome` varchar(20) NOT NULL,
  `locatario_foto` varchar(10) NOT NULL,
  `locatario_sobrenome` varchar(30) NOT NULL,
  `locatario_email` varchar(30) NOT NULL,
  `locatario_senha` varchar(10) NOT NULL,
  `locatario_confirmar_senha` varchar(10) NOT NULL,
  PRIMARY KEY (`locatario_id`)
);

CREATE TABLE IF NOT EXISTS `casa` (
  `casa_id` int(11) NOT NULL AUTO_INCREMENT,
  `casa_tipo` varchar(20) NOT NULL,
  casa_nome varchar(40) not null,

  	`casa_condicoes` VARCHAR(30) NULL,
	`casa_regiao` VARCHAR(10) NOT NULL,
  `casa_cep` varchar(9) NOT NULL,
  `casa_numero` int(11) NOT NULL,
  `casa_rua` VARCHAR(50) NOT NULL,
  `casa_foto` varchar(50) NOT NULL,
  `casa_bairro` varchar(20) NOT NULL,
  `casa_cidade` varchar(20) NOT NULL,
  `casa_ponto_referencia` varchar(40) NOT NULL,
  `casa_metros_quadrados` float NOT NULL,
  `casa_comodos` int(11) NOT NULL,
  `casa_descricao` varchar(50) NOT NULL,
  `casa_valor` varchar(10) NOT NULL,
  `casa_tel_locador` varchar(25) NULL,
  `locador_id` int(11) NOT NULL,
  PRIMARY KEY (`casa_id`),
  KEY `locador_id` (`locador_id`),
  CONSTRAINT `casa_ibfk_1` FOREIGN KEY (`locador_id`) REFERENCES `locador` (`locador_id`) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS `contato` (
  `contato_id` int(11) NOT NULL AUTO_INCREMENT,
  `contato_nome` varchar(20) NOT NULL,
  `contato_sobrenome` varchar(30) NOT NULL,
  `contato_email` varchar(30) NOT NULL,
  `contato_mensagem` varchar(500) NOT NULL,
  PRIMARY KEY (`contato_id`)
);


CREATE TABLE IF NOT EXISTS `contrato` (
  `contrato_id` int(11) NOT NULL AUTO_INCREMENT,
  `contrato_foto` varchar(10) NOT NULL,
  `contrato_dt_inicial` date NOT NULL,
  `contrato_dt_final` date NOT NULL,
  `locador_id` int(11) NOT NULL,
  `locatario_id` int(11) NOT NULL,
  PRIMARY KEY (`contrato_id`),
  KEY `locador_id` (`locador_id`),
  KEY `locatario_id` (`locatario_id`),
  CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`locador_id`) REFERENCES `locador` (`locador_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contrato_ibfk_2` FOREIGN KEY (`locatario_id`) REFERENCES `locatario` (`locatario_id`) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_email_locador` varchar(30) NOT NULL,
  `login_senha_locador` varchar(20) NOT NULL,
  `login_email_locatario` varchar(30) NOT NULL,
  `login_senha_locatario` varchar(20) NOT NULL,
  `locador_id` int(11) NOT NULL,
  `locatario_id` int(11) NOT NULL,
  PRIMARY KEY (`login_id`),
  KEY `locador_id` (`locador_id`),
  KEY `locatario_id` (`locatario_id`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`locador_id`) REFERENCES `locador` (`locador_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `login_ibfk_2` FOREIGN KEY (`locatario_id`) REFERENCES `locatario` (`locatario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ;


INSERT INTO locador(locador_id, locador_nome_usuario, locador_nome, locador_sobrenome
, locador_email, locador_tel, locador_senha, locador_confirmar_senha) VALUES (NULL, 
"joberto", "joao roberto", "santana", "a@a.com", "11981633388", "55184657", "55184657");

