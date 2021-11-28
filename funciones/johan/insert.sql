INSERT INTO tipo_comprobante
	(tipo_comprobante_id, descripcion)
VALUES
	('01','Factura'),
	('03','Boleta');
	

INSERT INTO tipo_Persona
	(tipo_persona_id, descripcion)
VALUES
	(1,'Persona Natural'),
	(2,'Persona Jurídica');

INSERT INTO tipo_documento
	(tipo_documento_id, descripcion)
VALUES
	('01','DNI'),
	('04','Carnet de Extrangería'),
	('06','RUC'),
	('07','Pasaporte'),
	('11','Partida de Nacimiento'),
	('00','Otros');

ALTER TABLE tipo_habitacion ALTER COLUMN descripcion_tipo type character varying (100);
select * from tipo_habitacion;

INSERT INTO tipo_habitacion 
	(descripcion_tipo, precio_base)
VALUES 
	('Individual', 100),
	('Doble', 190),
	('Queen', 300),
	('Matrimonial', 250),
	('Suite ejecutiva', 400),
	('Suite presidencial', 500);

INSERT INTO servicio
	(nombre_servicio)
VALUES
	('Minibar'),('Excursiones'),('Transporte'),('Sallón de belleza'),('Sauna'),('Gimnasio'),('Lavandería'),
	('Alquiler de salas de negociación'),('Tintorería'),('Desayuno');

INSERT INTO habitacion 
	(numero_habitacion,estado_habitacion, tipo_habitacion_id)
VALUES 
(101, 'O', 1),(102, 'R', 2),(103, 'M', 3),(104, 'D', 4),(105, 'R', 5),(106, 'D', 6), 
(201, 'M', 1),(202, 'O', 2),(203, 'R', 3),(204, 'M', 4),(205, 'R', 5),(206, 'D', 6), 
(301, 'R', 1),(302, 'O', 2),(303, 'M', 3),(304, 'R', 4),(305, 'D', 5),(306, 'O', 6);

INSERT INTO cliente
	(tipo_documento_id, nombre, fecha_nacimiento, tipo_persona_id, sexo, numero_documento, pais_id)
VALUES
	('01','Armando Paredes de las Casas','05-02-1990',1,'M','32165498',82),
	('07','Fabiola Estrada Barba','06-04-1989',1,'F','LK1598478453',78),
	('06','Constructora San Agustín SAC',null,2,null,'20659832875',82),
	('06','Directv Peru SRL',null,2,null,'20951334667',82),
	('06','Repsol SA',null,2,null,'20546987231',152),
	('01', 'Julian Guevara Carrasco', '10-01-1989', 1, 'M', '79623451', 82),
	('04', 'Lucia Vargas Soriano', '12-03-1995', 1, 'F', 'AC4963527856', 64),
	('06', 'Mario Sanchez Ruiz', '25-11-1986', 1, 'M', '10185296378', 82),
	('07', 'Maria Lopez Fernandez', '14-05-1992', 1, 'F', 'AZ3852741523', 91),
	('11', 'Carlos Benavides Diaz', '11-07-1984', 1, 'M', '789456123123951', 82),
	('00', 'Nicolas Acuña Bonilla', '22-12-1994', 1, 'M', 'GD1852654321654', 73);

INSERT INTO tipo_transaccion
	(tipo_transaccion_id, descripcion)
VALUES
	(1,'Crédito'),(2,'Contado');
	