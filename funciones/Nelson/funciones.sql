--Función para consultar número de clientes por países
select pa.nombre_pais, count(*) cli.pais_id
from cliente cli inner join pais pa on pa.paisid = cli.pais_id
order by 1 asc