--Datos de personas naturales alojadas por transaccion: Nombre completo, edad 
select concat_ws(' ',nombres, apellidos), age(current_date,fecha_nacimiento) from cliente
inner join transaccion using(cliente_id)
where transaccion_id='00000001' and tipo_persona=2;