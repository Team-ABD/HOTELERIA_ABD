--Funcion para ver el monto total de la transaccion

Create or replace function fn_monto_total_transaccion(id_transaccion int) returns money as
$$
Declare
precio_habitacion money;
cantidad_dias int;
monto_total_servicio money;
f_entrada date;
f_salida date;
Begin
       select sum(monto_servicio) into monto_total_servicio from detalle_servicios
       where transaccion_id=id_transaccion;

       select precio_base into precio_habitacion from tipo_habitacion th
       inner join habitacion hab on hab.tipo_habitacion_id= th.tipo_habitacion_id
       inner join transaccion using(habitacion_id)
       where transaccion_id=id_transaccion;
       
       Select fecha_entrada into f_entrada from Transaccion
       where transaccion_id=id_transaccion;
       
       Select fecha_salida into f_salida from Transaccion
       where transaccion_id=id_transaccion;

       if f_entrada is not null and f_salida is not null then
        select f_salida-f_entrada into cantidad_dias from Transaccion
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


--Habitacion

Create or replace function insertar_habitacion(num_hab int, tip_hab_id char) returns boolean as
$$
Declare
Begin
  -- Por defecto al registrar una habitacion esta estará desocupada
  insert into habitacion(numero_habitacion,estado_habitacion,tipo_habitacion_id) values(num_hab, 'D', tip_hab_id)

end;
$$ language 'plpgsql';