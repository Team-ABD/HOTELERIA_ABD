--mostrar la fecha de transaccion del cliente cuando y a que hora se produjo la transaccion y muestre
--el estado de la habitacion
select tra.fecha_transaccion,tra.hora_transaccion,thab.descripcion_tipo as tipo_habitacion,hab.estado_habitacion, cli.nombres as cliente
from transaccion tra
inner join habitacion hab on tra.habitacion_id=hab.habitacion_id
inner join tipo_habitacion thab on hab.tipo_habitacion_id=thab.tipo_habitacion_id
inner join cliente cli on cli.cliente_id=tra.cliente_id
where fecha_transaccion='02-12-2021'

--mostrar los clientes de tipo natural segun el tipo de habitacion

select habitacion.tipo_habitacion_id,concat(apellidos,'',nombres) as cliente from transaccion inner join habitacion on habitacion.habitacion_id=transaccion.habitacion_id
inner join cliente on cliente.cliente_id=transaccion.cliente_id
inner join tipo_habitacion on habitacion.tipo_habitacion_id=tipo_habitacion.tipo_habitacion_id
where cliente.tipo_persona_id=1


