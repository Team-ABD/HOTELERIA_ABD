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

--Modificar un servicio

--Insertar tipo_habitacion
Create or replace function fn_insert_tipo_habitacion(descripcion character varying, precio money) returns boolean AS
$$
Declare 
Begin 
	insert into tipo_habitacion(description_tipo,precio_base) values (descripcion, precio);
Exception 
	when others then return false;
end;
$$ language 'plpgsql';

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

