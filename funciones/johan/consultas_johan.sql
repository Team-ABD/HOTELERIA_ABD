-- Los mejores 5 clientes de cada tipo (natural y jurídica)
-- Tipo de persona, tipo de doc cliente, num doc cliente, nombres y apellidos cliente o razón social, monto acumulado

select tper.desrcipcion as "Tipo de Persona", tdoc.descripcion as "Tipo de Documento", cli.numero_documento as "Num. Documento", 
    concat(cli.nombres,' ',cli.apellidos) as "Nombre Cliente", sum(comp.monto_comprobante) as "Monto Acumulado"
from comprobante_pago comp
    inner join 



-- Ingreso acumulados obtenidos por cada tipo de habitación
