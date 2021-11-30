--insertar tabla transaccion alojamiento
Create or replace function fn_insert_transac_alojamiento(alojamid int, transid int, clienid int) returns boolean as
$$
Declare
Begin
   insert into transaccion_alojamiento (alojamid,transid,clienid);
   return true;
Exception when others then  return false;
End;
$$ language 'plpgsql';

--modificacion en la tabla transaccion_alojamiento
create or replace function fn_update_transac_alojamiento(alojamid int, transid int, clienid int) returns boolean
as
$$
Declare
Begin
update transaccion_alojamiento
set alojamiento_id=alojamid,transaccion_id=transid,cliente_id=clienid
where alojamiento_id=alojamid and transaccion_id=transid and cliente_id=clienid;
return true;
exception when others then
return false;
END;
$$ LANGUAGE 'plpgsql'

--eliminar en la tabla transaccion_alojamiento
create or replace function fn_delete_transac_alojamiento(alojamid int, transid int, clienid int) returns boolean
AS
$$
Declare
Begin
DELETE from transaccion_alojamiento where alojamiento_id=alojamid and transaccion_id=transid and cliente_id=clienid;
return true;
exception when others then return false;
End;
$$ LANGUAGE 'plpgsql'

--TABLA DETALLE SERVICIOS
--insertar
create or replace function fn_insert_detalle_servicios(serv_trans_id int,fecha_solici date, hora_solici time, descripcion_solici varchar
mont_serv float, servid int, transacid int) returns boolean
AS
$$
Declare
det_id int;
BEGIN
select coalesce (max (detalle_id),0)+1 into det_id from detalle_servicios;
insert into detalle_servicios  values(det_id,serv_trans_id,fecha_solici, hora_solici, descripcion_solici,mont_serv ,servid,transacid);
return true;
EXCEPTION WHEN OTHERS THEN
return false;
END;
$$ LANGUAGE 'plpgsql'

--where det_id=servicio_transaccion_id

--modificar
create or replace function fn_insert_detalle_servicios(serv_trans_id int,fecha_solici date, hora_solici time, descripcion_solici varchar
mont_serv float, servid int, transacid int) returns boolean
AS
$$
Declare
det_id int;
Begin
update transaccion set fecha_solici=fecha_solicitud, hora_solici=hora_solcitud, descripcion_solici=descripcion_solicitud, mont_serv=monto_servicio
servid=servicioid, transacid=transaccionid
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



