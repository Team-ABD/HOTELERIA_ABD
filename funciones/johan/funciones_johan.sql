-- Implementar una función que la cantidad y los tipos de caracteres que componen el 
-- número de documento del cliente según el tipo de persona y el tipo de documento
-- Esta función también también deberá validad que si es una persona jurídica el campo apellidos debe contener null

-- FUNCIÓN INSERT
    CREATE OR REPLACE FUNCTION fn_insert_cliente(id_tipo_documento int, nombre_cliente varchar(100), fecha_nac, id_tipo_persona, sexo_cliente, num_doc, id_pais) returns trigger as
    $$
        DECLARE
        BEGIN
            Insert into cliente(tipo_documento_id, apellidos, nombre, fecha_nacimiento, tipo_persona_id, sexo, numero_documento, pais_id) 
                values (id_tipo_documento, nombre_cliente, fecha_nac, id_tipo_persona, sexo_cliente, num_doc, id_pais)
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
