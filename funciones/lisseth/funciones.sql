--Funcion para ver el monto total de la transaccion

Create or replace function fn_monto_total_transaccion(id_transaccion) returns float
$$
Declare
precio_habitacion money;
cantidad_dias int;
monto_total_servicio;
Begin
       select sum(monto_servicio) into monto_total_servicio from detalle_servicios
       where transaccion_id=id_transaccion;

       select precio_base into precio_habitacion from tipo_habitacion th
       inner join habitacion hab on hab.tipo_habitacion= th.tipo_habitacion_id
       inner join transaccion using(habitacion_id)
       where transaccion_id=id_transaccion;
       
       if fecha_entrada!=null and fecha_salida!=null then
       select fecha_entrada-fecha_salida into cantidad_dias from Transaccion
       where transaccion_id=id_transaccion;
       end if;
       
       return monto_total_servicio + cantidad_dias*precio_habitacion;
end;
$$ language 'plpgsql';

--Cantidad de personas alojadas por transaccion
Create or replace function fn_cantidad_alojados_transaccion(id_transaccion) returns int
$$
Declare
cantidad_personas int;
Begin
    select sum(*) from transaccion_alojamiento
    inner join transaccion using(transaccion_id)
    where transaccion_id=id_transaccion;

    return cantidad_personas;
end;
$$ language 'plpgsql';
    