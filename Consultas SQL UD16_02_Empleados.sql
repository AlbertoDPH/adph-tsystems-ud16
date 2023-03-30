-- Consulta SQL Ejercicio 2 Empleados
SELECT apellidos FROM empleados;
SELECT DISTINCT apellidos FROM empleados;
SELECT * FROM empleados WHERE APELLIDOS='Smith';
SELECT * FROM empleados WHERE APELLIDOS='Smith' OR APELLIDOS='Rogers';
SELECT * FROM empleados WHERE DEPARTAMENTO=14;
SELECT * FROM empleados WHERE DEPARTAMENTO=37 OR DEPARTAMENTO=77;
SELECT * FROM empleados WHERE APELLIDOS LIKE'P%';
SELECT SUM(presupuesto) AS PRESUPUESTO_TOTAL FROM departamentos;
SELECT COUNT(*) AS NUM_EMPLEADOS FROM empleados GROUP BY DEPARTAMENTO;
SELECT emp.*, dep.* 
FROM empleados emp
JOIN departamentos dep ON emp.DEPARTAMENTO = dep.CODIGO;
SELECT emp.*, dep.NOMBRE AS NOM_DEPARTAMENTO, dep.PRESUPUESTO
FROM empleados emp, departamentos dep
WHERE emp.DEPARTAMENTO= dep.CODIGO;
SELECT emp.NOMBRE, emp.APELLIDOS, dep.PRESUPUESTO
FROM empleados emp
JOIN departamentos dep ON emp.DEPARTAMENTO=dep.CODIGO
WHERE dep.PRESUPUESTO>60000;
SELECT * FROM departamentos
WHERE PRESUPUESTO>(SELECT AVG(PRESUPUESTO) FROM departamentos);
SELECT dep.NOMBRE
FROM departamentos dep
JOIN empleados emp ON dep.CODIGO = emp.DEPARTAMENTO
GROUP BY dep.CODIGO, dep.NOMBRE
HAVING COUNT(emp.DNI) > 2;
INSERT INTO departamentos(CODIGO,NOMBRE,PRESUPUESTO)
VALUES(11,'Calidad',40000);
INSERT INTO empleados(DNI,NOMBRE,APELLIDOS,DEPARTAMENTO)
VALUES(89267109,'Esther','Vázquez',11);
UPDATE departamentos SET PRESUPUESTO = PRESUPUESTO * 0.10;
update empleados set departamento = 14 where departamento = 77;
delete from empleados where DEPARTAMENTO = 14;
delete from empleados
where DEPARTAMENTO in (select codigo from departamentos where presupuesto > 60000);
delete from empleados;