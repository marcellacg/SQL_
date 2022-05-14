CREATE TABLE exemplo_lotes (
nome varchar(20)
);

SELECT AddGeometryColumn(
'exemplo_lotes', 'geom', 2000, 'POLYGON', 2
);

INSERT INTO exemplo_lotes(nome, geom) 
VALUES ('L1', ST_GeomFromText('POLYGON((3 7, 5 7, 5 4, 3 4, 3 7))', 2000));

INSERT INTO exemplo_lotes(nome, geom) 
VALUES ('L2', ST_GeomFromText('POLYGON((4 0, 11 0, 11 2, 4 2, 4 0))', 2000));

INSERT INTO exemplo_lotes(nome, geom) 
VALUES ('L3', ST_GeomFromText('POLYGON((7 6, 7 8, 11 6, 7 6))', 2000));

INSERT INTO exemplo_lotes(nome, geom) 
VALUES ('L4', ST_GeomFromText('POLYGON((4 7, 7 7, 7 9, 4 9, 4 7))', 2000));

INSERT INTO exemplo_lotes(nome, geom) 
VALUES ('L5', ST_GeomFromText('POLYGON((15 5, 18 5, 19 6, 19 7, 18 8, 14 7, 14 6, 15 5))', 2000));

CREATE TABLE exemplo_quadras (nome varchar(20));

SELECT AddGeometryColumn ('exemplo_quadras', 'geom', 2000, 'POLYGON', 2);

INSERT INTO exemplo_quadras(nome, geom) 
VALUES ('Q1', ST_GeomFromText('POLYGON((2 2, 11 2, 11 9, 2 9, 2 2))', 2000));

INSERT INTO exemplo_quadras(nome, geom) 
VALUES ('Q2', ST_GeomFromText('POLYGON((14 3, 18 3, 20 7, 18 11, 14 11, 12 7, 14 3))', 2000));


SELECT DISTINCT l4.nome, lx.nome
FROM exemplo_lotes l4, exemplo_lotes lx
WHERE ST_Touches(l4.geom, lx.geom)
AND l4.nome = 'L4'


SELECT COUNT(l1.nome)
FROM exemplo_lotes l1, exemplo_quadras qx
WHERE ST_Within(l1.geom, qx.geom)
AND qx.nome = 'Q1'


SELECT ST_Distance(q1.geom, qx.geom)
FROM exemplo_quadras q1, exemplo_quadras qx
WHERE q1.nome = 'Q1' AND qx.nome = 'Q2'

SELECT ST_Distance(l1.geom, lx.geom)
FROM exemplo_lotes l1, exemplo_lotes lx
WHERE l1.nome = 'L2' AND lx.nome = 'L5'

SELECT ST_Area(geom)
FROM exemplo_lotes;