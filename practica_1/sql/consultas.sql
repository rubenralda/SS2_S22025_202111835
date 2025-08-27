-- 1. Total de compras por año
SELECT YEAR(Fecha) AS Año, 
       SUM(Unidades * CostoUnitario) AS TotalCompras
FROM Compras
GROUP BY YEAR(Fecha)
ORDER BY Año;

-- Total de ventas por año
SELECT YEAR(Fecha) AS Año, 
       SUM(Unidades * PrecioUnitario) AS TotalVentas
FROM Ventas
GROUP BY YEAR(Fecha)
ORDER BY Año;


-- 2.
SELECT p.NombreProducto, 
       AVG(c.CostoUnitario) AS CostoPromedio,
       AVG(v.PrecioUnitario) AS PrecioPromedio
FROM Ventas v
JOIN Compras c ON v.CodProducto = c.CodProducto
JOIN Productos p ON v.CodProducto = p.CodProducto
GROUP BY p.NombreProducto
HAVING AVG(v.PrecioUnitario) < AVG(c.CostoUnitario);


-- 3. 
SELECT s.Region, 
       YEAR(v.Fecha) AS Año,
       SUM(v.Unidades * v.PrecioUnitario) AS TotalIngresos
FROM Ventas v
JOIN Sucursales s ON v.CodSucursal = s.CodSucursal
GROUP BY s.Region, YEAR(v.Fecha)
ORDER BY Año, s.Region;

-- 4
SELECT s.Region, 
       YEAR(v.Fecha) AS Año,
       SUM(v.Unidades * v.PrecioUnitario) AS TotalIngresos
FROM Ventas v
JOIN Sucursales s ON v.CodSucursal = s.CodSucursal
GROUP BY s.Region, YEAR(v.Fecha)
ORDER BY Año, s.Region;

-- 5
SELECT TOP 5 pr.NombreProveedor,
       SUM(c.Unidades) AS TotalUnidades,
       SUM(c.Unidades * c.CostoUnitario) AS TotalCompras
FROM Compras c
JOIN Proveedores pr ON c.CodProveedor = pr.CodProveedor
GROUP BY pr.NombreProveedor
ORDER BY TotalCompras DESC;


