-- Database: "Escola"

-- DROP DATABASE "Escola";

CREATE DATABASE "Escola"
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'Portuguese_Brazil.1252'
       LC_CTYPE = 'Portuguese_Brazil.1252'
       CONNECTION LIMIT = -1;


-- Table: escola."Aluno"

-- DROP TABLE escola."Aluno";

CREATE TABLE escola."Aluno"
(
  sexo character(1),
  nome character varying,
  ra integer NOT NULL,
  CONSTRAINT pk_aluno PRIMARY KEY (ra)
);


-- Table: escola."Disciplina"

-- DROP TABLE escola."Disciplina";

CREATE TABLE escola."Disciplina"
(
  cod serial NOT NULL,
  nome character varying,
  cargaHoraria integer,
  ano integer(4),
  CONSTRAINT pk_disciplina PRIMARY KEY (cod)
);


-- Table: escola."Professor"

-- DROP TABLE escola."Professor";

CREATE TABLE escola."Professor"
(
  cod serial NOT NULL,
  nome character varying,
  CONSTRAINT pk_professor PRIMARY KEY (cod)
);


-- Table: escola."Curso"

-- DROP TABLE escola."Curso";

CREATE TABLE escola."Curso"
(
  cod serial NOT NULL,
  nome character varying,
  CONSTRAINT pk_curso PRIMARY KEY (cod)
);


-- Table: escola."Disciplina"

-- DROP TABLE escola."Disciplina";

CREATE TABLE escola."Disciplina"
(
  cod serial NOT NULL,
  nome character varying,
  cargahoraria integer,
  ano integer,
  CONSTRAINT pk_disciplina PRIMARY KEY (cod)
);


-- Table: escola."Nota"

-- DROP TABLE escola."Nota";

CREATE TABLE escola."Nota"
(
  nota integer,
  ra integer,
  "codDisc" serial NOT NULL,
  bimestre integer NOT NULL,
  CONSTRAINT bimestre PRIMARY KEY (bimestre),
  CONSTRAINT "codDisc" FOREIGN KEY ("codDisc")
      REFERENCES escola."Disciplina" (cod) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
      CONSTRAINT ra FOREIGN KEY (ra)
      REFERENCES escola."Aluno" (ra) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


/*
Inserir registros nestas tabelas
8 alunos por disciplina, 
4 notas bimestrais por aluno
*/

INSERT INTO escola."Professor"(
             nome)
    VALUES ('Professor1');
INSERT INTO escola."Professor"(
             nome)
    VALUES ('Professor2');
INSERT INTO escola."Professor"(
             nome)
    VALUES ('Professor3');
INSERT INTO escola."Professor"(
             nome)
    VALUES ('Professor4');
INSERT INTO escola."Professor"(
             nome)
    VALUES ('Professor5');

INSERT INTO escola."Curso"(
            nome)
    VALUES ('Curso1');
INSERT INTO escola."Curso"(
            nome)
    VALUES ('Curso2');
INSERT INTO escola."Disciplina"(
            nome, cargahoraria, ano)
    VALUES ('Disciplina1', 126, 1);
INSERT INTO escola."Disciplina"(
            nome, cargahoraria, ano)
    VALUES ('Disciplina2', 126, 2);
INSERT INTO escola."Disciplina"(
            nome, cargahoraria, ano)
    VALUES ('Disciplina3', 125, 3);
INSERT INTO escola."Disciplina"(
            nome, cargahoraria, ano)
    VALUES ('Disciplina4', 125, 3);
INSERT INTO escola."Disciplina"(
            nome, cargahoraria, ano)
    VALUES ('Disciplina5', 125, 3);
INSERT INTO escola."Disciplina"(
            nome, cargahoraria, ano)
    VALUES ('Disciplina6', 125, 3);

INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome01', 1);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome02', 2);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome03', 3);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome04', 4);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome05', 5);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome06', 6);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome07', 7);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome08', 8);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome09', 9);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome10', 10);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome11', 11);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome12', 12);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome13', 13);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome14', 14);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome15', 15);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome16', 16);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome17', 17);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome18', 18);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome19', 19);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome20', 20);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome21', 21);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome22', 22);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome23', 23);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome24', 24);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome25', 25);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome26', 26);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome27', 27);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome28', 28);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome29', 29);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome30', 30);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome31', 31);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome32', 32);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome33', 33);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome34', 34);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome35', 35);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome36', 36);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome37', 37);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome38', 38);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome39', 39);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome40', 40);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome41', 41);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome42', 42);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome43', 43);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome44', 44);
INSERT INTO escola."Aluno" (
    sexo, nome, ra) 
    VALUES ('M', 'nome45', 45);

INSERT INTO escola."Nota"(
            nota, ra, "codDisc", bimestre)
    VALUES (10, 1, 1, 1111);
INSERT INTO escola."Nota"(
            nota, ra, "codDisc", bimestre)
    VALUES (10, 1, 2, 2222);
INSERT INTO escola."Nota"(
            nota, ra, "codDisc", bimestre)
    VALUES (10, 1, 3, 3333);
INSERT INTO escola."Nota"(
            nota, ra, "codDisc", bimestre)
    VALUES (10, 1, 4, 4444);

INSERT INTO escola."Nota"(
            nota, ra, "codDisc", bimestre)
    VALUES (10, 2, 1, 555);
INSERT INTO escola."Nota"(
            nota, ra, "codDisc", bimestre)
    VALUES (10, 2, 2, 2);
INSERT INTO escola."Nota"(
            nota, ra, "codDisc", bimestre)
    VALUES (10, 2, 3, 4);
INSERT INTO escola."Nota"(
            nota, ra, "codDisc", bimestre)
    VALUES (10, 2, 4, 4);

-- A)
SELECT A.nome, A.ra, C.nome AS "curso_ nome"
    FROM escola."Aluno" A 
        INNER JOIN escola."Matricula" M
        ON A.ra = M.ra
            INNER JOIN escola."Disciplina" D 
            ON D.cod = M.cod_disc
                INNER JOIN escola."Curso" C 
                    ON C.cod = D.cod
                    WHERE C.cod = 5
                        ORDER BY A.nome;

-- B)
SELECT A.nome, A.ra, C.nome AS "curso_ nome"
    FROM escola."Aluno" A 
        INNER JOIN escola."Matricula" M
        ON A.ra = M.ra
            INNER JOIN escola."Disciplina" D 
            ON D.cod = M.cod_disc
                INNER JOIN escola."Curso" C 
                    ON C.cod = D.cod
                    WHERE C.nome = 'Curso1'
                        ORDER BY A.nome;

-- C) Todas as notas de um aluno, selecionadas pelo RA do aluno, ordenadas pelo bimestre
SELECT A.nome, A.ra, C.nome AS "curso_ nome"
    FROM escola."Aluno" A 
        INNER JOIN escola."Matricula" M
        ON A.ra = M.ra
            INNER JOIN escola."Disciplina" D 
            ON D.cod = M.cod_disc
                INNER JOIN escola."Nota" N 
                    ON N.ra = M.ra AND N.cod_disc = M.cod_disc
                    WHERE A.ra = 1234
                        ORDER BY N.bimestre;

-- D) Todos os professores de um determinado curso, selecionado pelo código do curso
SELECT P.nome, C.nome 
    FROM escola."Professor" P
        INNER JOIN escola."Disciplina" D
        ON P.cod = D.cod
            INNER JOIN escola."Curso" C
            ON D.cod = C.cod_disc
            WHERE C.cod = 1
 -- SELECT DISTINCT -> evita repetição de valores constantes, não utilizar para valores * em um SELECT <-
 