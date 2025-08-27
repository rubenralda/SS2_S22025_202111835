use Practica1;

CREATE TABLE Compras (
    IdCompra INT IDENTITY(1,1) PRIMARY KEY,
    Fecha DATE,
    CodProveedor VARCHAR(100),
    CodProducto VARCHAR(100),
    CodSucursal VARCHAR(100),
    Unidades INT,
    CostoUnitario DECIMAL(10,2),
    FOREIGN KEY (CodProveedor) REFERENCES Proveedores(CodProveedor),
    FOREIGN KEY (CodProducto) REFERENCES Productos(CodProducto),
    FOREIGN KEY (CodSucursal) REFERENCES Sucursales(CodSucursal)
);

CREATE TABLE Proveedores (
    CodProveedor VARCHAR(100) PRIMARY KEY,
    NombreProveedor VARCHAR(100)
);

CREATE TABLE Productos (
    CodProducto VARCHAR(100) PRIMARY KEY,
    NombreProducto VARCHAR(100),
    MarcaProducto VARCHAR(50),
    Categoria VARCHAR(50)
);

CREATE TABLE Sucursales (
    CodSucursal VARCHAR(100) PRIMARY KEY,
    NombreSucursal VARCHAR(100),
    Region VARCHAR(50),
    Departamento VARCHAR(50)
);

CREATE TABLE Ventas (
    IdVenta INT IDENTITY(1,1) PRIMARY KEY,
    Fecha DATE,
    CodCliente VARCHAR(100),
    CodVendedor VARCHAR(100),
    CodSucursal VARCHAR(100),
    CodProducto VARCHAR(100),
    Unidades INT,
    PrecioUnitario DECIMAL(10,2),
    FOREIGN KEY (CodCliente) REFERENCES Clientes(CodCliente),
    FOREIGN KEY (CodVendedor) REFERENCES Vendedores(CodVendedor),
    FOREIGN KEY (CodSucursal) REFERENCES Sucursales(CodSucursal),
    FOREIGN KEY (CodProducto) REFERENCES Productos(CodProducto)
);

CREATE TABLE Clientes (
    CodCliente VARCHAR(100) PRIMARY KEY,
    NombreCliente VARCHAR(100),
    TipoCliente VARCHAR(50)
);

CREATE TABLE Vendedores (
    CodVendedor VARCHAR(100) PRIMARY KEY,
    NombreVendedor VARCHAR(100)
);
