--Funcion para ver el monto total de la transaccion

Create or replace function fn_monto_total_transaccion(id_transaccion) returns float
$$
Declare
precio_habitacion money;
cantidad_dias int;
monto_total_servicio 

Begin
       select sum(monto_servicio) into from monto_total_servicio detalle_servicios
       where transaccion_id=id_transaccion;

       
end;
$$ language 'plpgsql';


