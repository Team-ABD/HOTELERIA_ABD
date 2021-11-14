create table servicio ( 

  servicio_id serial not null, 

  nombre_servicio varchar(100) not null, 

  primary key (servicio_id) 

); 

 

create table habitaciÃ³n ( 

  habitacion_id serial not null, 

  numero_habitacion int not null, 

  estado_habitacion char(1), 

  tipo_habitacion int not null, 

  primary key (habitacion_id) 

); 

 

create table tipo_habitacion ( 

  tipo_id serial not null, 

  descripcion_tipo char(1), 

  precio_base money not null, 

  primary key (tipo_id) 

); 

 

create table cliente ( 

  cliente_id serial not null, 

  tipo_cliente char(1) not null, 

  apellidos varchar(100) not null, 

  nombres varchar(100) not null, 

  fecha_nacimiento date not null, 

  tipo_documento char(1) not null, 

  sexo char(1) not null, 

  numero_documento varchar(12) not null unique, 

  pais_id int not null, 

  primary key (cliente_id) 

); 

 

create table pais ( 

  pais_id serial not null, 

  nombre_pais varchar(100) not null unique, 

  continente varchar(9) not null, 

  primary key (pais_id) 

); 

 

create table transaccion_alojamiento ( 

  alojamiento_id serial not null, 

  cliente_id int not null, 

  transaccion_id int not null, 

  primary key (alojamiento_id) 

); 

 

create table detalle_servicio ( 

  comprobante_det_id serial not null, 

  monto_total_servicio money not null, 

  servicio_id int not null, 

  comprobante_id int not null, 

  primary key (comprobante_det_id) 

); 

 

create table detalle_servicios ( 

  servicio_transaccion_id serial not null, 

  fecha_solicitud date not null, 

  hora_solicitud time(7) not null, 

  descripcion_solicitud varchar(150) not null, 

  monto_servicio money not null, 

  transaccion_id int not null, 

  servicio_id int not null, 

  primary key (servicio_transaccion_id) 

); 

 

create table transaccion ( 

  transaccion_id serial not null, 

  fecha_transaccion date not null, 

  hora_transaccion time(7) not null, 

  tipo_transaccion char(1) not null, 

  fecha_entrada date not null, 

  hora_entrada date not null, 

  fecha_salida date not null, 

  hora_salida time(7) not null, 

  estado_pago char(1) not null, 

  habitacion_id int not null, 

  cliente_id int not null, 

  primary key (transaccion_id) 

); 

 

create table comprobante_pago ( 

  comprobante_id serial not null, 

  fecha date not null, 

  hora time(7) not null, 

  tipo_comprobante char(1) not null, 

  numero_comprobante int not null unique, 

  monto_comprobante money not null, 

  transaccion_id int not null, 

  cliente_id int not null, 

  primary key (comprobante_id) 

); 

 

alter table habitaciÃ³n add constraint fk1_habitaciÃ³n foreign key (tipo_habitacion) references tipo_habitacion (tipo_id); 

alter table transaccion add constraint fk2_transaccio foreign key (habitacion_id) references habitaciÃ³n (habitacion_id); 

alter table detalle_servicios add constraint fk3_detalle foreign key (transaccion_id) references transaccion (transaccion_id); 

alter table detalle_servicios add constraint fk4_detalle foreign key (servicio_id) references servicio (servicio_id); 

alter table detalle_servicio add constraint fk4_detalle foreign key (servicio_id) references servicio (servicio_id); 

alter table detalle_servicio add constraint fk5_detalle foreign key (comprobante_id) references comprobante_pago (comprobante_id); 

alter table comprobante_pago add constraint fk6_comprobante foreign key (transaccion_id) references transaccion (transaccion_id); 

alter table comprobante_pago add constraint fk7_comprobante foreign key (cliente_id) references cliente (cliente_id); 

alter table cliente add constraint fk8_cliente foreign key (pais_id) references pais (pais_id); 

alter table transaccion_alojamiento add constraint fk9_transaccion foreign key (cliente_id) references cliente (cliente_id); 

alter table transaccion_alojamiento add constraint fk10_transaccion foreign key (transaccion_id) references transaccion (transaccion_id); 

alter table transaccion add constraint fk11_transaccion foreign key (cliente_id) references cliente (cliente_id); 
