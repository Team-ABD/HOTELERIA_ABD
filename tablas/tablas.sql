--Listado de servicios que ofrece(comida, etc.)
create table servicio ( 
  servicio_id serial primary key,
  nombre_servicio varchar(100) not null
); 

create table tipo_habitacion ( 
  tipo_habitacion_id serial primary key, 
  descripcion_tipo char(1), 
  precio_base money not null 
); 

create table habitacion ( 
  habitacion_id serial primary key, 
  numero_habitacion int not null, 
  estado_habitacion char(1), 
  tipo_habitacion int not null
); 
--Restricciones
alter table habitacion add constraint fk1_tipoHab_habitacion foreign key (tipo_habitacion) references tipo_habitacion(tipo_habitacion_id); 

create table tipo_documento(
	tipo_documento_id char(2) primary key,
	descripcion varchar(21) not null
);

create table tipo_persona(
	tipo_persona_id int primary key,
	descripcion char(16) not null
);

create table pais ( 
  pais_id serial primary key, 
  nombre_pais varchar(100) not null unique, 
  continente varchar(9) not null
); 

create table cliente (
  cliente_id serial primary key, 
  tipo_documento_id char(1) not null, 
  apellidos varchar(100), 
  nombres varchar(100) not null, 
  fecha_nacimiento date not null, 
  tipo_persona_id int not null, 
  sexo char(1) not null, 
  numero_documento varchar(12) not null unique, 
  pais_id int not null
); 
--Restricciones
alter table cliente add constraint fk1_tipoDoc_cliente foreign key (tipo_documento_id) references tipo_documento(tipo_documento_id);
alter table	cliente add constraint fk2_tipoPersona_cliente foreign key (tipo_persona_id) references tipo_persona(tipo_persona_id);
alter table cliente add constraint fk1_pais_cliente foreign key (pais_id) references pais (pais_id);

create table tipo_transaccion(
  tipo_transaccion_id int primary key,
  descripcion varchar(15) not null
);

create table transaccion ( 
  transaccion_id serial primary key, 
  fecha_transaccion date not null, 
  hora_transaccion time not null, 
  tipo_transaccion char(1) not null, 
  fecha_entrada date not null, 
  hora_entrada date not null, 
  fecha_salida date not null, 
  hora_salida time not null, 
  estado_pago char(1) not null, 
  habitacion_id int not null, 
  cliente_id int not null
); 
--Restricciones
alter table transaccion add constraint fk1_habitacion_transaccion foreign key (habitacion_id) references habitacion(habitacion_id); 
alter table transaccion add constraint fk2_cliente_transaccion foreign key (cliente_id) references cliente (cliente_id); 

create table transaccion_alojamiento(
  alojamiento_id serial primary key, 
  cliente_id int not null, 
  transaccion_id int not null
); 
--Restricciones
alter table transaccion_alojamiento add constraint fk1_transAloj_transaccion foreign key (cliente_id) references cliente (cliente_id);
alter table transaccion_alojamiento add constraint fk2_transAloj_transaccion foreign key (transaccion_id) references transaccion (transaccion_id);

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

create table comprobante_pago ( 
  comprobante_id serial primary key, 
  fecha date not null, 
  hora time not null, 
  tipo_comprobante char(1) not null, 
  numero_comprobante char(14) not null unique, -- REVISAR TIPO DE DATO Y CREACIÓN DE TABLA TIPO_COMPROBANTE
  monto_comprobante money not null, 
  transaccion_id int not null,
  cliente_id int not null
);

--Restricciones
alter table comprobante_pago add constraint fk1_transaccion_comprobante foreign key (transaccion_id) references transaccion (transaccion_id); 
alter table comprobante_pago add constraint fk2_cliente_comprobante foreign key (cliente_id) references cliente (cliente_id); 

create table detalle_comprobante ( 
  comprobante_det_id serial primary key, 
  monto_total_servicio money not null, 
  servicio_id int not null, 
  comprobante_id int not null
);
--Restricciones
alter table detalle_comprobante add constraint fk1_servicio_detalleComp foreign key (servicio_id) references servicio (servicio_id); 
alter table detalle_comprobante add constraint fk2_comprobantePago_detalleComp foreign key (comprobante_id) references comprobante_pago (comprobante_id); 
