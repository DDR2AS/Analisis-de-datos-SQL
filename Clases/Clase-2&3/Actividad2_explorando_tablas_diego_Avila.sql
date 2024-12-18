 ------===ACTIVIDAD====================

-- 1. Ofertas
-- 2. Clientes
-- 3. Agencias
-- 4. Colaboradores
-- 5. Gestion
-- 6. Gestion_detalle

----Van a realizar  2 consultas  por tabla, agregar un alias , donde contenga 2 condiciones en cada una 
----mostrarme el conteo de los resultados, 

--Para la tabla ofertas, tenemos CLIENTE BP, NO CLIENTE BP y NULL
--NULL
SELECT * FROM ofertas o 
SELECT DISTINCT o.FLG_CLIENTE_BFP FROM ofertas o 
SELECT DISTINCT o.fecharegistrogestion FROM ofertas o 
--1. 
SELECT COUNT(*) [No Clientes con Bajo Riesgo]FROM ofertas o WHERE FLG_CLIENTE_BFP = 'NO CLIENTE BP' AND CAST(NivelRiesgo AS FLOAT) < 0.4 --295746
--2.--Quiero saber cuantas personas tienen tasas mayores y se han registrado antes del 2020-02-06
SELECT COUNT(*) FROM ofertas 
WHERE Tasa > 30 AND fechaRegistroGestion < CAST('20200206' AS DATE) --7867

SELECT * FROM Clientes c
SELECT DISTINCT c.nombre, c.apellidoMaterno, c.apellidopaterno FROM Clientes c
SELECT DISTINCT c.SEXO FROM Clientes c
--1.
SELECT COUNT(*) FROM Clientes 
WHERE nombre LIKE 'M%' AND apellidoPaterno LIKE 'L%'
--2.
SELECT COUNT(*) FROM Clientes 
WHERE numdoc LIKE '40%2%7' AND sexo = 'M' --53

SELECT * FROM Agencias a
SELECT DISTINCT CLUSTER FROM Agencias 
--1. 
SELECT COUNT(*) FROM Agencias a
WHERE cluster LIKE '%NIXON%' AND agencia LIKE '%CAR%'--11
--2.
SELECT * FROM Agencias a
WHERE ZONAL_NOMBRE IS NOT NULL AND AGENCIA LIKE '%CHORRILLO%'--2


SELECT * FROM Colaboradores cb
SELECT DISTINCT CB.ESTADO FROM Colaboradores cb E
--RENUNCIO
--A
--NULL
--1
--LICENCIA POST NATAL
--I

SELECT COUNT(*) [Staff de AG Basadre]FROM Colaboradores cb
WHERE AGENCIA LIKE '%BASADRE' AND ORIGEN LIKE 'STAFF'

SELECT COUNT(*) FROM Colaboradores cb
WHERE CODIGO_TRABAJADOR LIKE '101%' AND nombre LIKE '%pire%'

------------------------------------------------------------------------------------
SELECT * FROM Gestion g

SELECT COUNT(*) FROM Gestion g
WHERE ResultadoGestion = 20 AND CodigoProducto  LIKE 'PLD' AND GrupoEstadoGestion = 3 AND FechaRegistro < CAST('20201010' AS DATE)

SELECT COUNT(*) FROM Gestion g
WHERE CODIGO_TRABAJADOR LIKE '59%' AND YEAR(periodo + '01')= '2020' --2236

PRINT YEAR('202010' + '01')
-----------------------------------------------------
SELECT * FROM Gestion_detalle gd

SELECT COUNT(*) [Cliente corta abruptamente llamada]FROM Gestion_detalle gd
WHERE DetalleResultado LIKE '%cort%comunicación%' AND ResultadoTelefonoCRM LIKE '%Válido%'

SELECT COUNT(*) [Cliente corta abruptamente llamada]FROM Gestion_detalle gd
WHERE ResultadoGestionCRM LIKE '%no%llamar%' 



