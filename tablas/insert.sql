INSERT INTO tipo_comprobante
	(tipo_comprobante_id, descripcion)
VALUES
	(1,'Factura'),
	(2,'Boleta');
	

INSERT INTO tipo_Persona
	(tipo_persona_id, descripcion)
VALUES
	(1,'Persona Natural'),
	(2,'Persona Jurídica');

INSERT INTO tipo_documento
	(tipo_documento_id, descripcion)
VALUES
	(1,'DNI'),
	(2,'Carnet de Extrangería'),
	(3,'RUC'),
	(4,'Pasaporte'),
	(5,'Partida de Nacimiento'),
	(6,'Otros');

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
	('Minibar'),
	('Excursiones'),
	('Transporte'),
	('Sallón de belleza'),
	('Sauna'),
	('Gimnasio'),
	('Lavandería'),
	('Alquiler de salas de negociación'),
	('Tintorería'),
	('Desayuno');

INSERT INTO habitacion 
	(numero_habitacion,estado_habitacion,tipo_habitacion_id)
VALUES 
	(101, 'O', 1),
	(102, 'R', 2),
	(103, 'M', 3),
	(104, 'D', 4),
	(105, 'R', 5),
	(106, 'D', 6),
	(107, 'D', 6), 
	(108, 'D', 6), 
	(109, 'D', 6),
	(110, 'D', 6),   
	(201, 'M', 1),
	(202, 'O', 2),
	(203, 'R', 3),
	(204, 'M', 4),
	(205, 'R', 5),
	(206, 'D', 6),
	(207, 'D', 6),
	(208, 'D', 6),
	(209, 'D', 6),
	(210, 'D', 6),
	(301, 'R', 1),
	(302, 'O', 2),
	(303, 'M', 3),
	(304, 'R', 4),
	(305, 'D', 5),
	(306, 'O', 6),
	(307, 'R', 1),
	(308, 'R', 1),
	(309, 'R', 1),
	(310, 'R', 1),
	(401, 'R', 1),
	(402, 'O', 2),
	(403, 'M', 3),
	(404, 'R', 4),
	(405, 'D', 5),
	(406, 'O', 6),
	(407, 'R', 1),
	(408, 'R', 1),
	(409, 'R', 1),
	(410, 'R', 1);

INSERT INTO cliente
	(tipo_documento_id, apellidos, nombres, fecha_nacimiento, tipo_persona_id, sexo, numero_documento, pais_id)
VALUES
	(3,null,'Constructora San Agustín SAC',null,2,null,'20659832875',82),
	(4,'Estrada Barba','Fabiola','06-04-1989',1,'F','LK1598478453',78),
	(3,null,'Directv Peru SRL',null,2,null,'20951334667',82),
	(1,'Guevara Carrasco','Julian Franco', '10-01-1989',1,'M','79623451',82),
	(2,'Vargas Soriano','Lucia Fernanda','12-03-1995',1,'F','AC4963527856',64),
	(3,'Sanchez Ruiz','Mario','25-11-1986',1,'M','10185296378',82),
	(4,'Lopez Fernandez','Maria Fernanda','14-05-1992',1,'F','AZ3852741523',91),
	(4,'Yzquierdo Chavez','Leonardo','15-08-2003',1,'M','TVU213584F',61),
	(5,'Benavides Diaz','Carlos','11-07-1984',1,'M','78945612312395',82),
	(6,'Acuña Bonilla','Nicolas ','22-12-1994',1,'M','GD1852654321654', 73),
	(3,null,'Repsol SA',null,2,null,'20546987231',152),
	(1,'Zambrano Florez','Abigail Valery','24-05-2000',1,'F','12358749',82),
	(1,'Venegas Hijo','Antonella','24-05-2001',1,'F','84516972',82),
	(3,null,'MICROSOFT PERU',null,2,null,'20254138577',82),
	(1,'Acosta Navarro','Luis Fernando Emanuel Segundo','24-05-1997',1,'M','23910320',82),
	(4,'Alvarado Barbosa','María Fernanda Ashley','18-02-2002',1,'F','WFR869136H',61),
	(4,'Rebaza Fernandez','Miguel Arturo','24-05-2001',1,'F','USR149855H',61),
	(4,'Castle Lincoln','Jeffery','19-03-1995',1,'M','SWB512857D',71),
	(3,null,'BANCO INTERNACIONAL DEL PERU INTERBANK',null,2,null,'20100053455',82);

INSERT INTO tipo_transaccion
	(tipo_transaccion_id, descripcion)
VALUES
	(1,'Reservado'),
	(2,'Confirmado'),
	(3,'Concluido');

INSERT INTO transaccion 
	(tipo_transaccion_id, fecha_entrada, hora_entrada, fecha_salida, hora_salida, estado_pago, habitacion_id, cliente_id)
VALUES
	(2, '01-06-2021', '12:00', '05-06-2021', '10:00', 'C', '1', '1'),
	(2, '05-07-2021', '11:00', null, null, 'P', '20', '5'),
	(3, '05-08-2021', '07:00', '10-08-2021', '09:00', 'C', '2', '10'),
	(2, '15-08-2021', '14:00', null, null, 'P', '3', '6'),
	(1, '19-08-2021', '06:00', null, null, 'P', '12', '8'),
	(1, '22-08-2021', '10:00', null, null, 'P', '16', '4'),
	(3, '30-08-2021', '07:30', '01-09-2021', '21:00', 'C', '13', '11'),
	(1, '03-09-2021', '24:00', null, null, 'P', '25', '5'),
	(3, '15-09-2021', '12:30', '20-09-2021', '23:00', 'P', '16', '3'),
	(2, '01-10-2021', '13:00', '05-10-2021', '16:00', 'C', '10', '4');

INSERT INTO transaccion 
	(tipo_transaccion_id, fecha_entrada, hora_entrada, fecha_salida, hora_salida, estado_pago, habitacion_id, cliente_id)
VALUES
	(3,'14-01-2020','21:00','15-01-2020','21:00','C','7','9'),
	(1,'08-02-2020','16:30','11-02-2020','12:30','P','2','6'),
	(2,'10-03-2020','08:00','10-03-2020','18:00','C','18','4'),
	(2,'11-04-2020','15:00','13-04-2020','15:00','P','15','11'),
	(3,'05-05-2020','19:00','12-05-2020','19:00','C','1','3'),
	(3,'02-06-2020','23:00','07-06-2020','11:00','P','9','7'),
	(1,'13-07-2020','07:00','13-07-2020','19:00','C','8','1'),
	(1,'27-09-2020','18:00','29-09-2020','12:00','P','17','10'),
	(2,'14-10-2020','22:00','15-10-2020','10:00','C','4','2'),
	(3,'20-11-2020','12','26-11-2020','12:00','P','10','5');
