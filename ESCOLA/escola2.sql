/*
|Breno Ribeiro Teodoro
|23/10/2018
*/
-- 4) Baseado no exercício anterior, considerando a existência de um campo salário para professor, construa as consultas SQL para retornar:

-- 4.1 o valor total de salários
SELECT SUM (salario) FROM Professor;

-- 4.2 a média de salários por curso
SELECT AVG (P.salario) AS "media_salario_curso"
    FROM escola."Professor" P 
        INNER JOIN escola."Disciplina" D 
        ON P.cod_disc = D.cod
            INNER JOIN escola."Curso" C 
                ON C.cod_disc = D.cod
                    ORDER BY C.nome;

-- 4.3 a média de nota de turma de uma determinada disciplina
SELECT  AVG (N.nota) AS "media_nota_turma_disciplina"
    FROM escola."Aluno" A 
        INNER JOIN escola."Matricula" M
        ON A.ra = M.ra
            INNER JOIN escola."Disciplina" D 
            ON D.cod = M.cod_disc
                INNER JOIN escola."Nota" N 
                    ON N.ra = M.ra AND N.cod_disc = M.cod_disc
                    GROUP BY D.ano;

-- 4.4 as disciplinas com o custo de salário de professor maior que 10.000
SELECT P.nome, D.nome 
    FROM escola."Professor" P 
        INNER JOIN escola."Disciplina" D 
        ON P.cod_disc = D.cod
            WHERE P.salario > 10000
                ORDER BY D.nome;

-- 4.5 os cursos onde o valor total de salários é maior que 100.000
SELECT SUM (P.salario)
    FROM escola."Professor" P
        INNER JOIN escola."Disciplina" D
        ON P.cod_disc = D.cod
            INNER JOIN escola."Curso" C
            ON D.cod = C.cod_disc
                WHERE P.salario > 100000
                ORDER BY C.nome;