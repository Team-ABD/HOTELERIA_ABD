------------------------------------------------------------SERVICIO------------------------------------------------------------
--Insertar un servicio
Create or replace function fn_insert_servicio(nombre character varying) returns boolean as
$$
Declare 
Begin 
	insert into servicio(nombre_servicio) values(nombre);
	return true;
Exception 
	when others then return false;
end;
$$ language 'plpgsql';	

--Modificar un servicio
Create or replace function fn_update_servicio(id_servicio, nombre) returns boolean as 
$$
Declare 
Begin 
    update servicio set nombre_servicio = nombre where servicio_id = id_servicio;
    return true;
Exception 
	when others then return false;
end;
$$language 'plpgsql';

--Eliminar un servicio
Create or replace function fn_delete_servicio(id_servicio int) returns boolean as
$$
Declare 
Begin 
	delete from servicio where servicio_id = id_servicio;
	return true;
Exception
	when others then return false;
end;
$$ language 'plpgsql';
------------------------------------------------------------SERVICIO------------------------------------------------------------

------------------------------------------------------------TIPO_HABITACION------------------------------------------------------------
--Insertar tipo_habitacion
Create or replace function fn_insert_tipo_habitacion(descripcion character varying, precio money) returns boolean AS
$$
Declare 
Begin 
	insert into tipo_habitacion(description_tipo, precio_base) values (descripcion, precio);
Exception 
	when others then return false;
end;
$$ language 'plpgsql';

--Modificar tipo_habitacion
Create or replace function fn_update_tipo_habitacion(tipoid int,descripcion character varying, precio money) returns boolean as 
$$
Declare 
Begin 
    update tipo_habitacion set descripcion_tipo = descripcion, precio_base = precio where tipo_habitacion_id = tipoid;
    return true;
Exception 
	when others then return false;
end;
$$language 'plpgsql';

--Eliminar tipo_habitacion
Create or replace function fn_delete_tipo_habitacion(tipoid int) returns boolean AS
$$
Declare 
Begin 
	delete from tipo_habitacion where tipo_habitacion_id = tipoid;
	return true;
Exception
	when others then return false;
end;
$$ language 'plpgsql';

--Insertar tipo_documento
Create or replace function insert_tipo_documento(des character varying) returns boolean as 
$$
Declare 
id int;
Begin
	select max(tipo_documento_id)+1 into id from tipo_documento;
	insert into tipo_documento(tipo_documento_id, descripcion) values (id, des);  
	return true;
Exception 
	when others then return false;
End;
$$ language 'plpgsql';

--Eliminar tipo_documento 
Create or replace function fn_delate_tipo_documento(documentoid int) returns boolean AS
$$
Declare 
Begin 
	delete from tipo_documento where tipo_documento_id = documentoid;
	return true;
Exception
	when others then return false;
end;
$$ language 'plpgsql';
------------------------------------------------------------TIPO_HABITACION------------------------------------------------------------


------------------------------------------------------------HABITACION------------------------------------------------------------
--Insertar habitacion
Create or replace function fn_insert_habitacion(numeroHabitacion int, tipoHabitacion int) returns boolean
$$
Declare
Begin
   insert into habitacion (numero_habitacion,estado_habitacion,tipo_habitacion) values(numeroHabitacion,false,tipoHabitacion);
   return true;
Exception
	when others then return false;
end;
$$ language 'plpgsql';
--Modificar habitacion
Create or replace function fn_update_estado_habitacion(id_hab int, estado char) returns boolean as
$$
Declare
    estado_actual char;
Begin
   select estado_habitacion into estado_actual from habitacion where habitacion_id=id_hab;
   
    if(estado_actual='D') THEN
        if(estado='O') THEN
            update habitacion set estado_habitacion='O' where habitacion_id=id_hab;
            return true;
        else
            update habitacion set estado_habitacion='M' where habitacion_id=id_hab;
            return true;
        end if;
    else
        update habitacion set estado_habitacion='D' where habitacion_id=id_hab;
        return true;
    end if;
    return false;
end;
$$ language 'plpgsql';

--Eliminar habitacion
Create or replace function fn_delete_habitacion(id_hab int) returns boolean as
$$
Declare
    estado_actual char;
Begin
    select estado_habitacion into estado_actual from habitacion where habitacion_id=id_hab;
  
    if(estado_actual='D') then
    delete from habitacion where habitacion_id=id_hab;
    return true;
    end if;
Exception 
    when others then return false;
end;
$$ language 'plpgsql';
------------------------------------------------------------HABITACION------------------------------------------------------------


------------------------------------------------------------TIPO_DOCUMENTO------------------------------------------------------------
--Insertar tipo_documento
Create or replace function insert_tipo_documento(des character varying) returns boolean as 
$$
Declare 
id int;
Begin
	select max(tipo_documento_id)+1 into id from tipo_documento;
	insert into tipo_documento(tipo_documento_id, descripcion) values (id, des);  
	return true;
Exception 
	when others then return false;
End;
$$ language 'plpgsql';

--Eliminar tipo_documento 
Create or replace function fn_delate_tipo_documento(documentoid int) returns boolean AS
$$
Declare 
Begin 
	delete from tipo_documento where tipo_documento_id = documentoid;
	return true;
Exception
	when others then return false;
end;
$$ language 'plpgsql';

--Modificar tipo_documento
Create or replace function fn_update_tipo_documento(tipoid int,des character varying) returns boolean as 
$$
Declare 
Begin 
    update tipo_documento set descripcion = des where tipo_documento_id = tipoid;
    return true;
Exception 
	when others then return false;
end;
$$language 'plpgsql';
------------------------------------------------------------TIPO_DOCUMENTO------------------------------------------------------------


------------------------------------------------------------TIPO_PERSONA------------------------------------------------------------
-- INSERTAR
Create or replace function insertar_tipo_persona(tipo_persona_id int, des varchar) returns boolean as
$$
Declare
Begin
  --La columna descripcion ya cuenta con un check por lo tanto ya no se realiza la validacion
  insert into tipo_persona(tipo_persona_id,descripcion) values(tipo_persona_id, des);
  return true;
Exception 
    when others then return false;
end;
$$ language 'plpgsql';

-- ELIMINAR
Create or replace function fn_eliminar_tipo_persona(id_tipo_persona int) returns boolean as
$$
Declare
Begin
  delete from tipo_persona where tipo_habitacion_id=id_tipo_persona;
  return true;
Exception 
    when others then return false;
end;
$$ language 'plpgsql';

-- MODDIFICAR
Create or replace function fn_modificar_tipo_persona(tipo_persona int, des varchar) returns boolean as
$$
Declare 
Begin 
	update tipo_persona set descripcion = des where tipo_persona_id = tipo_persona;
	return true;
Exception
	when others then return false;
end;
$$ language 'plpgsql';
------------------------------------------------------------TIPO_PERSONA------------------------------------------------------------


------------------------------------------------------------ PAÍS ------------------------------------------------------------
-- INSERTAR PAÍS
-- MODIFICAR PAÍS
-- ELIMINAR PAÍS
CREATE OR REPLACE FUNCTION fn_delete_pais(idd int) 
returns boolean
AS
$$
DECLARE
BEGIN
delete from pais where pais_id=idd;
return true;
EXCEPTION WHEN OTHERS THEN
return false;
END;
$$ LANGUAGE 'plpgsql'

------------------------------------------------------------ PAÍS ------------------------------------------------------------


------------------------------------------------------------ CLIENTE ------------------------------------------------------------
-- FUNCIÓN INSERT
    CREATE OR REPLACE FUNCTION fn_insert_cliente(id_tipo_documento int, apellidos_cliente varchar(100), nombres_cliente varchar(100), fecha_nac date, id_tipo_persona int, sexo_cliente char(1), num_doc varchar(15) , id_pais int) returns boolean as
    $$
        DECLARE
        BEGIN
            if id_tipo_documento = 1 then
                if char_length(num_doc) = 8 then
                    Insert into cliente(tipo_documento_id, apellidos, nombres, fecha_nacimiento, tipo_persona_id, sexo, numero_documento, pais_id) 
                        values (id_tipo_documento, apellidos_cliente, nombres_cliente, fecha_nac, id_tipo_persona, sexo_cliente, num_doc, id_pais);
                    return true;
                else
                    return false;
                end if;
            else
                if id_tipo_documento = 2 OR id_tipo_documento = 4 then
                    if char_length(num_doc) <= 12 then
                        Insert into cliente(tipo_documento_id, apellidos, nombres, fecha_nacimiento, tipo_persona_id, sexo, numero_documento, pais_id) 
                            values (id_tipo_documento, apellidos_cliente, nombres_cliente, fecha_nac, id_tipo_persona, sexo_cliente, num_doc, id_pais);
                        return true;
                    else
                        return false;
                    end if;
                else
                    if id_tipo_documento = 3 then
                        if char_length(num_doc) = 11 then
                            Insert into cliente(tipo_documento_id, apellidos, nombres, fecha_nacimiento, tipo_persona_id, sexo, numero_documento, pais_id) 
                                values (id_tipo_documento, apellidos_cliente, nombres_cliente, fecha_nac, id_tipo_persona, sexo_cliente, num_doc, id_pais);
                            return true;
                        else
                            return false;
                        end if;
                    else
                        if id_tipo_documento = 5 OR id_tipo_documento = 6 then
                            if char_length(num_doc) <= 15 then
                                Insert into cliente(tipo_documento_id, apellidos, nombres, fecha_nacimiento, tipo_persona_id, sexo, numero_documento, pais_id) 
                                    values (id_tipo_documento, apellidos_cliente, nombres_cliente, fecha_nac, id_tipo_persona, sexo_cliente, num_doc, id_pais);
                                return true;
                            else
                                return false;
                            end if;
                        end if;
                    end if;
                end if;
            end if;
            EXCEPTION
                return false;
        END;
    $$ LANGUAGE 'plpgsql';

-- FUNCIÓN DELETE
    CREATE OR REPLACE FUNCTION fn_delete_cliente(id_cliente int) returns boolean as
    $$
        DECLARE
        BEGIN
            Delete from cliente where cliente_id = id_cliente
            EXCEPTION
                return false;
        END;
    $$ LANGUAGE 'plpgsql';

-- FUNCIÓN UPDATE
    CREATE OR REPLACE FUNCTION fn_update_cliente(id_cliente int, id_tipo_documento int, apellidos_cliente varchar(100), nombres_cliente varchar(100), fecha_nac date, id_tipo_persona int, sexo_cliente char(1), num_doc varchar(15) , id_pais int) returns boolean as
	$$
	    DECLARE
	    BEGIN
            if id_tipo_documento = 1 then
                if char_length(num_doc) = 8 then
                    update cliente set tipo_documento_id = id_tipo_documento, apellidos = apellidos_cliente, nombres = nombres_cliente, 
                        fecha_nacimiento = fecha_nac, tipo_persona_id = id_tipo_persona, sexo = sexo_cliente, numero_documento = num_doc, pais_id = id_pais
                    where cliente_id = id_cliente;
                    return true;
                else
                    return false;
                end if;
            else
                if id_tipo_documento = 2 OR id_tipo_documento = 4 then
                    if char_length(num_doc) <= 12 then
                        update cliente set tipo_documento_id = id_tipo_documento, apellidos = apellidos_cliente, nombres = nombres_cliente, 
                            fecha_nacimiento = fecha_nac, tipo_persona_id = id_tipo_persona, sexo = sexo_cliente, numero_documento = num_doc, pais_id = id_pais
                        where cliente_id = id_cliente;
                        return true;
                    else
                        return false;
                    end if;
                else
                    if id_tipo_documento = 3 then
                        if char_length(num_doc) = 11 then
                            update cliente set tipo_documento_id = id_tipo_documento, apellidos = apellidos_cliente, nombres = nombres_cliente, 
                                fecha_nacimiento = fecha_nac, tipo_persona_id = id_tipo_persona, sexo = sexo_cliente, numero_documento = num_doc, pais_id = id_pais
                            where cliente_id = id_cliente;
                            return true;
                        else
                            return false;
                        end if;
                    else
                        if id_tipo_documento = 5 OR id_tipo_documento = 6 then
                            if char_length(num_doc) <= 15 then
                                update cliente set tipo_documento_id = id_tipo_documento, apellidos = apellidos_cliente, nombres = nombres_cliente, 
                                    fecha_nacimiento = fecha_nac, tipo_persona_id = id_tipo_persona, sexo = sexo_cliente, numero_documento = num_doc, pais_id = id_pais
                                 where cliente_id = id_cliente;
                                return true;
                            else
                                return false;
                            end if;
                        end if;
                    end if;
                end if;
            end if;
            EXCEPTION
            return false;
	    END;
	$$ LANGUAGE 'plpgsql';
------------------------------------------------------------ CLIENTE ------------------------------------------------------------


------------------------------------------------------------TIPO_TRANSACCIÓM------------------------------------------------------------
-- INSERTAR
-- MODIFICAR
-- ELIMINAR
function fn_delete_tipo_transaccion(transaccionid int) returns boolean AS
$$
Declare 
Begin 
	delete from tipo_transaccion where tipo_transaccion_id = transaccionid;
	return true;
Exception
	when others then return false;
end;
$$ language 'plpgsql';
------------------------------------------------------------TIPO_TRANSACCIÓM------------------------------------------------------------


------------------------------------------------------------TRANSACCIÓN------------------------------------------------------------
-- INSERTAR
-- MODIFICAR
-- ELIMINAR
------------------------------------------------------------TRANSACCIÓN------------------------------------------------------------


------------------------------------------------------------TRANSACCIÓN_ALOJAMIENTO------------------------------------------------------------
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
create or replace function fn_delete_transac_alojamiento(alojamid int) returns boolean
AS
$$
Declare
Begin
if
DELETE from transaccion_alojamiento where alojamiento_id=alojamid;
return true;
exception when others then return false;
End;
$$ LANGUAGE 'plpgsql'
------------------------------------------------------------TRANSACCIÓN_ALOJAMIENTO------------------------------------------------------------


------------------------------------------------------------DETALLE_SERVICIOS------------------------------------------------------------
--insertar
create or replace function fn_insert_detalle_servicios(fecha_solici date, hora_solici time, descripcion_solici varchar
,mont_serv float, servid int, transacid int) returns boolean
AS
$$
Declare
det_id int;
BEGIN
select coalesce (max (servicio_transaccion_id),0)+1 into det_id from detalle_servicios;
insert into detalle_servicios  values(servicio_transaccion_id,fecha_solici, hora_solici, descripcion_solici,mont_serv ,servid,transacid);
return true;
EXCEPTION WHEN OTHERS THEN
return false;
END;
$$ LANGUAGE 'plpgsql'

--where det_id=servicio_transaccion_id

--modificar
create or replace function fn_update_detalle_servicios(serv_trans_id int,fecha_solici date, hora_solici time, descripcion_solici varchar
,mont_serv float, servid int, transacid int) returns boolean
AS
$$
Declare
det_id int;
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
------------------------------------------------------------DETALLE_SERVICIOS------------------------------------------------------------


------------------------------------------------------------TIPO_COMPROBANTE------------------------------------------------------------
-- INSERT
    CREATE OR REPLACE FUNCTION fn_insert_tipo_comprobante(id_tipo_comprobante int, descr_tip_comp varchar(7)) returns boolean as
    $$
        DECLARE
        BEGIN
            Insert into tipo_comprobante(tipo_comprobante_id, descripcion) 
                values (id_tipo_comprobante, descr_tip_comp); 
                return true;
            Exception
                return false;       
        END;
    $$ LANGUAGE 'plpgsql';
-- DELETE
    CREATE OR REPLACE FUNCTION fn_delete_tipo_comprobante(id_tipo_comprobante int) returns boolean as
    $$
        DECLARE
        BEGIN
            Delete from tipo_comprobante where tipo_comprobante_id = id_tipo_comprobante;
                return true;
            Exception
                return false;
        END;
    $$ LANGUAGE 'plpgsql';

-- UPDATE
    CREATE OR REPLACE FUNCTION fn_update_tipo_comprobante(id_tipo_comprobante int, descr_tip_comp varchar(7)) returns boolean as
    $$
        DECLARE
        BEGIN
            Update set descripcion = id_tipo_comprobante, descr_tip_comp 
                where tipo_comprobante_id = id_tipo_comprobante;
                return true;
            Exception
                return false;
        END;
    $$ LANGUAGE 'plpgsql';
------------------------------------------------------------TIPO_COMPROBANTE------------------------------------------------------------


------------------------------------------------------------COMPROBANTE DE PAGO------------------------------------------------------------
------------------------------------------------------------COMPROBANTE DE PAGO------------------------------------------------------------


------------------------------------------------------------DETALLE_COMPROBANTE------------------------------------------------------------
------------------------------------------------------------DETALLE_COMPROBANTE------------------------------------------------------------
