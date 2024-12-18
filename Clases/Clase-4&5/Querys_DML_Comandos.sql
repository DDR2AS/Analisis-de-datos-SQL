use SqlCourse64

--Como buscar una persona, del cual solo conozco parcialmente el nombre

--Para hallar valores no nulos, no se puede igualar. NUll es un estado
--     1. No usar <> null
--     2. != null

--Nombres que comiencen con la letra 'A'
SELECT TOP 100 * FROM Clientes
WHERE nombre is not null
and nombre like 'A%'    -- % indica que puede seguir cualquier texto
--Nombres que terminen con la letra 'A'
SELECT TOP 100 * FROM Clientes
WHERE nombre is not null
and nombre like '%A'
ORDER BY apellidoPaterno ASC
--nombres que contengan 'au' en cualquier parte
SELECT TOP 100 * FROM Clientes
WHERE nombre is not null
and nombre like '%au%a'

-- % significa ilimitado número de caracteres
-- _ indica separacion por 1 solo caracter

SELECT TOP 100 COUNT(*) [Cantidad de personas] FROM Clientes
WHERE nombre like 'a____' --buscando palabras de 5 letras que comienzan con A

SELECT TOP 100 nombre, apellidoPaterno FROM Clientes
WHERE nombre LIKE 'an_l%'

--expresiones regulares SQL búsqueda google
SELECT TOP 100 nombre, apellidoPaterno FROM Clientes
WHERE nombre LIKE '[A-C]%'

--'%[A-Z0-9][@][]'

--####### EXPRESION IN 
--Sirve para explorar diversas coincidencias
-- codigo_producto = 'HIPOTECARIO_LEAD' or codigo_producto = 'PLD'

SELECT * FROM ofertas
WHERE codigo_producto in ('HIPOTECARIO_LEAD','PLD','CONVENIO_TN','PLD_B2B')

--###### FUNCIONES ALTERNATIVAS Y NECESARIAS

--obtener fechas, se usa para asignar valores
print getdate()

SELECT DATEPART(HOUR, GETDATE()) AS Hora,
       DATEPART(MINUTE, GETDATE()) AS Minuto,
       DATEPART(SECOND, GETDATE()) AS Segundo,
	   DATEPART(MILLISECOND, GETDATE()) AS milisegundos,
	   DATEPART(YEAR, GETDATE()) AS año,
	   DATEPART(MONTH, GETDATE()) AS mes,
	   DATEPART(DAY, GETDATE()) AS dia;

SELECT DATEPART(HOUR,GETDATE()) AS HORA

PRINT GETDATE()

--La función GETDATE() en SQL Server devuelve la fecha y hora actuales del sistema 
--La función DATEPART() te permite extraer partes específicas de una fecha y hora

--HOUR: Devuelve la hora (de 0 a 23).
--MINUTE: Devuelve los minutos (de 0 a 59).
--SECOND: Devuelve los segundos (de 0 a 59).
--MILLISECOND: Devuelve los milisegundos (de 0 a 999).

--Sumando dias
PRINT GETDATE() - 1 --- DIAS
PRINT GETDATE() + 2 --- DIAS

PRINT DAY(GETDATE())
PRINT MONTH(GETDATE())
PRINT YEAR(GETDATE())
PRINT HOUR(GETDATE()) 
PRINT SECOND(GETDATE())
--------------------------------------------------
-- Alternativa usando time
--CAST convierte un valor de un tipo a otro tipo

SELECT CAST(GETDATE() AS TIME) AS HoraActual;
PRINT CAST('20241216' AS DATE)

--CONVERT(TIPO DE NUEVO, VALOR , FORMATO )
--SQL CONVERT AND CAST BUSQUEDA GOOGLE

PRINT CONVERT(DATE, '16.12.2024', 104)

print 'tengo ' + cast(datediff(year, '20011004', getdate()) as varchar) + ' años, ' + cast(datediff(month, '19900710', getdate()) as varchar) + ' meses, ' + cast(datediff(day, '19900710', getdate()) as varchar) + ' dias.'
print concat('tengo ', cast(datediff(year, '19900710', getdate()) as varchar), ' años, ', cast(datediff(month, '20240710', getdate()) as varchar), ' meses, ', cast(datediff(day, '20241201', getdate()) as varchar), ' dias.')

DECLARE @hoy DATE = GETDATE()
DECLARE @edadDias int = DATEDIFF(DAY, '20011004',GETDATE())

DECLARE @añosDecimal float = (@edadDias * 1.00) / 365
DECLARE @años int = DATEDIFF(YEAR, '20011004',GETDATE())
DECLARE @excedenteEdad float = @añosDecimal - @años
DECLARE @mesesDecimales float = (@excedenteEdad *12)/365

PRINT @hoy
PRINT @años
PRINT @excedenteEdad
PRINT @mesesDecimales

---REstar fechas
PRINT DATEADD(DAY, 1, GETDATE())
PRINT DATEADD(MONTH, 1, GETDATE())
PRINT DATEADD(YEAR, 1, GETDATE())

PRINT DATEADD(DAY, -1, GETDATE())
PRINT DATEADD(MONTH, -1, GETDATE())
PRINT DATEADD(YEAR, -1, GETDATE())
------ END OF MONTH
PRINT EOMONTH(GETDATE())
-----------------------------------------
-- LA FUNCIÓN FORMAT() DEVUELVE TEXTOO
PRINT FORMAT(CAST('20241004' AS DATE), 'dd.-.MMMM.-.yy')
--d dia
--M mes
--y año
--m minutos
--s segundos
--ms milisegundos

PRINT FORMAT(CAST('20240220' AS DATE), 'yyyyMM') + '01'
PRINT EOMONTH(CAST('20240220' AS DATE))


-- ######## FORMATEO DE TEXTOS
PRINT FORMAT(1846531351684136, 'N2')
PRINT FORMAT(184653135.1684136, 'N0')
