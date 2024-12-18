-----------------LENGUAJE DML
---JOINS-------------UNION-------------EXCEPT
select gestion.CodigoProducto,
GESTION_DETALLE.DetalleResultado
from GESTION left join gestion_detalle
on gestion.resultadogestion = gestion_detalle.ResultadoGestion
