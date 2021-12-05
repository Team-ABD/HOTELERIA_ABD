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

------------------------------------------------------------HABITACION------------------------------------------------------------


------------------------------------------------------------TIPO_DOCUMENTO------------------------------------------------------------
------------------------------------------------------------TIPO_DOCUMENTO------------------------------------------------------------


------------------------------------------------------------TIPO_PERSONA------------------------------------------------------------
------------------------------------------------------------TIPO_PERSONA------------------------------------------------------------


------------------------------------------------------------ PAÍS ------------------------------------------------------------
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
------------------------------------------------------------TIPO_TRANSACCIÓM------------------------------------------------------------


------------------------------------------------------------TRANSACCIÓN------------------------------------------------------------
------------------------------------------------------------TRANSACCIÓN------------------------------------------------------------


------------------------------------------------------------TRANSACCIÓN_ALOJAMIENTO------------------------------------------------------------
------------------------------------------------------------TRANSACCIÓN_ALOJAMIENTO------------------------------------------------------------


------------------------------------------------------------DETALLE_SERVICIOS------------------------------------------------------------
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
