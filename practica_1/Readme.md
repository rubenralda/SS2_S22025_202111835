# Proyecto ETL SG-FOOD

##  Nombre del proyecto
**ETL para la integración y limpieza de datos en SG-FOOD**

## Descripción del problema
SG-FOOD es una empresa dedicada a la compra, distribución y comercialización de productos alimenticios, con sucursales en diferentes regiones del país.  

Con el crecimiento de la empresa, surgieron los siguientes problemas:
- Diferentes formatos entre sucursales para almacenar datos.  
- Complejidad para generar reportes globales de compras y ventas.  
- Sobrecarga en las bases de datos transaccionales.  

Estos factores dificultaban la toma de decisiones estratégicas y reducían la eficiencia operativa debido al exceso de procesos manuales para revisar grandes volúmenes de información.

## Proceso ETL

### 1. **Extracción**
- Los datos provienen de archivos y bases de datos heterogéneas (distintos formatos por sucursal).
- Se definieron tablas **Compras, Ventas, Proveedores, Productos, Sucursales, Clientes, Vendedores** en SQL Server.
- Los datos se cargan al flujo de SSIS utilizando componentes **OLE DB Source** y archivos externos.

### 2. **Transformación**
Se utilizó un **Script Component Transformation (C#)** en Visual Studio para limpiar y normalizar los datos antes de cargarlos.  
Las reglas aplicadas fueron:

- **Fecha:**  
  - Reemplazar `"Z"` por `"2"` en las cadenas que venían mal formateadas.  
  - Convertirlas a tipo `DATE`.  

- **CodProveedor:**  
  - Si está vacío, asignar `"SinProv"`.  

- **Categoría:**  
  - Si contiene `"Ninguna"`, reemplazar por `"Sin categoria"`.  

- **Unidades:**  
  - Si está vacío, asignar `0`.  
  - Si es negativo, multiplicar por `-1`.  

- **CostoUnitario:**  
  - Si está vacío, asignar `0`.  
  - Si es negativo, multiplicar por `-1`.  

### 3. **Carga**
- Los datos ya limpios se insertaron en las tablas normalizadas de SQL Server (`Compras`, `Ventas`, `Proveedores`, `Productos`, `Sucursales`, `Clientes`, `Vendedores`).  
- Se respetaron las **claves primarias** y **foráneas** para garantizar integridad referencial.  

## Modelo empresarial implementado

Se eligió un **modelo relacional normalizado** como base para el Data Warehouse, debido a:  
- Facilitar la integración de múltiples fuentes.  
- Mantener consistencia e integridad de la información.  
- Permitir consultas eficientes sin sobrecargar los sistemas transaccionales.  

En fases posteriores, este modelo puede evolucionar hacia un **esquema en estrella** para facilitar análisis OLAP.

## Tablas del modelo empresarial

### **Compras**
- `IdCompra` (PK)  
- `Fecha`  
- `CodProveedor` (FK)  
- `CodProducto` (FK)  
- `CodSucursal` (FK)  
- `Unidades`  
- `CostoUnitario`  

### **Proveedores**
- `CodProveedor` (PK)  
- `NombreProveedor`  

### **Productos**
- `CodProducto` (PK)  
- `NombreProducto`  
- `MarcaProducto`  
- `Categoria`  

### **Sucursales**
- `CodSucursal` (PK)  
- `NombreSucursal`  
- `Region`  
- `Departamento`  

### **Ventas**
- `IdVenta` (PK)  
- `Fecha`  
- `CodCliente` (FK)  
- `CodVendedor` (FK)  
- `CodSucursal` (FK)  
- `CodProducto` (FK)  
- `Unidades`  
- `PrecioUnitario`  

### **Clientes**
- `CodCliente` (PK)  
- `NombreCliente`  
- `TipoCliente`  

### **Vendedores**
- `CodVendedor` (PK)  
- `NombreVendedor`  

## Conclusiones
- El proceso ETL permitió **integrar y estandarizar datos** provenientes de distintas sucursales.  
- Se mejoró la **calidad de los datos**, eliminando valores nulos, negativos y mal formateados.  
- El modelo relacional permite consultas confiables para la toma de decisiones.  
- SG-FOOD ahora dispone de una base consolidada que puede evolucionar hacia un **Data Warehouse analítico**.  
