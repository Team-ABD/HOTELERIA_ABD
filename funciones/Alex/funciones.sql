-- Habitación mas pedidas por año
Create or replace function fn_habitacionMasPedidaxAño(año int) returns 
	table(habitacion int, cantidad_clientes bigint) as	
$$
Declare
Begin
	return query
	select hab.numero as habitacion, count(*) as cantidad_clientes
	from transaccion tra 
	inner join habitacion hab on hab.habitacionid=tra.habitacionid
	join cliente cl on tra.clienteid=cl.clienteid
	where extract(year from tra.fecha_alojamiento)=año
	GROUP BY hab.numero
	order by 2 desc;
end;

-- cantidad de habitacion por año
Create or replace function fn_cantidadHabxaño( año int) returns 
	table(cantidad_habitaciones bigint) as
$$
Declare
Begin
	return query
	Select 
	count(*) as cantidad_habitaciones
    from habitacion hab inner join transaccion tra on hab.habitacionid=tra.habitacionid
    where extract(year from tra.fecha_alojamiento)=año
    group by año;
end;
$$ language 'plpgsql';

-- porcentaje  de transaccion por tipo de persona
create or replace function fn_porcentaje_transaccion_por_tipo_persona(tp char(1)) returns numeric(5,2) as
$$
declare
	porcentaje numeric(5,2);
begin
	select cast( (count(*)*100.0) /( select count(*) into porcentaje from transaccion) as numeric(5,2)) 
	from transaccion tr inner join cliente cl on cl.clienteid=tr.clienteid where tipo_persona = upper(tp);
	return porcentaje;
end;
$$ language 'plpgsql'

