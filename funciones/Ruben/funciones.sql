Create or replace function fn_porcentaje_personas_reserva(fechaini date, fechafin date) returns varchar as
$$
Declare
--variables creadas para almacenar los datos
cantidadTot integer;
cantidadReserv integer;
porcentaje float;
porcen varchar;
Begin
           	--Mostramos el total de personas que se hospedaron en un tiempo determinado
          	Select count(*) into cantidadTot
          	from transaccion where fecharegistro between fechaini and fechafin;
          	--Rescatamos la informacion sobre el total de personas se hospedaron con reserva en un determinado tiempo.
          	Select count(*) into cantidadReserv
          	from transaccion where tipo =True and fecharegistro between fechaini and fechafin;
          --al final se obtiene el porcentaje de las personas hospedadas 
          	porcentaje=cantidadReserv*100/cantidadTot;
          	porcen=porcentaje||'%';
          	return porcen;
End;
$$ language 'plpgsql';


--funcion en cuanto a modificar la tabla servicio dado el codigo y descripcion del usuario
Create or replace function fn_update_servicio(codigo_servicio int,des character varying(25))
returns boolean as --retorno de tipo boolean true o false
$$
Declare
Begin
    --actualizar la tabla servicio en el campo descripcion que va a ser igual al campo ingresado 
	--y va a ser validado con el codigo de servicio
	update servicio set descripcion=des where servicio_id=codigo_servicio;
	return true;
Exception
	when others then return false;
end;
$$ language 'plpgsql';
