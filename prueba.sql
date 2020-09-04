CREATE DATABASE facturas;
\c facturas

CREATE TABLE clientes(id SERIAL PRIMARY KEY, nombre VARCHAR(50), rut VARCHAR(10) UNIQUE NOT NULL, direccion VARCHAR(75), comuna VARCHAR(50), region VARCHAR(25));

CREATE TABLE categorias(id SERIAL PRIMARY KEY, nombre VARCHAR(50) NOT NULL UNIQUE, descripcion VARCHAR(100) DEFAULT 'sin descripcion');

CREATE TABLE facturas(id SERIAL PRIMARY KEY, fecha_factura DATE NOT NULL DEFAULT NOW()::DATE, subtotal FLOAT, iva FLOAT, precio_total FLOAT);

CREATE TABLE productos(id SERIAL PRIMARY KEY, nombre VARCHAR(50), descripcion VARCHAR(100) DEFAULT 'sin descripcion', valor_unitario FLOAT);

CREATE TABLE clientes_facturas(cliente_id INT NOT NULL, factura_id INT NOT NULL, FOREIGN KEY(cliente_id) REFERENCES clientes(id), FOREIGN KEY(factura_id) REFERENCES facturas(id));

CREATE TABLE listado_productos(id SERIAL PRIMARY KEY, factura_id INT, producto_id INT, FOREIGN KEY(factura_id) REFERENCES facturas(id), FOREIGN KEY(producto_id) REFERENCES productos(id), cantidad INT NOT NULL, valortotal_p INT );

CREATE TABLE productos_categorias (categoria_id INT, FOREIGN KEY (categoria_id) REFERENCES categorias(id), producto_id INT, FOREIGN KEY (producto_id) REFERENCES productos(id));

--5 clientes
INSERT INTO clientes(nombre, rut, direccion, comuna, region) VALUES ('francisca gonzalez', 1, 'portugal 12','santiago', 'RM'), ('ignacio reyes', 12, 'providencia 1665', 'providencia', 'RM'), ('maria pino', 123, 'campiñas 12', 'rancagua', 'ohiggins'), ('manuel cisternas', 1234, 'Coquimbo 394', 'santiago', 'RM'), ('Melisa reyes', 12345, 'alameda 2', 'la cisterna', 'RM');

--8 productos
INSERT INTO productos(nombre, valor_unitario) VALUES ('manzana', 500), ('lechuga', 750), ('garbanzos', 400), ('lentejas', 750), ('acelgas', 700), ('naranjas', 650), ('peras', 500), ('quinoa', 1000);

--3 categorias
INSERT INTO categorias(nombre) VALUES ('frutas'), ('verduras'),('legumbres');

--ingresar productos a categorias
INSERT INTO productos_categorias(categoria_id, producto_id) VALUES (1,1), (2,2),(3,3), (3,4), (2,5), (1,6), (1,7), (1,8);

--10 facturas (para crear los ids)
INSERT INTO facturas(subtotal) VALUES(0);
INSERT INTO facturas(subtotal) VALUES(0);
INSERT INTO facturas(subtotal) VALUES(0);
INSERT INTO facturas(subtotal) VALUES(0);
INSERT INTO facturas(subtotal) VALUES(0);
INSERT INTO facturas(subtotal) VALUES(0);
INSERT INTO facturas(subtotal) VALUES(0);
INSERT INTO facturas(subtotal) VALUES(0);
INSERT INTO facturas(subtotal) VALUES(0);
INSERT INTO facturas(subtotal) VALUES(0);

--2 para el cliente 1, con 2 y 3 productos distintos
--3 para el cliente 2, con 3, 2 y 3 productos distintos
--1 para el cliente 3, con 1 producto distintos
--4 para el cliente 4, con 2, 3, 4 y 1 producto distintos
INSERT INTO clientes_facturas(cliente_id, factura_id) VALUES (1, 1), (1, 2), (2, 3), (2, 4), (2, 5), (3, 6), (4, 7), (4, 8), (4, 9), (4, 10);
INSERT INTO listado_productos(factura_id, producto_id, cantidad) VALUES (1,4,2), (1,2,1),(2,2,1), (2,3,2), (2,4,1), (3,1,1), (3,3,2),(3,4,1), (4, 5, 2),(4,1,2), (5,6,2), (5,4,1), (5,2,1), (6,7,1), (7,8,2), (7,1,1), (8,7,1), (8,2,2), (8,1,1), (9,3,2), (9,4,2), (9,4,1), (9,3,2), (10,3,1);

--valor por producto y cantidad
--SELECT valor_unitario*cantidad AS subtotal, factura_id FROM productos p JOIN listado_productos l ON p.id=l.producto_id;

--set valor por producto y cantidad
--Una factura tiene un listado de productos, con su precio unitario, cantidad, y 
---- valor total por producto
UPDATE listado_productos l SET valortotal_p=(SELECT (valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE l.id=1) WHERE l.id=1;
UPDATE listado_productos l SET valortotal_p=(SELECT (valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE l.id=2) WHERE l.id=2;
UPDATE listado_productos l SET valortotal_p=(SELECT (valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE l.id=3) WHERE l.id=3;
UPDATE listado_productos l SET valortotal_p=(SELECT (valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE l.id=4) WHERE l.id=4;
UPDATE listado_productos l SET valortotal_p=(SELECT (valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE l.id=5) WHERE l.id=5;
UPDATE listado_productos l SET valortotal_p=(SELECT (valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE l.id=6) WHERE l.id=6;
UPDATE listado_productos l SET valortotal_p=(SELECT (valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE l.id=7) WHERE l.id=7;
UPDATE listado_productos l SET valortotal_p=(SELECT (valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE l.id=8) WHERE l.id=8;
UPDATE listado_productos l SET valortotal_p=(SELECT (valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE l.id=9) WHERE l.id=9;
UPDATE listado_productos l SET valortotal_p=(SELECT (valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE l.id=10) WHERE l.id=10;
UPDATE listado_productos l SET valortotal_p=(SELECT (valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE l.id=11) WHERE l.id=11;
UPDATE listado_productos l SET valortotal_p=(SELECT (valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE l.id=12) WHERE l.id=12;
UPDATE listado_productos l SET valortotal_p=(SELECT (valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE l.id=13) WHERE l.id=13;
UPDATE listado_productos l SET valortotal_p=(SELECT (valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE l.id=14) WHERE l.id=14;
UPDATE listado_productos l SET valortotal_p=(SELECT (valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE l.id=15) WHERE l.id=15;
UPDATE listado_productos l SET valortotal_p=(SELECT (valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE l.id=16) WHERE l.id=16;
UPDATE listado_productos l SET valortotal_p=(SELECT (valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE l.id=17) WHERE l.id=17;
UPDATE listado_productos l SET valortotal_p=(SELECT (valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE l.id=18) WHERE l.id=18;
UPDATE listado_productos l SET valortotal_p=(SELECT (valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE l.id=19) WHERE l.id=19;
UPDATE listado_productos l SET valortotal_p=(SELECT (valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE l.id=20) WHERE l.id=20;
UPDATE listado_productos l SET valortotal_p=(SELECT (valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE l.id=21) WHERE l.id=21;
UPDATE listado_productos l SET valortotal_p=(SELECT (valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE l.id=22) WHERE l.id=22;
UPDATE listado_productos l SET valortotal_p=(SELECT (valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE l.id=23) WHERE l.id=23;
UPDATE listado_productos l SET valortotal_p=(SELECT (valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE l.id=24) WHERE l.id=24;

--revisar los subtotales por factura
--SELECT sum(valor_unitario*cantidad) AS subtotal, factura_id FROM productos p JOIN listado_productos l ON p.id=l.producto_id GROUP BY (factura_id);

--Para la factura se deberá almacenar el subtotal de la factura, que corresponde a la suma de todos los valores unitarios multiplicado por la cantidad respectiva.
UPDATE facturas SET subtotal=(SELECT SUM(valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE factura_id=1) WHERE id=1;
UPDATE facturas SET subtotal=(SELECT SUM(valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE factura_id=2) WHERE id=2;
UPDATE facturas SET subtotal=(SELECT SUM(valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE factura_id=3) WHERE id=3;
UPDATE facturas SET subtotal=(SELECT SUM(valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE factura_id=4) WHERE id=4;
UPDATE facturas SET subtotal=(SELECT SUM(valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE factura_id=5) WHERE id=5;
UPDATE facturas SET subtotal=(SELECT SUM(valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE factura_id=6) WHERE id=6;
UPDATE facturas SET subtotal=(SELECT SUM(valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE factura_id=7) WHERE id=7;
UPDATE facturas SET subtotal=(SELECT SUM(valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE factura_id=8) WHERE id=8;
UPDATE facturas SET subtotal=(SELECT SUM(valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE factura_id=9) WHERE id=9;
UPDATE facturas SET subtotal=(SELECT SUM(valor_unitario*cantidad) FROM productos p JOIN listado_productos l ON p.id=l.producto_id WHERE factura_id=10) WHERE id=10;
--set los ivas
UPDATE facturas SET iva=subtotal*0.19;
--set precio total como entero
UPDATE facturas SET precio_total=CEILING(subtotal+iva);

--¿Que cliente realizó la compra más cara?
SELECT nombre FROM clientes JOIN clientes_facturas ON clientes.id=clientes_facturas.cliente_id JOIN facturas ON facturas.id=clientes_facturas.factura_id ORDER BY(precio_total) DESC LIMIT(1);

--¿Que cliente pagó sobre 100 de monto?
SELECT nombre FROM clientes JOIN clientes_facturas ON clientes.id=clientes_facturas.cliente_id JOIN facturas ON facturas.id=clientes_facturas.factura_id WHERE precio_total > 100 GROUP BY(nombre);

--¿Cuantos clientes han comprado el producto 6
SELECT count(nombre) FROM clientes JOIN clientes_facturas ON clientes.id=clientes_facturas.cliente_id JOIN facturas ON facturas.id=clientes_facturas.factura_id JOIN listado_productos ON facturas.id=listado_productos.factura_id WHERE producto_id=6;
