-- Implementar una función que la cantidad de caracteres que componen el número de documento del cliente según el tipo 
-- de persona y el tipo de documento

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
        END;
    $$ LANGUAGE 'plpgsql';

-- FUNCIÓN DELETE
    CREATE OR REPLACE FUNCTION fn_delete_cliente(id_cliente int) returns boolean as
    $$
        DECLARE
        BEGIN
            Delete from cliente where cliente_id = id_cliente
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
	    END;
	$$ LANGUAGE 'plpgsql';

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Funciones par tipo de comprobante

-- INSERT
    CREATE OR REPLACE FUNCTION fn_insert_tipo_comprobante(id_tipo_comprobante int, descr_tip_comp varchar(7)) returns boolean as
    $$
        DECLARE
        BEGIN
            IF FOUND THEN
                Insert into tipo_comprobante(tipo_comprobante_id, descripcion) 
                    values (id_tipo_comprobante, descr_tip_comp); 
                return true;
            ELSE
                return false;
            END IF;            
        END;
    $$ LANGUAGE 'plpgsql';
-- DELETE
    CREATE OR REPLACE FUNCTION fn_delete_tipo_comprobante(id_tipo_comprobante int) returns boolean as
    $$
        DECLARE
        BEGIN
            IF FOUND THEN
                Delete from tipo_comprobante where tipo_comprobante_id = id_tipo_comprobante
                return true;
            ELSE
                return false;
            END IF;
        END;
    $$ LANGUAGE 'plpgsql';
    
-- UPDATE
    CREATE OR REPLACE FUNCTION fn_update_tipo_comprobante(id_tipo_comprobante int, descr_tip_comp varchar(7)) returns boolean as
    $$
        DECLARE
        BEGIN
            IF FOUND THEN
                Update set descripcion = id_tipo_comprobante, descr_tip_comp 
                    where tipo_comprobante_id = id_tipo_comprobante
                return true;
            ELSE
                return false;
            END IF;
        END;
    $$ LANGUAGE 'plpgsql';
    