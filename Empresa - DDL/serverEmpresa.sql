--
-- PostgreSQL database cluster dump
--

-- Started on 2018-09-30 17:19:12

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md52a29a4f7eb0a98abca0992ca3fb555b6';






--
-- Database creation
--

CREATE DATABASE "Empresa" WITH TEMPLATE = template0 OWNER = postgres;
REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect "Empresa"

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

-- Started on 2018-09-30 17:19:12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 16545)
-- Name: empresa; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA empresa;


ALTER SCHEMA empresa OWNER TO postgres;

--
-- TOC entry 1 (class 3079 OID 12278)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2204 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 203 (class 1259 OID 16624)
-- Name: Departamento; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa."Departamento" (
    cod integer NOT NULL,
    nome character varying,
    cod_setor integer NOT NULL
);


ALTER TABLE empresa."Departamento" OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16620)
-- Name: Departamento_cod_seq; Type: SEQUENCE; Schema: empresa; Owner: postgres
--

CREATE SEQUENCE empresa."Departamento_cod_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empresa."Departamento_cod_seq" OWNER TO postgres;

--
-- TOC entry 2205 (class 0 OID 0)
-- Dependencies: 201
-- Name: Departamento_cod_seq; Type: SEQUENCE OWNED BY; Schema: empresa; Owner: postgres
--

ALTER SEQUENCE empresa."Departamento_cod_seq" OWNED BY empresa."Departamento".cod;


--
-- TOC entry 202 (class 1259 OID 16622)
-- Name: Departamento_cod_setor_seq; Type: SEQUENCE; Schema: empresa; Owner: postgres
--

CREATE SEQUENCE empresa."Departamento_cod_setor_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empresa."Departamento_cod_setor_seq" OWNER TO postgres;

--
-- TOC entry 2206 (class 0 OID 0)
-- Dependencies: 202
-- Name: Departamento_cod_setor_seq; Type: SEQUENCE OWNED BY; Schema: empresa; Owner: postgres
--

ALTER SEQUENCE empresa."Departamento_cod_setor_seq" OWNED BY empresa."Departamento".cod_setor;


--
-- TOC entry 197 (class 1259 OID 16548)
-- Name: Empresa; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa."Empresa" (
    cod integer NOT NULL,
    "razaoSocial" character varying,
    "nomeFantasia" character varying,
    cnpj numeric NOT NULL,
    telefone numeric
);


ALTER TABLE empresa."Empresa" OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16546)
-- Name: Empresa_cod_seq; Type: SEQUENCE; Schema: empresa; Owner: postgres
--

CREATE SEQUENCE empresa."Empresa_cod_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empresa."Empresa_cod_seq" OWNER TO postgres;

--
-- TOC entry 2207 (class 0 OID 0)
-- Dependencies: 196
-- Name: Empresa_cod_seq; Type: SEQUENCE OWNED BY; Schema: empresa; Owner: postgres
--

ALTER SEQUENCE empresa."Empresa_cod_seq" OWNED BY empresa."Empresa".cod;


--
-- TOC entry 205 (class 1259 OID 16641)
-- Name: Funcionario; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa."Funcionario" (
    matricula numeric,
    nome character varying,
    cpf numeric NOT NULL,
    telefone numeric,
    salario money,
    cod_dep integer NOT NULL
);


ALTER TABLE empresa."Funcionario" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16639)
-- Name: Funcionario_cod_dep_seq; Type: SEQUENCE; Schema: empresa; Owner: postgres
--

CREATE SEQUENCE empresa."Funcionario_cod_dep_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empresa."Funcionario_cod_dep_seq" OWNER TO postgres;

--
-- TOC entry 2208 (class 0 OID 0)
-- Dependencies: 204
-- Name: Funcionario_cod_dep_seq; Type: SEQUENCE OWNED BY; Schema: empresa; Owner: postgres
--

ALTER SEQUENCE empresa."Funcionario_cod_dep_seq" OWNED BY empresa."Funcionario".cod_dep;


--
-- TOC entry 200 (class 1259 OID 16605)
-- Name: Setor; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa."Setor" (
    cod integer NOT NULL,
    nome character varying,
    cod_empresa integer NOT NULL
);


ALTER TABLE empresa."Setor" OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16603)
-- Name: Setor_cod_empresa_seq; Type: SEQUENCE; Schema: empresa; Owner: postgres
--

CREATE SEQUENCE empresa."Setor_cod_empresa_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empresa."Setor_cod_empresa_seq" OWNER TO postgres;

--
-- TOC entry 2209 (class 0 OID 0)
-- Dependencies: 199
-- Name: Setor_cod_empresa_seq; Type: SEQUENCE OWNED BY; Schema: empresa; Owner: postgres
--

ALTER SEQUENCE empresa."Setor_cod_empresa_seq" OWNED BY empresa."Setor".cod_empresa;


--
-- TOC entry 198 (class 1259 OID 16601)
-- Name: Setor_cod_seq; Type: SEQUENCE; Schema: empresa; Owner: postgres
--

CREATE SEQUENCE empresa."Setor_cod_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empresa."Setor_cod_seq" OWNER TO postgres;

--
-- TOC entry 2210 (class 0 OID 0)
-- Dependencies: 198
-- Name: Setor_cod_seq; Type: SEQUENCE OWNED BY; Schema: empresa; Owner: postgres
--

ALTER SEQUENCE empresa."Setor_cod_seq" OWNED BY empresa."Setor".cod;


--
-- TOC entry 2053 (class 2604 OID 16627)
-- Name: Departamento cod; Type: DEFAULT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa."Departamento" ALTER COLUMN cod SET DEFAULT nextval('empresa."Departamento_cod_seq"'::regclass);


--
-- TOC entry 2054 (class 2604 OID 16628)
-- Name: Departamento cod_setor; Type: DEFAULT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa."Departamento" ALTER COLUMN cod_setor SET DEFAULT nextval('empresa."Departamento_cod_setor_seq"'::regclass);


--
-- TOC entry 2050 (class 2604 OID 16551)
-- Name: Empresa cod; Type: DEFAULT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa."Empresa" ALTER COLUMN cod SET DEFAULT nextval('empresa."Empresa_cod_seq"'::regclass);


--
-- TOC entry 2055 (class 2604 OID 16644)
-- Name: Funcionario cod_dep; Type: DEFAULT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa."Funcionario" ALTER COLUMN cod_dep SET DEFAULT nextval('empresa."Funcionario_cod_dep_seq"'::regclass);


--
-- TOC entry 2051 (class 2604 OID 16608)
-- Name: Setor cod; Type: DEFAULT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa."Setor" ALTER COLUMN cod SET DEFAULT nextval('empresa."Setor_cod_seq"'::regclass);


--
-- TOC entry 2052 (class 2604 OID 16609)
-- Name: Setor cod_empresa; Type: DEFAULT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa."Setor" ALTER COLUMN cod_empresa SET DEFAULT nextval('empresa."Setor_cod_empresa_seq"'::regclass);


--
-- TOC entry 2195 (class 0 OID 16624)
-- Dependencies: 203
-- Data for Name: Departamento; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa."Departamento" (cod, nome, cod_setor) FROM stdin;
1	departamento	1
3	departamento dos bons de coracao e ruim de bolso	3
2	update de nome de departamento	2
5	departamento dos bons de coracao e ruim de bolso eita	7
\.


--
-- TOC entry 2189 (class 0 OID 16548)
-- Dependencies: 197
-- Data for Name: Empresa; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa."Empresa" (cod, "razaoSocial", "nomeFantasia", cnpj, telefone) FROM stdin;
1	rzosocial	nmfntsia	456465464	1313
3	nao buga pfvr	aaaaaa	1456654	56465231
2	razao social	update nome Fansasia	1234658	15151
5	agora vai	adsdasdasdasd	1239875	56465231
7	agora vai7	adsdasdasdasd	1239875	56465231
\.


--
-- TOC entry 2197 (class 0 OID 16641)
-- Dependencies: 205
-- Data for Name: Funcionario; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa."Funcionario" (matricula, nome, cpf, telefone, salario, cod_dep) FROM stdin;
1321321	abelardo	1	1321	R$ 99,90	1
312123213	teste	3	1321	R$ 99,90	1
1321321	funciona pelo amor de jeová	2	1321	R$ 99,90	3
999	brasileirinho	4	132132	R$ 945.649,90	2
\.


--
-- TOC entry 2192 (class 0 OID 16605)
-- Dependencies: 200
-- Data for Name: Setor; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

COPY empresa."Setor" (cod, nome, cod_empresa) FROM stdin;
1	aaaa	1
2	setor teste pfvr funcione	2
3	update nome do setor	3
5	teste de cadastro	3
8	teste de cadastro2	7
\.


--
-- TOC entry 2211 (class 0 OID 0)
-- Dependencies: 201
-- Name: Departamento_cod_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."Departamento_cod_seq"', 5, true);


--
-- TOC entry 2212 (class 0 OID 0)
-- Dependencies: 202
-- Name: Departamento_cod_setor_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."Departamento_cod_setor_seq"', 4, true);


--
-- TOC entry 2213 (class 0 OID 0)
-- Dependencies: 196
-- Name: Empresa_cod_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."Empresa_cod_seq"', 4, true);


--
-- TOC entry 2214 (class 0 OID 0)
-- Dependencies: 204
-- Name: Funcionario_cod_dep_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."Funcionario_cod_dep_seq"', 4, true);


--
-- TOC entry 2215 (class 0 OID 0)
-- Dependencies: 199
-- Name: Setor_cod_empresa_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."Setor_cod_empresa_seq"', 7, true);


--
-- TOC entry 2216 (class 0 OID 0)
-- Dependencies: 198
-- Name: Setor_cod_seq; Type: SEQUENCE SET; Schema: empresa; Owner: postgres
--

SELECT pg_catalog.setval('empresa."Setor_cod_seq"', 8, true);


--
-- TOC entry 2061 (class 2606 OID 16633)
-- Name: Departamento pk_departamento; Type: CONSTRAINT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa."Departamento"
    ADD CONSTRAINT pk_departamento PRIMARY KEY (cod);


--
-- TOC entry 2057 (class 2606 OID 16600)
-- Name: Empresa pk_empresa; Type: CONSTRAINT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa."Empresa"
    ADD CONSTRAINT pk_empresa PRIMARY KEY (cod);


--
-- TOC entry 2063 (class 2606 OID 16649)
-- Name: Funcionario pk_funcionario; Type: CONSTRAINT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa."Funcionario"
    ADD CONSTRAINT pk_funcionario PRIMARY KEY (cpf);


--
-- TOC entry 2059 (class 2606 OID 16614)
-- Name: Setor pk_setor; Type: CONSTRAINT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa."Setor"
    ADD CONSTRAINT pk_setor PRIMARY KEY (cod);


--
-- TOC entry 2065 (class 2606 OID 16634)
-- Name: Departamento fk_departamento; Type: FK CONSTRAINT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa."Departamento"
    ADD CONSTRAINT fk_departamento FOREIGN KEY (cod) REFERENCES empresa."Setor"(cod);


--
-- TOC entry 2066 (class 2606 OID 16650)
-- Name: Funcionario fk_funcionario; Type: FK CONSTRAINT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa."Funcionario"
    ADD CONSTRAINT fk_funcionario FOREIGN KEY (cod_dep) REFERENCES empresa."Departamento"(cod);


--
-- TOC entry 2064 (class 2606 OID 16615)
-- Name: Setor fk_setor; Type: FK CONSTRAINT; Schema: empresa; Owner: postgres
--

ALTER TABLE ONLY empresa."Setor"
    ADD CONSTRAINT fk_setor FOREIGN KEY (cod_empresa) REFERENCES empresa."Empresa"(cod);


-- Completed on 2018-09-30 17:19:12

--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

-- Started on 2018-09-30 17:19:12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2145 (class 0 OID 0)
-- Dependencies: 2144
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 1 (class 3079 OID 12278)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2147 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


-- Completed on 2018-09-30 17:19:12

--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

-- Started on 2018-09-30 17:19:12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2145 (class 0 OID 0)
-- Dependencies: 2144
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- TOC entry 1 (class 3079 OID 12278)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2147 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


-- Completed on 2018-09-30 17:19:12

--
-- PostgreSQL database dump complete
--

-- Completed on 2018-09-30 17:19:12

--
-- PostgreSQL database cluster dump complete
--

