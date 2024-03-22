-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS AlquilerVehiculos;

-- Usar la base de datos recién creada
USE AlquilerVehiculos;

-- Crear la tabla de clientes
CREATE TABLE IF NOT EXISTS Clientes (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50),
    Email VARCHAR(100),
    Telefono VARCHAR(15)
);

-- Crear la tabla de vehículos
CREATE TABLE IF NOT EXISTS Vehiculos (
    VehiculoID INT PRIMARY KEY AUTO_INCREMENT,
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Anio INT,
    Tipo VARCHAR(50),
    PrecioPorDia DECIMAL(10, 2)
);

-- Crear la tabla de sucursales
CREATE TABLE IF NOT EXISTS Sucursales (
    SucursalID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100),
    Direccion VARCHAR(200),
    Telefono VARCHAR(15)
);

-- Crear la tabla de empleados
CREATE TABLE IF NOT EXISTS Empleados (
    EmpleadoID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50),
    SucursalID INT,
    FOREIGN KEY (SucursalID) REFERENCES Sucursales(SucursalID)
);

-- Crear la tabla de alquileres
CREATE TABLE IF NOT EXISTS Alquileres (
    AlquilerID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT,
    VehiculoID INT,
    FechaInicio DATE,
    FechaFin DATE,
    Total DECIMAL(10, 2),
    SucursalID INT,
    EmpleadoID INT,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (VehiculoID) REFERENCES Vehiculos(VehiculoID),
    FOREIGN KEY (SucursalID) REFERENCES Sucursales(SucursalID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);

-- Crear la tabla de pagos
CREATE TABLE IF NOT EXISTS Pagos (
    PagoID INT PRIMARY KEY AUTO_INCREMENT,
    AlquilerID INT,
    Monto DECIMAL(10, 2),
    FechaPago DATE,
    MetodoPago VARCHAR(50),
    FOREIGN KEY (AlquilerID) REFERENCES Alquileres(AlquilerID)
);

-- Crear la tabla de mantenimiento de vehículos
CREATE TABLE IF NOT EXISTS Mantenimiento (
    MantenimientoID INT PRIMARY KEY AUTO_INCREMENT,
    VehiculoID INT,
    FechaMantenimiento DATE,
    Descripcion VARCHAR(200),
    Costo DECIMAL(10, 2),
    FOREIGN KEY (VehiculoID) REFERENCES Vehiculos(VehiculoID)
);