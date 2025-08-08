CREATE TABLE Compras (
    IdCompra INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    CodProveedor INT,
    CodProducto INT,
    CodSucursal INT,
    Unidades INT,
    CostoUnitario DECIMAL(10,2),
    FOREIGN KEY (CodProveedor) REFERENCES Proveedores(CodProveedor),
    FOREIGN KEY (CodProducto) REFERENCES Productos(CodProducto),
    FOREIGN KEY (CodSucursal) REFERENCES Sucursales(CodSucursal)
);

CREATE TABLE Proveedores (
    CodProveedor INT AUTO_INCREMENT PRIMARY KEY,
    NombreProveedor VARCHAR(100)
);

CREATE TABLE Productos (
    CodProducto INT AUTO_INCREMENT PRIMARY KEY,
    NombreProducto VARCHAR(100),
    MarcaProducto VARCHAR(50),
    Categoria VARCHAR(50)
);

CREATE TABLE Sucursales (
    CodSucursal INT AUTO_INCREMENT PRIMARY KEY,
    NombreSucursal VARCHAR(100),
    Region VARCHAR(50),
    Departamento VARCHAR(50)
);

CREATE TABLE Ventas (
    IdVenta INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    CodCliente INT,
    CodVendedor INT,
    CodSucursal INT,
    CodProducto INT,
    Unidades INT,
    PrecioUnitario DECIMAL(10,2),
    FOREIGN KEY (CodCliente) REFERENCES Clientes(CodCliente),
    FOREIGN KEY (CodVendedor) REFERENCES Vendedores(CodVendedor),
    FOREIGN KEY (CodSucursal) REFERENCES Sucursales(CodSucursal),
    FOREIGN KEY (CodProducto) REFERENCES Productos(CodProducto)
);

CREATE TABLE Clientes (
    CodCliente INT AUTO_INCREMENT PRIMARY KEY,
    NombreCliente VARCHAR(100),
    TipoCliente VARCHAR(50)
);

CREATE TABLE Vendedores (
    CodVendedor INT AUTO_INCREMENT PRIMARY KEY,
    NombreVendedor VARCHAR(100)
);
