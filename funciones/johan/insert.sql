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
	('Individual', 100), ('Doble', 190),('Queen', 300),('Matrimonial', 250),('Suite ejecutiva', 400),('Suite presidencial', 500);