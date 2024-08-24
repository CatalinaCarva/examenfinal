
CREATE DATABASE ControlViajeros;

USE ControlViajeros;
CREATE TABLE TiposDeMovimiento
(
    id INT PRIMARY KEY IDENTITY,
    Descripcion VARCHAR(50) NOT NULL
);

CREATE TABLE Viajeros
(
    id INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    TipoDocumento INT NOT NULL,
    NumeroDocumento VARCHAR(30) UNIQUE NOT NULL,
    Nacionalidad VARCHAR(50) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    CONSTRAINT FK_TipoDocumento FOREIGN KEY (TipoDocumento) REFERENCES TiposDeMovimiento(id)
);

CREATE TABLE Movimientos
(
    id INT PRIMARY KEY IDENTITY,
    Viajero INT NOT NULL,
    FechaHora DATETIME NOT NULL,
    TipoMovimiento INT NOT NULL,
    Lugar VARCHAR(60) NOT NULL,
    CONSTRAINT FK_Viajero FOREIGN KEY (Viajero) REFERENCES Viajeros(id),
    CONSTRAINT FK_TipoMovimiento FOREIGN KEY (TipoMovimiento) REFERENCES TiposDeMovimiento(id)
);
