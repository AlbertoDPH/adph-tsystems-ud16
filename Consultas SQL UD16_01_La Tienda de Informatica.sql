-- Consulta SQL Ejercicio 1 La Tienda de Informática
SELECT NOMBRE FROM articulos;
SELECT NOMBRE, PRECIO FROM articulos;
SELECT NOMBRE FROM articulos WHERE PRECIO <=200;
SELECT * FROM articulos WHERE PRECIO BETWEEN 60 AND 120;
SELECT NOMBRE, PRECIO * 166.386 AS PRECIO_PESETAS FROM articulos;
SELECT AVG(PRECIO) AS 'PRECIO MEDIO ARTICULOS' FROM articulos;
SELECT AVG(PRECIO) AS 'PRECIO MEDIO ARTICULOS FABR2' FROM articulos WHERE FABRICANTE=2;
SELECT COUNT(PRECIO) AS 'PRECIO > 180' FROM articulos WHERE PRECIO >=180;
SELECT NOMBRE, PRECIO FROM articulos WHERE PRECIO >=180 ORDER BY PRECIO DESC, NOMBRE ASC;
SELECT articulos.*, fabricantes.NOMBRE AS NOMBRE_FABR
FROM articulos
JOIN fabricantes
ON articulos.FABRICANTE=fabricantes.CODIGO;
SELECT articulos.NOMBRE, articulos.PRECIO, fabricantes.NOMBRE AS NOMBRE_FABR
FROM articulos
JOIN fabricantes
ON articulos.FABRICANTE=fabricantes.CODIGO;
SELECT FABRICANTE, AVG(PRECIO) AS PRECIO_MEDIO
FROM articulos
GROUP BY FABRICANTE;
SELECT fabricante.NOMBRE, AVG(articulo.PRECIO) AS PRECIO_MEDIO
FROM articulos articulo
JOIN fabricantes fabricante
ON articulo.FABRICANTE=fabricante.CODIGO
GROUP BY articulo.FABRICANTE;
SELECT fabricante.NOMBRE AS NOMBRE_FABR
FROM articulos articulo
JOIN fabricantes fabricante
ON articulo.FABRICANTE=fabricante.CODIGO
GROUP BY articulo.FABRICANTE
HAVING AVG(articulo.PRECIO) >=150;
SELECT NOMBRE, PRECIO
FROM articulos
WHERE PRECIO = (SELECT MIN(PRECIO) FROM articulos); 
SELECT articulo.NOMBRE, articulo.PRECIO, fabricante.NOMBRE AS NONBRE_FABR
FROM articulos articulo
JOIN fabricantes fabricante ON articulo.FABRICANTE=fabricante.CODIGO
WHERE articulo.PRECIO IN(SELECT MAX(PRECIO) FROM articulos GROUP BY FABRICANTE);
INSERT INTO articulos VALUES (11,'Altavoces',70,2);

-- Desactivamos el modo seguro para hacer actualizaciones
SET SQL_SAFE_UPDATES = 0; 
UPDATE articulos SET NOMBRE='Impresora Laser' WHERE CODIGO=8;
UPDATE articulos SET PRECIO = PRECIO*0.9 WHERE CODIGO >0;
UPDATE articulos SET PRECIO = PRECIO-10 WHERE PRECIO >=120;

-- Activamos el modo seguro
SET SQL_SAFE_UPDATES = 1;