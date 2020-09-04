CREATE DATABASE facturas;
\c facturas

CREATE TABLE clientes(id SERIAL PRIMARY KEY, nombre VARCHAR(50), rut VARCHAR(10) UNIQUE NOT NULL, direccion VARCHAR(75), comuna VARCHAR(50), region VARCHAR(25));

CREATE TABLE categorias(id SERIAL PRIMARY KEY, nombre VARCHAR(50) NOT NULL UNIQUE, descripcion VARCHAR(100) DEFAULT 'sin descripcion');

-- FUNCIONA CON SQL NO CON POSTGRE 
-- CREATE TABLE facturas(id SERIAL PRIMARY KEY, fecha_factura DATE NOT NULL DEFAULT NOW()::DATE, subtotal FLOAT NOT NULL, iva AS subtotal*0.19, precio_total AS subtotal+iva);
CREATE TABLE facturas(id SERIAL PRIMARY KEY, fecha_factura DATE NOT NULL DEFAULT NOW()::DATE, subtotal FLOAT, iva FLOAT, precio_total FLOAT);

CREATE TABLE productos(id SERIAL PRIMARY KEY, nombre VARCHAR(50), descripcion VARCHAR(100) DEFAULT 'sin descripcion', valor_unitario FLOAT);

CREATE TABLE clientes_facturas(cliente_id INT NOT NULL, factura_id INT NOT NULL, FOREIGN KEY(cliente_id) REFERENCES clientes(id), FOREIGN KEY(factura_id) REFERENCES facturas(id));

CREATE TABLE listado_productos(factura_id INT, producto_id INT, FOREIGN KEY(factura_id) REFERENCES facturas(id), FOREIGN KEY(producto_id) REFERENCES productos(id), cantidad INT NOT NULL);

--5 clientes
INSERT INTO clientes(nombre, apellido, rut, direccion, comuna, region) VALUES ('francisca gonzalez', 1, 'portugal 12','santiago', 'RM'), ('ignacio reyes', 12, 'providencia 1665', 'providencia', 'RM'), ('maria pino', 123, 'campiñas 12', 'rancagua', 'ohiggins'), ('manuel cisternas', 1234, 'Coquimbo 394', 'santiago', 'RM'), ('Melisa reyes', 12345, 'alameda 2', 'la cisterna', 'RM');

--8 productos
INSERT INTO productos(nombre, valor_unitario) VALUES ('manzana', 500), ('lechuga', 750), ('garbanzos', 400), ('lentejas', 750), ('acelgas', 700), ('naranjas', 650), ('peras', 500), ('quinoa', 1000);

--3 categorias
INSERT INTO categorias(nombre) VALUES ('frutas'), ('verduras'),('legumbres');

--10 facturas (para crear los ids)
INSERT INTO facturas(subtotal, iva, precio_total) VALUES(2250);
INSERT INTO facturas(subtotal, iva, precio_total) VALUES(2300);
INSERT INTO facturas(subtotal, iva, precio_total) VALUES(2050);
INSERT INTO facturas(subtotal, iva, precio_total) VALUES(2400);
INSERT INTO facturas(subtotal, iva, precio_total) VALUES(2800);
INSERT INTO facturas(subtotal, iva, precio_total) VALUES(500);
INSERT INTO facturas(subtotal, iva, precio_total) VALUES(2500);
INSERT INTO facturas(subtotal, iva, precio_total) VALUES(2500);
INSERT INTO facturas(subtotal, iva, precio_total) VALUES(3850);
INSERT INTO facturas(subtotal, iva, precio_total) VALUES(400);

--2 para el cliente 1, con 2 y 3 productos distintos
--3 para el cliente 2, con 3, 2 y 3 productos distintos
--1 para el cliente 3, con 1 producto distintos
--4 para el cliente 4, con 2, 3, 4 y 1 producto distintos
INSERT INTO clientes_facturas(cliente_id, factura_id) VALUES (1, 1), (1, 2), (2, 3), (2, 4), (2, 5), (3, 6), (4, 7), (4, 8), (4, 9), (4, 10);
INSERT INTO listado_productos(factura_id, producto_id, cantidad) VALUES (1,4,2), (1,2,1),(2,2,1), (2,3,2), (2,4,1), (3,1,1), (3,3,2),(3,4,1), (4, 5, 2),(4,1,2), (5,6,2), (5,4,1), (5,2,1), (6,7,1), (7,8,2), (7,1,1), (8,7,1), (8,2,2), (8,1,1), (9,3,2), (9,4,2), (9,4,1), (9,3,2), (10,3,1);
