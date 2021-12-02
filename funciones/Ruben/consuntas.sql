--mostrar la fecha de transaccion del cliente cuando y a que hora se produjo la transaccion y muestre
--el estado de la habitacion
select tra.fecha_transaccion,tra.hora_transaccion,thab.descripcion_tipo as tipo_habitacion,hab.estado_habitacion, cli.nombres as cliente
from transaccion tra
inner join habitacion hab on tra.habitacion_id=hab.habitacion_id
inner join tipo_habitacion thab on hab.tipo_habitacion_id=thab.tipo_habitacion_id
inner join cliente cli on cli.cliente_id=tra.cliente_id
where fecha_transaccion='02-12-2021'


