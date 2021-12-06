CREATE OR REPLACE FUNCTION fn_trigger_actualizar_estado_habitacion() RETURNS trigger AS $$
DECLARE
	t_transaccion int;
BEGIN
    select new.tipo_transaccion_id into t_transaccion from transaccion where transaccion_id = new.transaccion_id;
	if t_transaccion = 1 OR t_transaccion = 2 then
		UPDATE habitación set estado_habitacion = 'O'
			where habitacion_id = new.habitacion_id ;
	else if;
    RETURN NEW;
END
$$ language 'plpgsql';

CREATE TRIGGER tr_actualizar_estado_habitacion AFTER INSERT OR UPDATE ON habitacion FOR EACH ROW EXECUTE PROCEDURE fn_trigger_actualizar_estado_habitacion();
