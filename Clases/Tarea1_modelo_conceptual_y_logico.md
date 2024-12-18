<h1 align="center">Modelo Conceptual y Lógico de un Documento de Compra😊</h1>

## Tarea: 
📍 Crear un modelo conceptual y lógico de un documento de compra de un supermercado: En este caso usaremos el de  Metro.
📍 La idea es identificar **entidades**, **propiedades** y **relaciones**.

## 🔶 Modelo Conceptual 
- CLIENTE (IdCliente, nombres, apellidos, dni, email, telefono, fechaNac, genero)
- PRODUCTO (IdProducto, Nombre, precio, stock, categoria)
- BOLETA_VENTA (idBoleta, idCliente,codigoBoleta, nroArticulos,MontoTotal, descuento,MontoDsc#, fechaEmision, opGravada#,igv#, idEmpleado*, métodoPago)
- DETALLE_DE_VENTA (idDetalleVenta, idBoleta*, idProducto*, cantidad, PrecioUnitario, PrecioParcial)
- TARJETA_BONUS (idTarjeta, codTarjeta, idCliente*, saldoActual, fechaUltMod, idUltTransaccion )
- TRANSACCIONES_BONUS (idTransaccion, idTarjeta*, saldoAnterior, puntosGanados, saldoUsado, SaldoActual, fechaTransaccion, hora)
- SEDE (idSede, RazonSocial, direccion, distrito, telefono, ruc)
- EMPLEADOS (idEmpleado, Nombres, apellidos, direccion, idRol*, salario)
- ROLES (idRol, Rol, descripcion)
- CATEGORIA (idCategoria. nombreCategoria)


1. **CLIENTE**: 
   - **Propiedades**: 
     - IdCliente (PK): Identificador único del cliente.
     - Nombres: Nombres del cliente.
     - Apellidos: Apellidos del cliente.
     - Dni: Identificador de indentidad legal.
     - Email: Correo electrónico.
     - fechaNac: Fecha de nacimiento.
     - Genero: Sexo.

2. **PRODUCTO**: 
   - **Propiedades**: 
     - IdProducto (PK): Identificador único del producto.
     - Nombre: Nombre del producto.
     - Precio: Precio unitario.
     - Stock: Cantidad disponible en inventario.
     - Categoría: Tipo o categoría del producto.
    
3. **BOLETA_VENTA**: 
   - **Propiedades**:
     - IdBoleta (PK): Identificador único de la boleta.
     - IdCliente (FK): Cliente asociado a la venta.
     - CodigoBoleta: Número generado por default.
     - nroArticulos: Cantidad total de artículos.
     - MontoTotal: Total en soles (S/.).
     - Descuento: 
     - MontoDsc:
     - fechaEmision: 
     - opGravada:
     - igv:
     - métodoPago: 
     - idEmpleado (FK):

4.**DETALLE_DE_VENTA**
     - idDetalleVenta : Identificador único y secuencial.
     - idBoleta (FK) : Identificador para filtrar el detalle.
     - idProducto (FK): 
     - cantidad : Integer que representa cantidad.
     - PrecioUnitario : Sirve mantener registros temporales en caso cambie el precio.
     - PrecioParcial : Precio unitario x Cantidad.
 
