--Inicio Funciones (Habitacion)

--
Create or replace function fn_registrar_habitacion(numeroHabitacion int, tipoHabitacion int) returns boolean
$$
Declare
Begin
   insert into habitacion (numero_habitacion,estado_habitacion,tipo_habitacion)
   values(numeroHabitacion,false,tipoHabitacion);
   return true;
end;
$$ language 'plpgsql';

Create or replace function fn_reparacion_habitacion(habitacionId serial) returns boolean
$$
Declare
Begin
   update habitacion set estado_habitacion='R' where habitacionId=habitacion_id;
   return true;
end;
$$ language 'plpgsql';
--Fin Funciones (Habitacion)

--Inicio Funciones (Transaccion)

--Funcion para registrar una transaccion solo cuando la habitacion tenga el estado de disponible
Create or replace function fn_registrar_transaccion(fechaTransaccion date, horaTransaccion time, tipoTransaccion int,
fechaEntrada date, horaEntrada date, fechaSalida date, horaSalida time, estadoPago boolean, habitacionId int,
cliente_id int)
) returns boolean
$$
Declare
estado_actual_habitacion int;

Begin
   select estado_habitacion into estado_actual_habitacion from habitacion
   where habitacion_id=habitacionId;

    if estado_actual_habitacion = 'D' then
        insert into transaccion(fecha_transaccion, hora_transaccion, tipo_transaccion,fecha_entrada, hora_entrada,
         fecha_salida, hora_salida, estado_pago, habitacion_id, cliente_id)
        values (current_date , horaTransaccion, tipoTransaccion, fechaEntrada, horaEntrada, fechaSalida, 
        horaSalida, estadoPago, habitacionId,cliente_id);
        
        return true;
    else
        return false;
    end if;
end;
$$ language 'plpgsql';

--Trigger para transaccion

Create or replace function fn_transaccion() returns trigger as
$$
Declare
Begin
	if TG_OP='INSERT' then
    update habitacion set estado_habitacion='O' where habitacion_id=new.habitacion_id;
    return new;
    else TG_OP='DELET' 
    update habitacion set estado_habitacion='D' where habitacion_id=old.habitacion_id;
    return old;
    end if;
end;
$$ language 'plpgsql';

Create trigger tr_insert_transaccion after insert or delete on transaccion  -- after(despues), before(antes) / insert, delete
for each row execute procedure fn_transaccion();
--Final Funciones (Transaccion)


