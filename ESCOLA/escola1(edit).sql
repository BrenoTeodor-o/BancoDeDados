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