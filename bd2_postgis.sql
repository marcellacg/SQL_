CREATE TABLE geometrias(
	nome varchar(100),
	geom geometry
);


INSERT INTO geometrias VALUES ('Ponto', 'POINT(0 0)');
INSERT INTO geometrias VALUES ('Linha', 'LINESTRING(0 0, 1 1, 2 1, 2 2)');
								 
INSERT INTO geometrias VALUES ('Poligono', 'POLYGON((0 0, 1 1, 0 1, 0 0))');

SELECT * FROM geometrias;

SELECT ST_AsText(geom) FROM geometrias;