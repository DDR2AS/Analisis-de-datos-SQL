--Tablas de la base de datos
-- Call center
-- 1. Ofertas
-- 2. Clientes
-- 3. Agencias
-- 4. Colaboradores
-- 5. Gestion
-- 6. Gestion_detalle

SELECT TOP 10 * FROM clientes
SELECT TOP 10 * FROM ofertas
SELECT TOP 10 * FROM agencias
SELECT TOP 10 * FROM colaboradores
SELECT TOP 10 * FROM gestion
SELECT TOP 10 * FROM gestion_detalle

--Para obtener los datos distintos de una columna
SELECT DISTINCT sexo FROM Clientes
SELECT DISTINCT zonal_nombre from agencias

SELECT DISTINCT nombre, sexo FROM CLIENTES

--Obteniendo los campos (click derecho ->copy with headers)
--id	NumDoc	codigo_producto	CODIGO_TRABAJADOR	CARTERA	TipoAsignacion	PeriodoVigencia	TipoDoc	Producto	Tasa	MontoCuota	Linea	TipoTC	Plazo	NivelRiesgo	FechaInicio	FechaFin	Tipo_Cobro	Prima	Tipo_Producto	Fecha_Vencimiento	Tasa_Original	undtiempoplazo	Deuda	Provision	FLG_CLIENTE_BFP	Gestionado	EstadoGestion	FechaRegistroGestion	Codigo_TrabajadorRegistroGestion	nrooperacion	moneda	FechaCarga	HorarioAtencion	Flg_Desembolsado	MontoDesembolsado	codigo_colaborador_desembolsado	GrupoEstadoGestion	FechaVolverLllamar	isVisibleCRM	Variacion	VariacionProductos	productos	prioridad	SEGMENTACION	ResultadoGestion	NUMDOC_FAIL	flg_validacionDNI	flg_validacionDNI1
--361001	aaaa20803628	PLD	NULL	sin telefono	NULL	202109	NULL	PRESTAMO DE LIBRE DISPONIBILIDAD (TEA 38%) | LINEA S/.4,400 (12 MESES) | LINEA S/.4,400 (24 MESES) | LINEA S/.4,400 (36 MESES) | LINEA S/.4,400 (48 MESES) 	38	NULL	4400	NULL	48	.291523323667984	2021-09-01 00:00:00	2021-09-30 00:00:00	NULL	NULL	NULL	NULL	NULL	18 meses	NULL	NULL	CLIENTE BP	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	1	NULL	NULL	NULL	NULL	NULL	NULL	20803628	0	NULL

--NumDoc
--aaaa02606086
--CARTERA
--sin telefono
--PeriodoVigencia
--202109
--Producto
--PRESTAMO DE LIBRE DISPONIBILIDAD (TEA 30%) | LINEA S/.3,900 (12 MESES) | LINEA S/.6,800 (24 MESES) | LINEA S/.7,000 (36 MESES) | LINEA S/.7,000 (48 MESES) 

-- ALT + F1 en la tabla clientes para ver las propiedades.
--seleccionar los encabezados necesarios y copiar
--luego colocar la coma con shift+alt+flecha abajo

-- alternativa: usar sp_help 'nombre_tabla'
SELECT 
id                 
,nombre			  
,apellidoPaterno	   
,apellidoMaterno	   
,numdoc			   
,sexo			   
,telefono		   
FROM CLIENTES

sp_help 'ofertas'

--######Generar consulta en los siguientes campos
--				de la tabla ofertas

--los 100 primero resultados
--dni , linea , tas a ,plazo , resultado de gestion  , periodo Vigencia 

SELECT TOP 100 
NumDoc
,Linea
,Tasa
,Plazo
,ResultadoGestion
,EstadoGestion
,PeriodoVigencia
FROM ofertas

print  'hola'         -- muestrame como mensaje
SELECT 'hola'         ---muestrame una tabla
--## Para nombre de columnas
SELECT 'hola' as Mensaje         
SELECT 'hola' as 'Mensaje'         
SELECT 'hola' as 'Mensaje de bienvenida'         
SELECT 'hola' as [Mensaje de bienvenida]

--Usando alias para las columnas
SELECT NumDoc [DNI], Linea [Linea a donde vamos a llamar] FROM ofertas
--Hallar los campos calculados y colocando nombre a la columna resultante
SELECT TOP 100 (Linea*tasa) [Resultado] FROM ofertas
SELECT TOP 100 (Linea*tasa) 'Calculo inter�s' FROM ofertas
SELECT TOP 100  (Linea  + (tasa/100)) [calculo de interes] , *   FROM ofertas


--USANDO ALIAS PARA LAS TABLAS
--tenemos la misma licencia para el AS, SQL es capaz de interpretar 
--adecuadamente el nombre de la tabla
select  ofertas.linea , ofertas.tasa    from ofertas
select  a.linea , a.tasa      from ofertas as a  --- alias
select  t1.linea , t1.tasa    from ofertas  t1  --- alias

-- Usando Where, para colocar las condiciones de la b�squeda
select top 1000 o.* from ofertas o
where linea = 5000
-- mayor que
select top 1000 o.* from ofertas o
where linea > 5000
-- menor que 
select top 1000 o.* from ofertas o
where linea < 5000
--menor igual
select top 1000 o.* from ofertas o
where linea <= 5000

--Combinando condiciones
SELECT TOP 1000 a.* FROM OFERTAS a
WHERE linea = 5000 AND Tasa <20 -- Ambas condiciones se cumplen
---SQL procesa las instrucciones de izquierda a derecha.

--Consideraciones: 
--    -45:06 min left
SELECT TOP 1000 
a.id
,a.Producto
,a.Tasa
,a.Linea
,a.NivelRiesgo
,a.FechaInicio
,a.FechaFin
,a.PeriodoVigencia
FROM ofertas a 
WHERE linea  = 5000 OR tasa = 30 or periodoVigencia = '202107'

--Al ordenar con parentesis , cambiamos el significado del condicional
--en este caso quiero que la l�nea sea igual a 5000 y la tasa igual a 30 O SINO vemos el periodo de vigencia
SELECT 
a.id
,a.Producto
,a.Tasa
,a.Linea
,a.NivelRiesgo
,a.FechaInicio
,a.FechaFin
,a.PeriodoVigencia
FROM ofertas a 
WHERE (linea  = 5000 AND tasa = 30) or periodoVigencia = '202107'
--la linea si o si debe ser 5000 y la segunda condici�n puede que cumpla la tasa o el periodo de vigencia
--Cambia el significado completamente.
SELECT  
a.id
,a.Producto
,a.Tasa
,a.Linea
,a.NivelRiesgo
,a.FechaInicio
,a.FechaFin
,a.PeriodoVigencia
FROM ofertas a 
WHERE linea  = 5000 AND (tasa = 30 or periodoVigencia = '202107')

--------------------#########################---------------------------------
SELECT * FROM ofertas a
WHERE NOT (linea = 5000) -- puedo negar un grupo de condiciones 

SELECT * FROM ofertas a
WHERE NOT (linea = 5000 OR tasa = 30) -- 2 operaciones

SELECT * FROM ofertas a
WHERE  (linea != 5000 AND tasa != 30)

---CONTAR REGISTROS
SELECT COUNT(*) [Cantidad Columnas que cumplen]  FROM ofertas a
WHERE NOT (linea = 5000 OR tasa = 30) -- 2 operaciones

SELECT COUNT(*) [Cantidad Columnas que cumplen] FROM ofertas a
WHERE  (linea != 5000 AND tasa != 30)

---CONTAR REGISTROS
SELECT COUNT(*) [Cantidad Columnas que cumplen]  FROM ofertas a
WHERE NOT (linea = 5000 ) AND NOT (tasa = 30) -- 2 operaciones
----para rangos, incluye el rango minimo y m�ximo, es equivalente a <= y >=
SELECT * FROM ofertas a WHERE linea BETWEEN 5000 AND 10000


