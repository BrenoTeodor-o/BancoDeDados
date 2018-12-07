
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema clubesocial
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `clubesocial` ;

-- -----------------------------------------------------
-- Schema clubesocial
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `clubesocial` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `clubesocial` ;

-- -----------------------------------------------------
-- Table `clubesocial`.`plano`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clubesocial`.`plano` ;

CREATE TABLE IF NOT EXISTS `clubesocial`.`plano` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `valor` DECIMAL(10,2) NOT NULL,
  `votoAssembleia` TINYINT(1) NOT NULL,
  `votoEleicao` TINYINT(1) NOT NULL,
  `permiteDependente` TINYINT(1) NOT NULL,
  `nome` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `clubesocial`.`associado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clubesocial`.`associado` ;

CREATE TABLE IF NOT EXISTS `clubesocial`.`associado` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_plano` INT(11) NULL DEFAULT NULL,
  `nome` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `endereco` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `telefone` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `email` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `IDX_242824C9CFE385AE` (`id_plano` ASC) VISIBLE,
  CONSTRAINT `FK_242824C9CFE385AE`
    FOREIGN KEY (`id_plano`)
    REFERENCES `clubesocial`.`plano` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `clubesocial`.`parentesco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clubesocial`.`parentesco` ;

CREATE TABLE IF NOT EXISTS `clubesocial`.`parentesco` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeParentesco` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `clubesocial`.`dependente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clubesocial`.`dependente` ;

CREATE TABLE IF NOT EXISTS `clubesocial`.`dependente` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `dataNascimento` DATE NOT NULL,
  `associado_id` INT(11) NOT NULL,
  `parentesco_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `associado_id`),
  INDEX `fk_dependente_associado1_idx` (`associado_id` ASC) VISIBLE,
  INDEX `fk_dependente_parentesco1_idx` (`parentesco_id` ASC) VISIBLE,
  CONSTRAINT `fk_dependente_associado1`
    FOREIGN KEY (`associado_id`)
    REFERENCES `clubesocial`.`associado` (`id`),
  CONSTRAINT `fk_dependente_parentesco1`
    FOREIGN KEY (`parentesco_id`)
    REFERENCES `clubesocial`.`parentesco` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `clubesocial`.`mensalidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clubesocial`.`mensalidade` ;

CREATE TABLE IF NOT EXISTS `clubesocial`.`mensalidade` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_associado` INT(11) NULL DEFAULT NULL,
  `data` DATE NOT NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  `mes` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `ano` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `IDX_F026810E26EC1A4D` (`id_associado` ASC) VISIBLE,
  CONSTRAINT `FK_F026810E26EC1A4D`
    FOREIGN KEY (`id_associado`)
    REFERENCES `clubesocial`.`associado` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `clubesocial`.`ocorrencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `clubesocial`.`ocorrencia` ;

CREATE TABLE IF NOT EXISTS `clubesocial`.`ocorrencia` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_associado` INT(11) NULL DEFAULT NULL,
  `id_dependente` INT(11) NULL DEFAULT NULL,
  `motivo` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `dias` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `IDX_9333DAB126EC1A4D` (`id_associado` ASC) VISIBLE,
  INDEX `IDX_9333DAB19B500D0B` (`id_dependente` ASC) VISIBLE,
  CONSTRAINT `FK_9333DAB126EC1A4D`
    FOREIGN KEY (`id_associado`)
    REFERENCES `clubesocial`.`associado` (`id`),
  CONSTRAINT `FK_9333DAB19B500D0B`
    FOREIGN KEY (`id_dependente`)
    REFERENCES `clubesocial`.`dependente` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- Padrões

use `clubesocial`;

ALTER TABLE `Associado` AUTO_INCREMENT = 1;
ALTER TABLE `Dependente` AUTO_INCREMENT = 1;
ALTER TABLE `Mensalidade` AUTO_INCREMENT = 1;
ALTER TABLE `Ocorrencia` AUTO_INCREMENT = 1;
ALTER TABLE `Parentesco` AUTO_INCREMENT = 1;
ALTER TABLE `Plano` AUTO_INCREMENT = 1;

SELECT * FROM `Associado`;
SELECT * FROM `Dependente`;
SELECT * FROM `Mensalidade`;
SELECT * FROM `Ocorrencia`;
SELECT * FROM `Parentesco`;
SELECT * FROM `Plano`;

-- final de padrões


# INSERE PLANOS
INSERT INTO `clubesocial`.`Plano`
(`valor`, `votoAssembleia`, `votoEleicao`, `permiteDependente`, `nome`)
VALUES
(250.00, 0, 0, 0, "Prata");

INSERT INTO `clubesocial`.`Plano`
(`valor`, `votoAssembleia`, `votoEleicao`, `permiteDependente`, `nome`)
VALUES
(300.00, 0, 0, 1, "Ouro");

INSERT INTO `clubesocial`.`Plano`
(`valor`, `votoAssembleia`, `votoEleicao`, `permiteDependente`, `nome`)
VALUES
(500.00, 1, 1, 1, "Diamante");

#  INSERE ASSOCIADO
INSERT INTO `clubesocial`.`Associado`
(`id_plano`, `nome`, `endereco`, `telefone`, `email`)
VALUES
(1, "Cabo Daciolo", "Rua Glória, Deuxx, 333", 4232203333, "daciolo@gmail.com");

INSERT INTO `clubesocial`.`Associado`
(`id_plano`, `nome`, `endereco`, `telefone`, `email`)
VALUES
(1, "Ciro Gomes", "Rua Proto, Neoliberal, 1212", 4232201212, "gomes@gmail.com");

INSERT INTO `clubesocial`.`Associado`
(`id_plano`, `nome`, `endereco`, `telefone`, `email`)
VALUES
(1, "Fernando Haddad", "Rua Petista, MST, 1313", 4232201313, "haddad@gmail.com");

INSERT INTO `clubesocial`.`Associado`
(`id_plano`, `nome`, `endereco`, `telefone`, `email`)
VALUES
(2, "José Eymael", "Rua Democrata, Cristão, 2727", 4232202727, "eymael@gmail.com");

INSERT INTO `clubesocial`.`Associado`
(`id_plano`, `nome`, `endereco`, `telefone`, `email`)
VALUES
(2, "Guilherme Boulos", "Rua Socialism, Liberty, 5050", 4232205050, "boulos@gmail.com");

INSERT INTO `clubesocial`.`Associado`
(`id_plano`, `nome`, `endereco`, `telefone`, `email`)
VALUES
(2, "Marina Silva", "Rua Verde, Samambaia, 1818", 4232201818, "silva@gmail.com");

INSERT INTO `clubesocial`.`Associado`
(`id_plano`, `nome`, `endereco`, `telefone`, `email`)
VALUES
(3, "Felipe Reksua", "Rua José Salles, Uvaranas, 551", 42999683934, "reksuaf@gmail.com");

INSERT INTO `clubesocial`.`Associado`
(`id_plano`, `nome`, `endereco`, `telefone`, `email`)
VALUES
(3, "Renann Josnei", "Rua Moises, Pimentel, 238", 4299992490, "renannjosnei@gmail.com");

INSERT INTO `clubesocial`.`Associado`
(`id_plano`, `nome`, `endereco`, `telefone`, `email`)
VALUES
(3, "Breno Teodoro", "Rua Pedro Beninca, Uvaranas, 403", 42999484959, "teodoro.breno@gmail.com");


-- INSERÇÃO DAS MENSALIDADES
INSERT INTO `clubesocial`.`Mensalidade`
(`id_associado`, `data`, `valor`, `mes`, `ano`)
VALUES
(1, now(), 250.00, "dezembro", "2018");

INSERT INTO `clubesocial`.`Mensalidade`
(`id_associado`, `data`, `valor`, `mes`, `ano`)
VALUES
(1, now(), 250.00, "janeiro", "2019");

INSERT INTO `clubesocial`.`Mensalidade`
(`id_associado`, `data`, `valor`, `mes`, `ano`)
VALUES
(1, now(), 250.00, "fevereiro", "2019");

INSERT INTO `clubesocial`.`Mensalidade`
(`id_associado`, `data`, `valor`, `mes`, `ano`)
VALUES
(2, now(), 250.00, "dezembro", "2018");

INSERT INTO `clubesocial`.`Mensalidade`
(`id_associado`, `data`, `valor`, `mes`, `ano`)
VALUES
(2, now(), 250.00, "janeiro", "2019");

INSERT INTO `clubesocial`.`Mensalidade`
(`id_associado`, `data`, `valor`, `mes`, `ano`)
VALUES
(3, now(), 250.00, "dezembro", "2018");

INSERT INTO `clubesocial`.`Mensalidade`
(`id_associado`, `data`, `valor`, `mes`, `ano`)
VALUES
(3, now(), 250.00, "janeiro", "2019");

INSERT INTO `clubesocial`.`Mensalidade`
(`id_associado`, `data`, `valor`, `mes`, `ano`)
VALUES
(5, now(), 300.00, "dezembro", "2018");

INSERT INTO `clubesocial`.`Mensalidade`
(`id_associado`, `data`, `valor`, `mes`, `ano`)
VALUES
(5, now(), 300.00, "janeiro", "2019");

INSERT INTO `clubesocial`.`Mensalidade`
(`id_associado`, `data`, `valor`, `mes`, `ano`)
VALUES
(6, now(), 300.00, "dezembro", "2018");

INSERT INTO `clubesocial`.`Mensalidade`
(`id_associado`, `data`, `valor`, `mes`, `ano`)
VALUES
(6, now(), 300.00, "janeiro", "2019");

INSERT INTO `clubesocial`.`Mensalidade`
(`id_associado`, `data`, `valor`, `mes`, `ano`)
VALUES
(7, now(), 300.00, "dezembro", "2018");

INSERT INTO `clubesocial`.`Mensalidade`
(`id_associado`, `data`, `valor`, `mes`, `ano`)
VALUES
(7, now(), 300.00, "janeiro", "2019");

INSERT INTO `clubesocial`.`Mensalidade`
(`id_associado`, `data`, `valor`, `mes`, `ano`)
VALUES
(8, now(), 500.00, "dezembro", "2018");

INSERT INTO `clubesocial`.`Mensalidade`
(`id_associado`, `data`, `valor`, `mes`, `ano`)
VALUES
(8, now(), 500.00, "janeiro", "2019");

INSERT INTO `clubesocial`.`Mensalidade`
(`id_associado`, `data`, `valor`, `mes`, `ano`)
VALUES
(9, now(), 500.00, "dezembro", "2018");

INSERT INTO `clubesocial`.`Mensalidade`
(`id_associado`, `data`, `valor`, `mes`, `ano`)
VALUES
(9, now(), 500.00, "janeiro", "2019");

INSERT INTO `clubesocial`.`Mensalidade`
(`id_associado`, `data`, `valor`, `mes`, `ano`)
VALUES
(9, now(),500.00, "dezembro", "2018");

INSERT INTO `clubesocial`.`Mensalidade`
(`id_associado`, `data`, `valor`, `mes`, `ano`)
VALUES
(9, now(), 500.00, "janeiro", "2019");

# 	INSERE PARENTESCO
INSERT INTO `clubesocial`.`Parentesco`
(`nomeParentesco`)
VALUES
("Mãe"), ("Pai"), ("Filho"), ("Filha"), ("Tio"), ("Tia");

#INSERE DEPENDENTE
INSERT INTO `clubesocial`.`dependente`
(`nome`, `dataNascimento`, `associado_id`, `parentesco_id`)
VALUES
("Derpina", "1995-02-01", 5, 1);

INSERT INTO `clubesocial`.`dependente`
(`nome`, `dataNascimento`, `associado_id`, `parentesco_id`)
VALUES
("Derp", "1995-02-01", 6, 2);

INSERT INTO `clubesocial`.`dependente`
(`nome`, `dataNascimento`, `associado_id`, `parentesco_id`)
VALUES
("PokerFace", "1995-02-01", 7, 3);

INSERT INTO `clubesocial`.`dependente`
(`nome`, `dataNascimento`, `associado_id`, `parentesco_id`)
VALUES
("ForeverAlone", "1995-02-01", 9, 3);

INSERT INTO `clubesocial`.`dependente`
(`nome`, `dataNascimento`, `associado_id`, `parentesco_id`)
VALUES
("MeGusta", "1995-02-01", 8, 5);

INSERT INTO `clubesocial`.`dependente`
(`nome`, `dataNascimento`, `associado_id`, `parentesco_id`)
VALUES
("FUUUUU", "1995-02-01", 7, 6);

INSERT INTO `clubesocial`.`dependente`
(`nome`, `dataNascimento`, `associado_id`, `parentesco_id`)
VALUES
("BEAR", "1995-02-01", 8, 1);

#INSERINDO OCORRENCIAS
INSERT INTO `clubesocial`.`Ocorrencia`
(`id_associado`, `id_dependente`, `motivo`,`dias`)
VALUES
(9, null, "Chegou atrasado no debate", 3),
(1, null, "Disse Gloria a Deux pro dono ateu", 3),
(2, null, "Falou besteira", 4),
(3, null, "Não baixou o preço do gas", 2),
(5, null, "Bateu no Bolsonaro", 1),
(null, 2, "Bateu no Derpina", 10),
(null, 2, "Xingou a Derpina", 2),
(null, 3, "Atrasou a mensalidade", 5),
(null, 7, "Botou fogo na piscina", 8),
(9, 6, "Briga", 6);

-- movimentação por plano seguido pela tabela de associados
SELECT m.id_associado, a.id_plano, a.nome FROM `Mensalidade` m
INNER JOIN `Associado` a
ON a.id = m.id_associado
WHERE id_plano = 3;

-- ocorrencia por associado
SELECT o.id_associado, o.motivo, a.nome FROM `Ocorrencia` o
INNER JOIN `Associado` a
ON o.id_associado = a.id
WHERE a.id = 1;

SELECT o.id_dependente, o.motivo, d.nome FROM `Ocorrencia` o
INNER JOIN `Dependente` d
ON o.id_dependente = d.id
WHERE d.id = 2;