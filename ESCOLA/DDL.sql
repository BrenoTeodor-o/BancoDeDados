
-- Table: escola."Disciplina"

-- DROP TABLE escola."Disciplina";

CREATE TABLE escola."Disciplina"
(
  cod serial NOT NULL,
  nome character varying,
  cargaHoraria integer,
  ano integer(4),
  CONSTRAINT pk_disciplina PRIMARY KEY (cod)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE escola."Disciplina"
  OWNER TO postgres;

-- Table: escola."Professor"

-- DROP TABLE escola."Professor";

CREATE TABLE escola."Professor"
(
  cod serial NOT NULL,
  nome character varying,
  CONSTRAINT pk_professor PRIMARY KEY (cod)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE escola."Professor"
  OWNER TO postgres;

-- Table: escola."Curso"

-- DROP TABLE escola."Curso";

CREATE TABLE escola."Curso"
(
  cod serial NOT NULL,
  nome character varying,
  CONSTRAINT pk_curso PRIMARY KEY (cod)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE escola."Curso"
  OWNER TO postgres;
