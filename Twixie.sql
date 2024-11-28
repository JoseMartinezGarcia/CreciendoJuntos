CREATE DATABASE App

USE APP

-- Tabla para almacenar información de los usuarios
CREATE TABLE Usuarios (
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    primer_nombre NVARCHAR(50) NOT NULL,
    segundo_nombre NVARCHAR(50) NULL,
    primer_apellido NVARCHAR(50) NOT NULL,
    segundo_apellido NVARCHAR(50) NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    contraseña NVARCHAR(255) NOT NULL,
    fecha_registro DATETIME DEFAULT GETDATE()
);

-- Tabla para almacenar los juegos
CREATE TABLE Juegos (
    id_juego INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(MAX),
    fecha_creacion DATETIME DEFAULT GETDATE()
);

-- Tabla para almacenar las puntuaciones de los usuarios en los juegos
CREATE TABLE Puntuaciones (
    id_puntuacion INT IDENTITY(1,1) PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_juego INT NOT NULL,
    puntuacion INT NOT NULL,
    fecha_juego DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_juego) REFERENCES Juegos(id_juego) ON DELETE CASCADE
);

-- Tabla para almacenar información de los grados
CREATE TABLE Grados (
    id_grado INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(50) NOT NULL,
    descripcion NVARCHAR(255) NULL
);

-- Tabla para almacenar información de las materias
CREATE TABLE Materias (
    id_materia INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(255) NULL
);

-- Tabla intermedia para asignar materias a grados
CREATE TABLE GradosMaterias (
    id_grado_materia INT IDENTITY(1,1) PRIMARY KEY,
    id_grado INT NOT NULL,
    id_materia INT NOT NULL,
    FOREIGN KEY (id_grado) REFERENCES Grados(id_grado) ON DELETE CASCADE,
    FOREIGN KEY (id_materia) REFERENCES Materias(id_materia) ON DELETE CASCADE
);
