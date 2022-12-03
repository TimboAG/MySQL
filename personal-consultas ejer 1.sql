DROP DATABASE IF EXISTS personal;
CREATE DATABASE personal CHARACTER SET utf8mb4;
USE personal;

CREATE TABLE departamento (
  id_depto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  nombre_depto VARCHAR(20) NOT NULL,
  ciudad VARCHAR(15) NULL,
  codigo_director VARCHAR(12) NULL
);


CREATE TABLE empleado (
  id_empleado INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre CHAR(30) NOT NULL,
  sexo_empleado CHAR(1) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  fecha_incorporacion DATE NOT NULL,
  salario FLOAT NOT NULL,
  comision FLOAT NOT NULL,
  cargo VARCHAR(15) NOT NULL,
  cod_jefe VARCHAR(12) NULL,  
  id_depto INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_depto) REFERENCES departamento(id_depto)
  );


-- Insertar datos en la tabla `departamento`

INSERT INTO `departamento` VALUES (1000,'GERENCIA','CIUDAD REAL','31.840.269');
INSERT INTO `departamento` VALUES (1500,'PRODUCCIÓN','CIUDAD REAL','16.211.383');
INSERT INTO `departamento` VALUES (2000,'VENTAS','CIUDAD REAL','31.178.144');
INSERT INTO `departamento` VALUES (2100,'VENTAS','BARCELONA','16.211.383');
INSERT INTO `departamento` VALUES (2200,'VENTAS','VALENCIA','16.211.383');
INSERT INTO `departamento` VALUES (2300,'VENTAS','MADRID','16.759.060');
INSERT INTO `departamento` VALUES (3000,'INVESTIGACIÓN','CIUDAD REAL','16.759.060');
INSERT INTO `departamento` VALUES (3500,'MERCADEO','CIUDAD REAL','22.222.222');
INSERT INTO `departamento` VALUES (4000,'MANTENIMIENTO','CIUDAD REAL','333.333.333');
INSERT INTO `departamento` VALUES (4100,'MANTENIMIENTO','BARCELONA','16.759.060');
INSERT INTO `departamento` VALUES (4200,'MANTENIMIENTO','VALENCIA','16.759.060');
INSERT INTO `departamento` VALUES (4300,'MANTENIMIENTO','MADRID','16.759.060');

-- Insertar datos en la tabla `empleado`

INSERT INTO `empleado` VALUES (222,'José Giraldo','M','1985-01-20','2000-11-01',1200000,400000,'Asesor','22.222.222',3500);
INSERT INTO `empleado` VALUES (333,'Pedro Blanco','M','1987-10-28','2000-10-01',800000,3000000,'Vendedor','31.178.144',2000);
INSERT INTO `empleado` VALUES (444,'Jesús Alfonso','M','1988-03-14','2000-10-01',800000,3500000,'Vendedor','31.178.144',2000);
INSERT INTO `empleado` VALUES (555,'Julián Mora','M','1989-07-03','2000-10-01',800000,3100000,'Vendedor','31.178.144',2200);
INSERT INTO `empleado` VALUES (666,'Manuel Millán','M','1990-12-08','2004-06-01',800000,3700000,'Vendedor','31.178.144',2300);
INSERT INTO `empleado` VALUES (777,'Marcos Cortez','M','1986-06-23','2000-04-16',2550000,500000,'Mecánico','333.333.333',4000);
INSERT INTO `empleado` VALUES (782,'Antonio Gil','M','1980-01-23','2010-04-16',850000,1500000,'Técnico','16.211.383',1500);
INSERT INTO `empleado` VALUES (219,'Melissa Roa','F','1960-06-19','2001-03-16',2250000,2500000,'Vendedor','31.178.144',2100);
INSERT INTO `empleado` VALUES (111,'Irene Díaz','F','1979-09-28','2004-06-01',1050000,200000,'Mecánico','333.333.333',4200);
INSERT INTO `empleado` VALUES (383,'Luis Pérez','M','1956-02-25','2000-01-01',5050000,0,'Director','31.840.269',1500);
INSERT INTO `empleado` VALUES (060,'Darío Casas','M','1960-04-05','1992-11-01',4500000,500000,'Investigador','31.840.269',3000);
INSERT INTO `empleado` VALUES (802,'William Daza','M','1982-10-09','1999-12-16',2250000,1000000,'Investigador','16.759.060',3000);
INSERT INTO `empleado` VALUES (221,'Carla López','F','1975-05-11','2005-07-16',4500000,500000,'Jefe Mercadeo','31.840.269',3500);
INSERT INTO `empleado` VALUES (331,'Carlos Rozo','M','1975-05-11','2001-09-16',750000,500000,'Vigilante','31.840.269',3500);
INSERT INTO `empleado` VALUES (099,'Diana Solarte','F','1957-11-19','1990-05-16',1250000,500000,'Secretaria','31.840.269',1000);
INSERT INTO `empleado` VALUES (144,'Rosa Angulo','F','1957-03-15','1998-08-16',3250000,3500000,'Jefe Ventas','31.840.269',2000);
INSERT INTO `empleado` VALUES (269,'María Rojas','F','1959-01-15','1990-05-16',6250000,1500000,'Gerente',NULL,1000);
INSERT INTO `empleado` VALUES (343,'Elisa Rojas','F','1979-09-28','2004-06-01',3000000,1000000,'Jefe Mecánicos','31.840.269',4000);
INSERT INTO `empleado` VALUES (334,'Marisol Pulido','F','1979-10-01','1990-05-16',3250000,1000000,'Investigador','16.759.060',3000);
INSERT INTO `empleado` VALUES (335,'Ana Moreno','F','1992-01-05','2004-06-01',1200000,400000,'Secretaria','16.759.060',3000);
INSERT INTO `empleado` VALUES (336,'Carolina Ríos','F','1992-02-15','2000-10-01',1250000,500000,'Secretaria','16.211.383',1500);
INSERT INTO `empleado` VALUES (337,'Edith Muñoz','F','1992-03-31','2000-10-01',800000,3600000,'Vendedor','31.178.144',2100);
INSERT INTO `empleado` VALUES (338,'Abel Gómez','M','1939-12-24','2000-10-01',1050000,200000,'Mecánico','333.333.333',4300);
INSERT INTO `empleado` VALUES (689,'Mario Llano','M','1945-08-30','1990-05-16',2250000,2500000,'Vendedor','31.178.144',2300);
INSERT INTO `empleado` VALUES (785,'Joaquín Rosas','M','1947-07-07','1990-05-16',2250000,2500000,'Vendedor','31.178.144',2200);
INSERT INTO `empleado` VALUES (898,'Iván Duarte','M','1955-08-12','1998-05-16',1050000,200000,'Mecánico','333.333.333',4100);


SELECT * FROM empleado;

SELECT * FROM departamento;

SELECT nombre_depto FROM departamento;

SELECT nombre, salario  FROM empleado;

SELECT comision FROM empleado ORDER BY comision ASC;

SELECT * FROM empleado WHERE cargo LIKE 'Secretaria';

SELECT * FROM empleado WHERE cargo LIKE 'Vendedor' ORDER BY nombre ASC;

SELECT nombre, cargo, salario FROM empleado WHERE salario ORDER BY salario ASC;

SELECT nombre AS 'Nombre', cargo AS 'Cargo'FROM empleado ORDER BY nombre ASC;

/*SELECT empleado.salario, empleado.comision, departamento.id_depto FROM empleado 
INNER JOIN departamento ON empleado.id_depto = departamento.id_depto where departamento.id_depto like '2000'
order by empleado.comision ASC;*/

SELECT salario, comision, nombre FROM empleado 
WHERE id_depto = '2000'
ORDER BY comision ASC;


/*SELECT departamento.id_depto, empleado.nombre, empleado.salario, empleado.comision,  (empleado.salario + empleado.comision + 500000) as 'Salario Total= $'  
FROM Empleado INNER JOIN departamento ON empleado.id_depto = departamento.id_depto where departamento.id_depto like '3000'
order by empleado.nombre ASC;*/

SELECT id_depto, nombre,  salario, comision,  (salario + comision + 500000) AS 'Salario Total= $'  FROM empleado 
WHERE id_depto = '3000'
ORDER BY nombre ASC;


SELECT nombre FROM empleado WHERE nombre LIKE'J%';

SELECT nombre, salario, comision,   (salario + comision) AS 'Salario Total= $'  
FROM empleado WHERE comision > 1000000 
ORDER BY comision  ASC;

SELECT nombre, salario, comision,   (salario + comision) AS 'Salario Total= $'  
FROM Empleado WHERE comision = 0;

SELECT nombre, salario, comision FROM empleado WHERE comision <= (salario * 0.3);

SELECT nombre FROM empleado WHERE nombre NOT LIKE '%ma%'  ORDER BY nombre ASC;

SELECT nombre_depto FROM departamento WHERE nombre_depto  IN ('VENTAS', 'INVESTIGACIÓN', 'MANTENIMIENTO') ORDER BY nombre_depto ASC;

SELECT nombre_depto FROM departamento WHERE nombre_depto NOT IN ('VENTAS', 'INVESTIGACIÓN', 'MANTENIMIENTO') ORDER BY nombre_depto ASC;

SELECT  nombre, id_empleado, salario FROM empleado WHERE salario = (SELECT max(salario) FROM Empleado)  ;

SELECT  nombre FROM empleado  ORDER BY nombre DESC LIMIT 0,1 ;

SELECT   max(salario) AS 'Salario minimo' , min(salario)  AS 'Salario maximo', max(salario) - min(salario) AS 'diferencia' FROM Empleado;

SELECT AVG(salario) AS 'promedio' FROM empleado;

SELECT d.nombre_depto, e.id_depto, AVG(e.salario) AS 'PROMEDIO'
FROM empleado e , departamento d
WHERE d.id_depto = e.id_depto
GROUP BY id_depto;
/*offset (paginacion)
nombre de tabla en plural
atributos singular*/

SELECT departamento.id_depto, departamento.nombre_depto, count(empleado.id_depto) AS 'Num empleados'
FROM departamento, empleado WHERE departamento.id_depto = empleado.id_depto
GROUP BY  departamento.id_depto HAVING  count(empleado.id_depto) >= 3;



SELECT empleado.cod_jefe, empleado.nombre, count(empleado.cod_jefe) AS 'Num empleados'
FROM departamento, empleado WHERE departamento.id_depto = empleado.id_depto
GROUP BY  empleado.cod_jefe HAVING  count(empleado.cod_jefe) >= 2;

SELECT empleado.cod_jefe, empleado.nombre, count(empleado.cod_jefe) AS 'Num empleados'
FROM departamento, empleado WHERE departamento.id_depto = empleado.id_depto
GROUP BY  empleado.cod_jefe HAVING  count(empleado.cod_jefe) = 0;

SELECT departamento.id_depto, departamento.nombre_depto, count(empleado.id_depto) AS 'Num empleados'
FROM departamento, empleado WHERE departamento.id_depto = empleado.id_depto
GROUP BY  departamento.id_depto HAVING  count(empleado.id_depto) = 0;


SELECT d.nombre_depto, e.id_depto, e.salario 
FROM empleado e , departamento d
WHERE  d.id_depto = e.id_depto and salario >= (select avg(salario) from empleado  )
GROUP BY id_depto;

