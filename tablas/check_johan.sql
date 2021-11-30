-- VALIDACION TABLA TIPO_HABITACION
alter table tipo_habitacion add constraint check_descripcion_tipo_tipo_habitacion check (descripcion_tipo in ('D','M','S'));
alter table tipo_habitacion add constraint check_tipo_id_tipo_habitacion check (tipo_habitacion_id > 0);
alter table tipo_habitacion add constraint check_precio_base_tipo_habitacio check (precio_base > 0.00 :: money);

-- VALIDACION TABLA HABITACION
alter table habitacion add constraint check_habitacion_id_habitacion check (habitacion_id > 0);
alter table habitacion add constraint check_numero_habitacion_habitacion check (numero_habitacion > 0);
alter table habitacion add constraint check_estado_habitacion_habitacion check (estado_habitacion in ('D','O','R','M'));
alter table habitacion add constraint check_tipo_habitacion_habitacion check (tipo_habitacion_id > 0);

ALTER TABLE habitacion DROP CONSTRAINT check_estado_habitacion_habitacion;

-- VALIDACION TABLA CLIENTE
alter table cliente add constraint check_cliente_id_cliente check (cliente_id > 0);
alter table cliente add constraint check_tipo_persona_id_cliente check (tipo_persona_id in (1,2));
alter table cliente add constraint check_nombre_cliente check (nombre ~* '^[a-z\sá-úÁ-Ú]{1,100}$');
alter table cliente add constraint check_fecha_nacimiento_cliente check (fecha_nacimiento < current_date);
alter table cliente add constraint check_tipo_documento_id_cliente check (tipo_documento_id in ('01','04','06','07','11','00'));
alter table cliente add constraint check_sexo_cliente check (sexo in ('M','F'));
alter table cliente add constraint check_numero_documento_cliente check (numero_documento ~ '^[0-9\a-z\sá-úÁ-Ú]{8,15}$');
alter table cliente add constraint check_pais_cliente check (pais_id > 0);

ALTER TABLE cliente DROP CONSTRAINT check_numero_documento_cliente;

-- VALIDACION TABLA PAÍS
alter table pais add constraint chk_pais_id_pais check (pais_id > 0); 
alter table pais add constraint chk_nombre_pais check (nombre_pais ~* '^[a-z\sá-úÁ-Ú\-]{1,100}$');
alter table pais add constraint chk_continente check (continente ~* '^[a-z\sá-úÁ-Ú\-]{1,9}$');

-- VALIDACION TABLA TRANSACCION
alter table transaccion add constraint check_transaccion_id_transaccion check(transaccion_id > 0);
alter table transaccion add constraint check_tipo_transaccion_id_transaccion check (tipo_transaccion_id in (1,2));
alter table transaccion add constraint check_estado_pago_transaccion check (estado_pago in ('P','D'));
alter table transaccion add constraint check_habitacion_transaccion check (habitacion_id > 0);
alter table transaccion add constraint check_cliente_id_transaccion check (cliente_id > 0);
-- alter table transaccion add constraint check_fecha_entrada_transaccion check (fecha_entrada >= current_date);
alter table transaccion add constraint check_fecha_salida_transaccion check (/*fecha_salida >= current_date and*/ fecha_salida >= fecha_entrada);
-- alter table transaccion add constraint check_fecha_transaccion_transaccion check (fecha_transaccion >= current_date);

-- VALIDACION TABLA TRANSACCION_ALOJAMIENTO
alter table transaccion_alojamiento add constraint check_alojamiento_id_transaccion_alojamiento check (alojamiento_id > 0);
alter table transaccion_alojamiento add constraint check_transaccion_transaccion_alojamiento check (transaccion_id > 0);
alter table transaccion_alojamiento add constraint check_cliente_id_transaccion_alojamiento check (cliente_id > 0);

-------------------------------------------------------------------------------------------------

-- VALIDACION TABLA SERVICIO
alter table servicio add constraint check_servicio_id_servicio check (servicio_id > 0);
alter table servicio add constraint check_nombre_servicio_servicio check (nombre_servicio ~* '^[[a-z\sá-úÁ-Ú]{1,100}$');

-- VALIDACION TABLA TIPO_PERSONA
alter table tipo_persona add constraint check_tipo_persona_id_tipo_persona check (tipo_persona_id > 0);
alter table tipo_persona add constraint check_descripcion_tipo_persona check (descripcion ~* '^[[a-z\sá-úÁ-Ú]{1,16}$');

-- VALIDACION TABLA TIPO_DOCUMENTO
alter table tipo_documento add constraint check_tipo_documento_id_tipo_documento check (tipo_documento_id in ('01','04','06','07','11','00'));
alter table tipo_documento add constraint check_descripcion_tipo_documento check (descripcion ~* '^[[a-z\sá-úÁ-Ú]{1,2}$');

-- VALIDACION TABLA DETALLE_COMPRABANTEE
alter table detalle_comprobante add constraint check_comprobante_det_id_detalle_comprobante check (comprobante_det_id > 0);
alter table detalle_comprobante add constraint check_monto_total_sevicio_detalle_comprobante check (monto_total_servicio > 0.00 :: money);
alter table detalle_comprobante add constraint check_servicio_id_detalle_comprobante check (servicio_id > 0);
alter table detalle_comprobante add constraint check_comprobante_id_detalle_comprobante check (comprobante_id > 0);

-- VALIDACION TABLA DETALLE_SERVICIOS
alter table detalle_servicios add constraint check_servicio_transaccion_id_detalle_servicios check (servicio_transaccion_id > 0);
alter table detalle_servicios add constraint check_fecha_solicitud_detalle_servicios check (fecha_solicitud >= current_date);
alter table detalle_servicios add constraint check_descripcion_solicitud_detalle_servicios check (descripcion_solicitud ~* '^[[a-z\sá-úÁ-Ú]{1,150}$');
alter table detalle_servicios add constraint check_monto_servicio_detalle_servicios check (monto_servicio > 0.00 :: money);
alter table detalle_servicios add constraint check_transaccion_id_detalle_servicios check (transaccion_id > 0);
alter table detalle_servicios add constraint check_servicio_id_detalle_servicios check (servicio_id > 0);

-- VALIDACION TABLA TIPO_TRANSACCION
alter table tipo_transaccion add constraint check_tipo_transaccion_id_tipo_transaccion check (tipo_transaccion_id > 0);
alter table tipo_transaccion add constraint check_descripcion_tipo_transaccion check (descripcion ~* '^[[a-z\sá-úÁ-Ú]{1,15}$');

-- VALIDACION TABLA COMPROBANTE_PAGO
alter table comprobante_pago add constraint check_comprobante_id_comprobante_pago check (comprobante_id > 0);
alter table comprobante_pago add constraint check_fecha_comprobante_pago check (fecha_comprobante >= current_date);
alter table comprobante_pago add constraint check_tipo_comprobante_comprobante_pago check (tipo_comprobante_id in ('01','03'));
alter table comprobante_pago add constraint check_numero_comprobante_pago check (numero_comprobante ~*'^[0-9]{3,3}\-[0-9]{10,10}$');
alter table comprobante_pago add constraint check_monto_comprobante_comprobante_pago check (monto_comprobante > 0 :: money);
alter table comprobante_pago add constraint check_transaccion_id_comprobante_pago check (transaccion_id > 0);
alter table comprobante_pago add constraint check_cliente_id_comprobante_pago check (cliente_id > 0);

-- VALIDACIÓN TABLA TIPO_COMPROBANTE
alter table tipo_comprobante add constraint check_tipo_comprobante_id_tipo_comprobante check (tipo_comprobante_id in ('01','03'));
alter table tipo_comprobante add constraint check_tipo_comprobante_id_tipo_comprobante check (descripcion in ('FACTURA','BOLETA'));
