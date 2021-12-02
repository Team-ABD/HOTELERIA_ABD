--Listado de servicios que ofrece(comida, etc.)
create table servicio ( 
  servicio_id serial primary key,
  nombre_servicio varchar(100) not null unique
); 
--Restricciones
alter table servicio add constraint check_nombre_servicio_servicio check (nombre_servicio ~* '^[a-z\sá-úÁ-Ú]{1,100}$');

create table tipo_habitacion ( 
  tipo_habitacion_id serial primary key, 
  descripcion_tipo varchar(100) not null unique, 
  precio_base money not null
); 
--Restricciones
alter table tipo_habitacion add constraint check_descripcion_tipo_tipo_habitacion check (descripcion_tipo  ~* '^[a-z\sá-úÁ-Ú]{1,100}$');
alter table tipo_habitacion add constraint check_precio_base_tipo_habitacio check (precio_base > 0.00 :: money);

create table habitacion ( 
  habitacion_id serial primary key, 
  numero_habitacion int not null unique, 
  estado_habitacion char(1) not null, 
  tipo_habitacion_id int not null
); 
--Restricciones
alter table habitacion add constraint fk1_tipoHab_habitacion foreign key (tipo_habitacion_id) references tipo_habitacion(tipo_habitacion_id); 
alter table habitacion add constraint check_numero_habitacion_habitacion check (numero_habitacion > 0);
alter table habitacion add constraint check_estado_habitacion_habitacion check (estado_habitacion in ('D','O','R','M'));
alter table habitacion add constraint check_tipo_habitacion_habitacion check (tipo_habitacion_id > 0);

create table tipo_documento(
	tipo_documento_id int primary key,
	descripcion varchar(21) not null
);
--Restricciones
-- alter table tipo_documento add constraint check_tipo_documento_id_tipo_documento check (tipo_documento_id in ('01','04','06','07','11','00'));
alter table tipo_documento add constraint check_descripcion_tipo_documento check (descripcion ~* '^[a-z\sá-úÁ-Ú]{1,21}$');

create table tipo_persona(
	tipo_persona_id int primary key,
	descripcion varchar(16) not null
);
--Restricciones
alter table tipo_persona add constraint check_tipo_persona_id_tipo_persona check (tipo_persona_id > 0);
alter table tipo_persona add constraint check_descripcion_tipo_persona check (descripcion in ('Persona Natural', 'Persona Jurídica'));

create table pais ( 
  pais_id int primary key, 
  nombre_pais varchar(100) not null unique, 
  continente varchar(9) not null
);

--Restricciones
alter table pais add constraint chk_pais_id_pais check (pais_id > 0);
alter table pais add constraint chk_nombre_pais check (nombre_pais ~* '^[a-z\sá-úÁ-Ú\-]{1,100}$');
alter table pais add constraint chk_continente check (continente ~* '^[a-z\sá-úÁ-Ú\-]{1,9}$');

create table cliente (
  cliente_id serial primary key,
  tipo_documento_id int not null,
  apellidos varchar(100) null,
  nombres varchar(100) not null,
  fecha_nacimiento date,
  tipo_persona_id int not null,
  sexo char(1),
  numero_documento varchar(15) not null,
  pais_id int not null
);
--Restricciones
alter table cliente add constraint fk1_tipoDoc_cliente foreign key (tipo_documento_id) references tipo_documento(tipo_documento_id);
alter table cliente add constraint fk2_tipoPersona_cliente foreign key (tipo_persona_id) references tipo_persona(tipo_persona_id);
alter table cliente add constraint fk3_pais_cliente foreign key (pais_id) references pais (pais_id);
alter table cliente add constraint check_tipo_documento_id_cliente check (tipo_documento_id >0);
alter table cliente add constraint check_nombres_cliente check (nombres ~* '^[a-z\sá-úÁ-Ú]{1,100}$');
alter table cliente add constraint check_fecha_nacimiento_cliente check (fecha_nacimiento < current_date);
alter table cliente add constraint check_tipo_persona_id_cliente check (tipo_persona_id in (1,2));
alter table cliente add constraint check_sexo_cliente check (sexo in ('M','F'));
alter table cliente add constraint check_numero_documento_cliente check (numero_documento ~ '^[0-9A-Z]{8,15}$');
alter table cliente add constraint check_pais_cliente check (pais_id > 0);
alter table cliente add constraint check_cliente_tipo_y_numero_documento unique(tipo_documento_id, numero_documento);

create table tipo_transaccion(
  tipo_transaccion_id int primary key,
  descripcion varchar(15) not null unique
);

--Restricciones
alter table tipo_transaccion add constraint check_tipo_transaccion_id_transaccion check (tipo_transaccion_id > 0);
alter table tipo_transaccion add constraint check_descripcion_tipo_transaccion check (descripcion ~* '^[a-z\sá-úÁ-Ú]{1,15}$');

create table transaccion ( 
  transaccion_id serial primary key, 
  fecha_transaccion date not null, 
  hora_transaccion time not null, 
  tipo_transaccion_id int not null, 
  fecha_entrada date not null, 
  hora_entrada time not null, 
  fecha_salida date null, 
  hora_salida time null, 
  estado_pago char(1) not null, 
  habitacion_id int not null, 
  cliente_id int not null
); 
--Restricciones
alter table transaccion add constraint fk1_habitacion_transaccion foreign key (habitacion_id) references habitacion(habitacion_id); 
alter table transaccion add constraint fk2_cliente_transaccion foreign key (cliente_id) references cliente (cliente_id);
alter table transaccion add constraint fk3_tipo_transaccion foreign key (tipo_transaccion_id) references tipo_transaccion(tipo_transaccion_id);
alter table transaccion alter column fecha_transaccion set default current_date;
alter table transaccion alter column hora_transaccion set default current_time;
alter table transaccion add constraint check_tipo_transaccion_id_transaccion check (tipo_transaccion_id > 0);
-- alter table transaccion add constraint check_fecha_entrada_transaccion check (fecha_entrada >= current_date);
alter table transaccion add constraint check_fecha_salida_transaccion check (/*fecha_salida >= current_date and*/ fecha_salida >= fecha_entrada);
alter table transaccion add constraint check_estado_pago_transaccion check (estado_pago in ('P','C'));
alter table transaccion add constraint check_habitacion_transaccion check (habitacion_id > 0);
alter table transaccion add constraint check_cliente_id_transaccion check (cliente_id > 0);

create table transaccion_alojamiento(
  alojamiento_id serial primary key, 
  cliente_id int not null, 
  transaccion_id int not null
); 
--Restricciones
alter table transaccion_alojamiento add constraint fk1_transAloj_transaccion foreign key (cliente_id) references cliente (cliente_id);
alter table transaccion_alojamiento add constraint fk2_transAloj_transaccion foreign key (transaccion_id) references transaccion (transaccion_id);
alter table transaccion_alojamiento add constraint check_transaccion_transaccion_alojamiento check (transaccion_id > 0);
alter table transaccion_alojamiento add constraint check_cliente_id_transaccion_alojamiento check (cliente_id > 0);
alter table transaccion_alojamiento add constraint unique_transaccion_alojamiento unique (cliente_id,transaccion_id);

create table detalle_servicios (
  servicio_transaccion_id serial primary key, 
  fecha_solicitud date not null, 
  hora_solicitud time not null, 
  descripcion_solicitud varchar(150) not null, 
  monto_servicio money not null, 
  transaccion_id int not null, 
  servicio_id int not null
); 
--Restricciones
alter table detalle_servicios add constraint fk1_detalle foreign key (transaccion_id) references transaccion (transaccion_id); 
alter table detalle_servicios add constraint fk2_detalle foreign key (servicio_id) references servicio (servicio_id); 
alter table detalle_servicios add constraint check_servicio_transaccion_id_detalle_servicios check (servicio_transaccion_id > 0);
alter table detalle_servicios alter column fecha_solicitud set default current_date;
alter table detalle_servicios alter column hora_solicitud set default current_time;
alter table detalle_servicios add constraint check_monto_servicio_detalle_servicios check (monto_servicio > 0.00 :: money);
alter table detalle_servicios add constraint check_transaccion_id_detalle_servicios check (transaccion_id > 0);
alter table detalle_servicios add constraint check_servicio_id_detalle_servicios check (servicio_id > 0);

create table tipo_comprobante (
	tipo_comprobante_id int primary key,
	descripcion varchar(7) not null
);
--Restricciones
alter table tipo_comprobante add constraint check_tipo_comprobante_id_tipo_comprobante check (tipo_comprobante_id > 0);
alter table tipo_comprobante add constraint check_descripcion_tipo_comprobante check (descripcion in ('Factura','Boleta'));

create table comprobante_pago ( 
  comprobante_id serial primary key, 
  fecha_comprobante date not null, 
  hora time not null, 
  tipo_comprobante_id int not null, 
  numero_comprobante varchar(14) not null unique,
  sub_total money not null,
  igv money not null,
  monto_comprobante money not null, 
  transaccion_id int not null,
  cliente_id int not null
);
--Restricciones
alter table comprobante_pago add constraint fk1_transaccion_comprobante foreign key (transaccion_id) references transaccion (transaccion_id); 
alter table comprobante_pago add constraint fk2_cliente_comprobante foreign key (cliente_id) references cliente (cliente_id); 
alter table comprobante_pago add constraint fk3_tipo_comprobante foreign key (tipo_comprobante_id) references tipo_comprobante (tipo_comprobante_id);
alter table comprobante_pago add constraint check_comprobante_id_comprobante_pago check (comprobante_id > 0);
-- alter table comprobante_pago add constraint check_fecha_comprobante_pago check (fecha_comprobante >= current_date);
alter table comprobante_pago add constraint check_tipo_comprobante_comprobante_pago check (tipo_comprobante_id >0);
alter table comprobante_pago add constraint check_numero_comprobante_pago check (numero_comprobante ~*'^[0-9]{3,3}[-][0-9]{10,10}$');
alter table comprobante_pago add constraint check_subtotal_comprobante_pago check (sub_total > 0.00 :: money);
alter table comprobante_pago add constraint check_igv_comprobante_comprobante_pago check (IGV > 0.00 :: money);
alter table comprobante_pago add constraint check_monto_comprobante_comprobante_pago check (monto_comprobante > 0.00 :: money);
alter table comprobante_pago add constraint check_transaccion_id_comprobante_pago check (transaccion_id > 0);
alter table comprobante_pago add constraint check_cliente_id_comprobante_pago check (cliente_id > 0);
alter table comprobante_pago add constraint unique_tipo_numero_comprobante unique (tipo_comprobante_id,numero_comprobante);

create table detalle_comprobante ( 
  comprobante_det_id serial primary key, 
  monto_total_servicio money not null, 
  servicio_id int not null,
  descripción varchar(100) not null,
  comprobante_id int not null
);

--Restricciones

alter table detalle_comprobante add constraint fk1_servicio_detalleComp foreign key (servicio_id) references servicio (servicio_id); 
alter table detalle_comprobante add constraint fk2_comprobantePago_detalleComp foreign key (comprobante_id) references comprobante_pago (comprobante_id);
alter table detalle_comprobante add constraint check_comprobante_det_id_detalle_comprobante check (comprobante_det_id > 0);
alter table detalle_comprobante add constraint check_monto_total_sevicio_detalle_comprobante check (monto_total_servicio > 0.00 :: money);
alter table detalle_comprobante add constraint check_servicio_id_detalle_comprobante check (servicio_id > 0);
alter table detalle_comprobante add constraint check_comprobante_id_detalle_comprobante check (comprobante_id > 0);

