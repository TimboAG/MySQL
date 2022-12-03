DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricantes (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE productos (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricantes(codigo)
);

INSERT INTO fabricantes VALUES(1, 'Asus');
INSERT INTO fabricantes VALUES(2, 'Lenovo');
INSERT INTO fabricantes VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricantes VALUES(4, 'Samsung');
INSERT INTO fabricantes VALUES(5, 'Seagate');
INSERT INTO fabricantes VALUES(6, 'Crucial');
INSERT INTO fabricantes VALUES(7, 'Gigabyte');
INSERT INTO fabricantes VALUES(8, 'Huawei');
INSERT INTO fabricantes VALUES(9, 'Xiaomi');

INSERT INTO productos VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO productos VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO productos VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO productos VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO productos VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO productos VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO productos VALUES(12, 'Monitor 24 LED Full HD', 203, 1);

INSERT INTO productos VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO productos VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO productos VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO productos VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO productos VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);




SELECT nombre FROM productos;

SELECT nombre, precio FROM productos;

SELECT * FROM productos;

SELECT nombre, ROUND(precio) FROM productos;

SELECT productos.codigo_fabricante, fabricantes.nombre 
FROM productos INNER JOIN fabricantes ON productos.codigo_fabricante = fabricantes.codigo;

/*SELECT productos.codigo_fabricante, fabricantes.nombre 
FROM productos, fabricantes where  fabricantes.codigo =  productos.codigo_fabricante;*/

SELECT DISTINCT productos.codigo_fabricante, fabricantes.nombre 
FROM productos INNER JOIN fabricantes ON productos.codigo_fabricante = fabricantes.codigo ;

SELECT nombre 
FROM fabricantes ORDER BY nombre ASC;


SELECT nombre, precio 
FROM productos ORDER BY nombre ASC, precio ASC;

SELECT * 
FROM fabricantes LIMIT 0,5;


SELECT nombre, precio 
FROM productos ORDER BY precio ASC, precio DESC LIMIT 0,1;

SELECT nombre, precio 
FROM productos ORDER BY precio DESC, precio ASC LIMIT 0,1;

SELECT nombre, precio 
FROM productos where precio <= 120;

SELECT nombre, precio 
FROM productos where precio BETWEEN 60 AND 200;

SELECT nombre, codigo_fabricante
FROM productos where codigo_fabricante IN (1, 3, 5);

SELECT nombre 
FROM productos where nombre LIKE 'Portátil%';

SELECT productos.codigo_fabricante, productos.nombre , fabricantes.codigo, fabricantes.nombre
FROM productos INNER JOIN fabricantes ON productos.codigo_fabricante = fabricantes.codigo;

SELECT  productos.nombre , productos.precio, fabricantes.nombre
FROM productos INNER JOIN fabricantes ON productos.codigo_fabricante = fabricantes.codigo ORDER BY fabricantes.nombre ASC;

SELECT  productos.nombre , productos.precio, fabricantes.nombre
FROM productos INNER JOIN fabricantes ON productos.codigo_fabricante = fabricantes.codigo ORDER BY productos.precio ASC;


SELECT productos.nombre , productos.precio, fabricantes.nombre FROM fabricantes
INNER JOIN productos ON  productos.codigo_fabricante = fabricantes.codigo   where  fabricantes.nombre  LIKE 'Lenovo' ;

SELECT productos.nombre, productos.precio, fabricantes.nombre FROM fabricantes
INNER JOIN productos ON productos.codigo_fabricante = fabricantes.codigo where productos.precio > 200 ORDER BY productos.precio ASC;

SELECT productos.*,  fabricantes.nombre FROM fabricantes
INNER JOIN productos ON productos.codigo_fabricante = fabricantes.codigo WHERE fabricantes.nombre IN ('Asus', 'Hewlett-Packard');

SELECT productos.nombre, productos.precio, fabricantes.nombre FROM fabricantes
INNER JOIN productos ON productos.codigo_fabricante = fabricantes.codigo where productos.precio >= 180 ORDER BY productos.precio DESC;

SELECT productos.nombre, productos.precio, fabricantes.nombre FROM fabricantes
INNER JOIN productos ON productos.codigo_fabricante = fabricantes.codigo where productos.precio >= 180 ORDER BY productos.precio ASC ;

/**/


SELECT
productos.*, fabricantes.nombre
FROM fabricantes
LEFT JOIN productos
ON productos.codigo_fabricante = fabricantes.codigo;

SELECT
productos.*, fabricantes.nombre
FROM fabricantes
RIGHT JOIN productos
ON productos.codigo_fabricante = fabricantes.codigo;

Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún
producto asociado.
/* ?????????*/
SELECT
productos.*, fabricantes.nombre
FROM fabricantes
LEFT JOIN productos
ON productos.codigo_fabricante = fabricantes.codigo ;

SELECT
fabricantes.nombre
FROM fabricantes
RIGHT JOIN productos
ON productos.codigo_fabricante = fabricantes.codigo ;

SELECT nombre , precio, codigo_fabricante AS 'Lenovo'  FROM productos 
WHERE codigo_fabricante =2;



SELECT *  FROM productos 
WHERE precio > (SELECT MAX(precio)  FROM productos 
WHERE codigo_fabricante =2 );



SELECT nombre  FROM productos 
WHERE codigo_fabricante =2 ORDER BY precio DESC LIMIT 0,1;


SELECT *  FROM productos 
WHERE codigo_fabricante =1 AND precio > (SELECT AVG(precio)  FROM productos );



SELECT nombre  FROM fabricantes 
WHERE codigo IN (SELECT codigo_fabricante  FROM productos );

SELECT nombre  FROM fabricantes 
WHERE codigo NOT IN (SELECT codigo_fabricante  FROM productos );


SELECT nombre  FROM fabricantes 
WHERE codigo NOT IN (SELECT codigo_fabricante  FROM productos );


select fabricantes.nombre, count(productos.codigo) from fabricantes, productos where productos.codigo_fabricante = fabricantes.codigo 
group by fabricantes.codigo having count(productos.codigo) = (SELECT count(codigo)
FROM productos WHERE  codigo_fabricante = 2 );


