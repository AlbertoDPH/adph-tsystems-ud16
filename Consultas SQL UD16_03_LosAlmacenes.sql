-- Consulta SQL Ejercicio 3 Los Almacenes
SELECT * FROM almacenes;
SELECT * FROM cajas WHERE valor>150;
SELECT contenido FROM cajas;
SELECT AVG(valor) AS VALOR_MEDIO FROM cajas;
SELECT almacen, AVG(valor) AS VALOR_MEDIO
FROM cajas
GROUP BY almacen;
SELECT almacen
FROM cajas
GROUP BY almacen
HAVING AVG(valor) > 150;
SELECT caj.num_referencia, alm.lugar
FROM cajas caj
JOIN almacenes alm ON caj.almacen = alm.codigo;
SELECT almacen, COUNT(num_referencia) AS CANTIDAS_CAJAS
FROM cajas
GROUP BY almacen;
SELECT codigo FROM almacenes
WHERE capacidad < (
SELECT COUNT(*) FROM cajas WHERE almacen= codigo);
SELECT c.num_referencia
FROM cajas c
JOIN almacenes a ON c.almacen = a.codigo
WHERE a.lugar = 'Barcelona';
INSERT INTO almacenes(lugar, capacidad)
VALUES('Bilbao',3);
INSERT INTO cajas(num_referencia,contenido,valor,almacen)
VALUES('H5RT','Papel',200,2);
UPDATE cajas
SET valor = valor * 0.85; 
UPDATE cajas
SET valor = valor * 0.80
WHERE valor > (SELECT AVG(valor) FROM cajas);
DELETE FROM cajas
WHERE valor < 2000;
DELETE FROM cajas WHERE almacen IN(
SELECT codigo FROM almacenes WHERE capacidad < (
SELECT COUNT(*) FROM cajas WHERE almacen = codigo);