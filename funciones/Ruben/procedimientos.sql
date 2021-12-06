--insertar tabla transaccion alojamiento
Create or replace function fn_insert_transac_alojamiento(clienid int,transid int) returns boolean as
$$
Declare
doc_tipo int;
Begin
Select tipo_persona_id into doc_tipo from tipo_persona where tipo_persona_id=1;
  if doc_tipo=1 then
   insert into transaccion_alojamiento(cliente_id,transaccion_id) values (clienid,transid);
   return true;
else
return false;
end if;

Exception when others then  return false;
End;
$$ language 'plpgsql';


--modificacion en la tabla transaccion_alojamiento
create or replace function fn_update_transac_alojamiento(alojamid int, clienid int,transid int) returns boolean
as
$$
Declare
Begin
update transaccion_alojamiento set alojamiento_id=alojamid,cliente_id=clienid,transaccion_id=transid
where alojamiento_id=alojamid ;
return true;
exception when others then
return false;
END;
$$ LANGUAGE 'plpgsql'

--eliminar en la tabla transaccion_alojamiento
create or replace function fn_delete_transac_alojamiento(alojamid int,transid int) returns boolean
AS
$$
Declare
estado character;
hora_sali time;
fecha_sali date;
Begin
Select estado_pago into estado from transaccion where transaccion_id=transid;
select hora_salida into hora_sali from transaccion where transaccion_id=transid;
select fecha_salida into fecha_sali from transaccion where transaccion_id=transid;
  if estado=C then 
  if hora_sali=true then
  if fecha_sali=true then
DELETE from transaccion_alojamiento where alojamiento_id=alojamid;
return true;
else
return false;
end if;
end if;
end if;
exception when others then return false;
End;
$$ LANGUAGE 'plpgsql'

--TABLA DETALLE SERVICIOS
--insertar
create or replace function fn_insert_detalle_servicios(fecha_solici date, hora_solici time, descripcion_solici varchar
,mont_serv float, servid int, transacid int) returns boolean
AS
$$
Declare
det_id int;
BEGIN
select coalesce (max (servicio_transaccion_id),0)+1 into det_id from detalle_servicios;
insert into detalle_servicios  values(det_id,fecha_solici, hora_solici, descripcion_solici,mont_serv ,servid,transacid);
return true;
EXCEPTION WHEN OTHERS THEN
return false;
END;
$$ LANGUAGE 'plpgsql'

--where det_id=servicio_transaccion_id

--modificar
create or replace function fn_update_detalle_servicios(det_id int,fecha_solici date, hora_solici time, descripcion_solici varchar
,mont_serv float, servid int, transacid int) returns boolean
AS
$$
Declare
Begin
update transaccion set fecha_solici=fecha_solicitud, hora_solici=hora_solcitud, descripcion_solici=descripcion_solicitud, mont_serv=monto_servicio
,servid=servicioid, transacid=transaccionid
where det_id=servicio_transaccion_id;
return true;
exception when others then
return false;
END;
$$ language 'plpgsql'

--eliminar
create or replace function fn_delete_detalle_servicios(det_id int) 
returns boolean
AS
$$
DECLARE
BEGIN
DELETE from detalle_servicios where servicio_transaccion_id=det_id;
return true;
exception when others then
return false;
End;
$$ LANGUAGE 'plpgsql'



