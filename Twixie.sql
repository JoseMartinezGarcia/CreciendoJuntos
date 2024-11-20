-- Crear la base de datos
CREATE DATABASE Twixie;

-- Usar la base de datos creada
USE Twixie;



-- Tabla para almacenar información de los usuarios
CREATE TABLE Usuarios (
    id_usuario INT IDENTITY(1,1) PRIMARY KEY, -- Uso de IDENTITY en lugar de AUTO_INCREMENT
    nombre NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    contraseña NVARCHAR(255) NOT NULL,
    fecha_registro DATETIME DEFAULT GETDATE() -- Uso de GETDATE() para la fecha actual
);

-- Tabla para almacenar los juegos
CREATE TABLE Juegos (
    id_juego INT IDENTITY(1,1) PRIMARY KEY, -- Uso de IDENTITY
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(MAX),
    fecha_creacion DATETIME DEFAULT GETDATE()
);

-- Tabla para almacenar las puntuaciones de los usuarios en los juegos
CREATE TABLE Puntuaciones (
    id_puntuacion INT IDENTITY(1,1) PRIMARY KEY, -- Uso de IDENTITY
    id_usuario INT NOT NULL,
    id_juego INT NOT NULL,
    puntuacion INT NOT NULL,
    fecha_juego DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_juego) REFERENCES Juegos(id_juego) ON DELETE CASCADE
);

SELECT name 
FROM sys.objects 
WHERE type = 'UQ' AND parent_object_id = OBJECT_ID('Usuarios');


ALTER TABLE Usuarios
DROP CONSTRAINT UQ__Usuarios__AB6E61640AC30AB6


ALTER TABLE Usuarios
DROP COLUMN email;
