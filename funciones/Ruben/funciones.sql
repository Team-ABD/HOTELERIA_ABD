--porcentaje de las personas que han reservado en el hotel durante un intervalo de fechas
Create or replace function fn_porcentaje_personas_reserva(fechaini date, fechafin date) returns varchar as $$
Declare --variables creadas para almacenar los datos
	cantidadTot integer;
cantidadReserv integer;
porcentaje float;
porcen varchar;
Begin
           	--Mostramos el total de personas que se hospedaron en un tiempo determinado
          	Select count(*) into cantidadTot
          	from transaccion where fecha_registro between fechaini and fechafin;
          	--Rescatamos la informacion sobre el total de personas se hospedaron con reserva en un determinado tiempo.
          	Select count(*) into cantidadReserv
          	from transaccion where tipo =1 and fecha_registro between fechaini and fechafin;
          --al final se obtiene el porcentaje de las personas hospedadas 
          	porcentaje=cantidadReserv*100/cantidadTot;
          	porcen=porcentaje||'%';
          	return porcen;

Begin --Mostramos el total de personas que se hospedaron en un tiempo determinado
Select count(*) into cantidadTot
from transaccion
where fecha_registro between fechaini and fechafin;
--Rescatamos la informacion sobre el total de personas se hospedaron con reserva en un determinado tiempo.
Select count(*) into cantidadReserv
from transaccion
where tipo = true
	and fecha_registro between fechaini and fechafin;
--al final se obtiene el porcentaje de las personas hospedadas 
porcentaje = cantidadReserv * 100 / cantidadTot;
porcen = porcentaje || '%';
return porcen;
End;
$$ language 'plpgsql';

--funcion en cuanto a modificar la tabla servicio dado el codigo y descripcion del usuario
Create or replace function fn_update_servicio(codigo_servicio int, des character varying(25)) returns boolean as --retorno de tipo boolean true o false
	$$
Declare Begin --actualizar la tabla servicio en el campo descripcion que va a ser igual al campo ingresado 
	--y va a ser validado con el codigo de servicio
update servicio
set descripcion = des
where servicio_id = codigo_servicio;
return true;
Exception
when others then return false;
end;
$$ language 'plpgsql';
--cantidad de numero de clientes entre 2 fechas dadas
create or replace function fn_num_clientes_por_fecha(fechaini date, fechafin date) returns int as $$
Declare cantidad int;
Begin
select count(cli.cliente_id) into cantidad
from cliente cli
	inner join transaccion tra ON cli.cliente_id = tra.cliente
where tra.fecha_registro between fechaini and fechafin;
return cantidad;
end;
$$ language 'plpgsql'