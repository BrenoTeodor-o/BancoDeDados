/*
|	BRENO RIBEIRO TEODORO - 15059823
|	Criar o DDL(SQL) - criação, alteração e exclusão
|
|
*/
-- Table: empresa."Empresa"

-- DROP TABLE empresa."Empresa";

CREATE TABLE empresa."Empresa"
(
  cod serial NOT NULL,
  "razaoSocial" character varying,
  "nomeFantasia" character varying,
  cnpj numeric NOT NULL,
  telefone numeric,
  CONSTRAINT pk_empresa PRIMARY KEY (cod)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE empresa."Empresa"
  OWNER TO postgres;

-- Table: empresa."Setor"

-- DROP TABLE empresa."Setor";

CREATE TABLE empresa."Setor"
(
  cod serial NOT NULL,
  nome character varying,
  cod_empresa serial NOT NULL,
  CONSTRAINT pk_setor PRIMARY KEY (cod),
  CONSTRAINT fk_setor FOREIGN KEY (cod_empresa)
      REFERENCES empresa."Empresa" (cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE empresa."Setor"
  OWNER TO postgres;

-- Table: empresa."Departamento"

-- DROP TABLE empresa."Departamento";

CREATE TABLE empresa."Departamento"
(
  cod serial NOT NULL,
  nome character varying,
  cod_setor serial NOT NULL,
  CONSTRAINT pk_departamento PRIMARY KEY (cod),
  CONSTRAINT fk_departamento FOREIGN KEY (cod)
      REFERENCES empresa."Setor" (cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE empresa."Departamento"
  OWNER TO postgres;

-- Table: empresa."Funcionario"

-- DROP TABLE empresa."Funcionario";

CREATE TABLE empresa."Funcionario"
(
  matricula numeric,
  nome character varying,
  cpf numeric NOT NULL,
  telefone numeric,
  salario money,
  cod_dep serial NOT NULL,
  CONSTRAINT pk_funcionario PRIMARY KEY (cpf),
  CONSTRAINT fk_funcionario FOREIGN KEY (cod_dep)
      REFERENCES empresa."Departamento" (cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE empresa."Funcionario"
  OWNER TO postgres;

 /*---------------------------------------------------------------------------------*/

 DROP TABLE empresa."Empresa", empresa."Setor", empresa."Departamento", empresa."Funcionario";

 
 /*---------------------------------------------------------------------------------*/
SELECT * FROM empresa."Empresa";
SELECT * FROM empresa."Setor";
SELECT * FROM empresa."Departamento";
SELECT * FROM empresa."Funcionario";

INSERT INTO empresa."Empresa"(
            cod, "razaoSocial", "nomeFantasia", cnpj, telefone)
    VALUES (7, 'agora vai7', 'adsdasdasdasd', 1239875, 56465231);

INSERT INTO empresa."Setor"(
            nome)
    VALUES ('teste de cadastro2');
    
INSERT INTO empresa."Departamento"(
            nome)
    VALUES ('socorro');
    
INSERT INTO empresa."Funcionario"(
            matricula, nome, cpf, telefone, salario)
    VALUES (312123213, 'rindo de nervoso', 5, 12, 19);

INSERT INTO empresa."Funcionario"(
            matricula, nome, cpf, telefone, salario, cod_dep)
    VALUES (312123213, 'brasileirinho', 4, 132132, 945649.9,4);

/*--------------------------------------------------------------*/

UPDATE empresa."Empresa"
SET cod = 5
WHERE cod = 4;

UPDATE empresa."Empresa"
SET "nomeFantasia" = 'update nome Fansasia'
WHERE cod = 2;

UPDATE empresa."Setor"
SET nome = 'update nome do setor'
WHERE cod = 3;

UPDATE empresa."Departamento"
SET nome = 'update de nome de departamento'
WHERE cod = 2;

UPDATE empresa."Funcionario"
SET cod_dep = 2
WHERE nome = 'brasileirinho';

/*------------------------------------------------------------------*/
DELETE FROM empresa."Funcionario"
WHERE cod_dep= 3;

DELETE FROM empresa."Setor"
WHERE cod = 3;

DELETE FROM empresa."Departamento"
WHERE cod_setor = 3;

DELETE FROM empresa."Empresa"
WHERE cod = 3;

/*------------------------------------------------------------------*/
SELECT * FROM empresa."Empresa";
SELECT * FROM empresa."Setor";
SELECT * FROM empresa."Departamento";
SELECT * FROM empresa."Funcionario";