-- Consulta SQL Ejercicio 4 Peliculas y Salas
SELECT nombre FROM peliculas;
SELECT calificacion_edad FROM peliculas;
SELECT * FROM peliculas WHERE calificacion_edad IS NULL;
SELECT * FROM salas WHERE pelicula IS NULL;
SELECT sal.*, pel.*
FROM salas sal
LEFT JOIN peliculas pel ON sal.pelicula = pel.cod_pelicula;
SELECT pel.*, sal.*
FROM peliculas pel
LEFT JOIN salas sal ON pel.cod_pelicula = sal.pelicula;
SELECT pel.nombre
FROM peliculas pel
LEFT JOIN salas sal ON pel.cod_pelicula = sal.pelicula
WHERE sal.pelicula IS NULL;
INSERT INTO peliculas (cod_pelicula, nombre, calificacion_edad)
VALUES (6, 'Uno, Dos, Tres', 7);
UPDATE peliculas
SET calificacion_edad = 13
WHERE calificacion_edad IS NULL;
DELETE FROM salas
WHERE pelicula IN (SELECT cod_pelicula FROM peliculas WHERE calificacion_edad = 0);