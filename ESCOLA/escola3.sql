-- 5) Baseado nos exercícios anteriores, reconstrua as consultas SQL usando visões:

-- 5.1 Visão que retorne todos os alunos, disciplina e curso
CREATE VIEW view_todos_os_alunos_disciplina_e_curso(
    SELECT * 
    FROM escola."Aluno" A, escola."Disciplina" D, escola."Curso" C);

--    5.1.1 usando a visão anterior uma consulta que retorne todos os alunos de um determinado curso, selecionado pelo código, ordenado pelo nome do aluno
CREATE VIEW view_alunos_determinado_curso_selecionaCod_OrderBy_NomeAluno
(SELECT A.nome, A.ra, C.nome AS "curso_ nome"
    FROM view_todos_os_alunos_disciplina_e_curso 
        INNER JOIN escola."Matricula" M
        ON A.ra = M.ra
            INNER JOIN escola."Disciplina" D 
            ON D.cod = M.cod_disc
                INNER JOIN escola."Curso" C 
                    ON C.cod = D.cod
                    WHERE C.cod = 5
                        ORDER BY A.nome);

                        Select * from ,

--    5.1.2 - Idem ao 5.1.1, porém selecionado pelo nome do curso
CREATE VIEW view_select_Curso_nome
(SELECT C.nome AS "curso_ nome"
    FROM view_alunos_determinado_curso_selecionaCod_OrderBy_NomeAluno
        INNER JOIN escola."Matricula" M
        ON A.ra = M.ra
            INNER JOIN escola."Disciplina" D 
            ON D.cod = M.cod_disc
                INNER JOIN escola."Curso" C 
                    ON C.cod = D.cod
                    WHERE C.cod = 5
                        ORDER BY A.nome;);

-- 5.2 - usando a visão anterior, todas as notas dos alunos
CREATE VIEW view_todas_notas(
SELECT A.nome, A.ra, C.nome AS "curso_ nome"
    FROM view_select_Curso_nome
        INNER JOIN escola."Matricula" M
        ON A.ra = M.ra
            INNER JOIN escola."Disciplina" D 
            ON D.cod = M.cod_disc
                INNER JOIN escola."Nota" N 
                    ON N.ra = M.ra AND N.cod_disc = M.cod_disc
                    WHERE A.ra = 1234
);
--    5.2.1 usando esta visão, todas as notas de um determinado aluno, selecionadas pelo RA do aluno, ordenadas pelo bimestre
CREATE VIEW view_ra_notas(
SELECT A.nome, A.ra, C.nome AS "curso_ nome"
    FROM view_todas_notas 
        INNER JOIN escola."Matricula" M
        ON A.ra = M.ra
            INNER JOIN escola."Disciplina" D 
            ON D.cod = M.cod_disc
                INNER JOIN escola."Nota" N 
                    ON N.ra = M.ra AND N.cod_disc = M.cod_disc
                    WHERE A.ra = 1234
                        ORDER BY N.bimestre;
);
-- 5.3 - Uma visão com todos os professores de um determinado curso
CREATE VIEW view_todos_professores_determinado_curso(
SELECT P.nome, C.nome 
    FROM escola."Professor" P
        INNER JOIN escola."Disciplina" D
        ON P.cod = D.cod
            INNER JOIN escola."Curso" C
            ON D.cod = C.cod_disc
            WHERE C.cod = 1
);
--    5.3.1 - usando esta visão, todas as disciplinas de um determinado professor, selecionado pela matrícula do professor
CREATE VIEW view_todos_as_disciplinas_de_um_prof_selc_matricula_professor(
    SELECT D.nome, P.nome
    FROM view_todos_professores_determinado_curso 
        INNER JOIN escola."Disciplina" D
        ON P.cod_disc = D.cod
            INNER JOIN escola."Matricula" M
            ON D.cod = M.cod_disc
);
--    5.3.2 a média de salários por curso
CREATE VIEW view_media_salario(
    SELECT AVG (P.salario)
    FROM view_todos_as_disciplinas_de_um_prof_selc_matricula_professor 
        INNER JOIN escola."Disciplina" D 
        ON P.cod_disc = D.cod
            INNER JOIN escola."Curso" C 
                ON C.cod_disc = D.cod
                    ORDER BY C.nome
);

-- 5.4 a média de nota de turma de uma determinada disciplina
CREATE VIEW view_media_nota_turma_de_uma_disciplina(
    SELECT  AVG (N.nota)
    FROM view_media_salario A 
        INNER JOIN escola."Matricula" M
        ON A.ra = M.ra
            INNER JOIN escola."Disciplina" D 
            ON D.cod = M.cod_disc
                INNER JOIN escola."Nota" N 
                    ON N.ra = M.ra AND N.cod_disc = M.cod_disc
                    GROUP BY D.ano;
);

-- 5.5 os cursos onde o valor total de salários é maior que 100.000
CREATE VIEW view_salarios_100000_curso(
    SELECT SUM (P.salario)
    FROM escola."Professor" P
        INNER JOIN escola."Disciplina" D
        ON P.cod_disc = D.cod
            INNER JOIN escola."Curso" C
            ON D.cod = C.cod_disc
                WHERE P.salario > 100000
                ORDER BY C.nome;
);