USE [master]
GO
/****** Object:  Database [ControlEscolar]    Script Date: 14/01/2023 10:54:20 p. m. ******/
CREATE DATABASE [ControlEscolar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DAguirreControlEscolar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ControlEscolar.mdf' , SIZE = 5184KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DAguirreControlEscolar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ControlEscolar_log.ldf' , SIZE = 4736KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ControlEscolar] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ControlEscolar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ControlEscolar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ControlEscolar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ControlEscolar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ControlEscolar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ControlEscolar] SET ARITHABORT OFF 
GO
ALTER DATABASE [ControlEscolar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ControlEscolar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ControlEscolar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ControlEscolar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ControlEscolar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ControlEscolar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ControlEscolar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ControlEscolar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ControlEscolar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ControlEscolar] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ControlEscolar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ControlEscolar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ControlEscolar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ControlEscolar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ControlEscolar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ControlEscolar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ControlEscolar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ControlEscolar] SET RECOVERY FULL 
GO
ALTER DATABASE [ControlEscolar] SET  MULTI_USER 
GO
ALTER DATABASE [ControlEscolar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ControlEscolar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ControlEscolar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ControlEscolar] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ControlEscolar] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ControlEscolar] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ControlEscolar', N'ON'
GO
ALTER DATABASE [ControlEscolar] SET QUERY_STORE = OFF
GO
USE [ControlEscolar]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 14/01/2023 10:54:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[IdAlumno] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[ApellidoPaterno] [varchar](50) NULL,
	[ApellidoMaterno] [varchar](50) NULL,
	[Foto] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlumnoMateria]    Script Date: 14/01/2023 10:54:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlumnoMateria](
	[IdAlumnoMateria] [int] IDENTITY(1,1) NOT NULL,
	[IdAlumno] [int] NULL,
	[IdMateria] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAlumnoMateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materia]    Script Date: 14/01/2023 10:54:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materia](
	[IdMateria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Costo] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AlumnoMateria]  WITH CHECK ADD FOREIGN KEY([IdAlumno])
REFERENCES [dbo].[Alumno] ([IdAlumno])
GO
ALTER TABLE [dbo].[AlumnoMateria]  WITH CHECK ADD FOREIGN KEY([IdMateria])
REFERENCES [dbo].[Materia] ([IdMateria])
GO
/****** Object:  StoredProcedure [dbo].[AlumnoAdd]    Script Date: 14/01/2023 10:54:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AlumnoAdd]
@Nombre VARCHAR(50),
@ApellidoPaterno VARCHAR(50),
@ApellidoMaterno VARCHAR(50),
@Foto VARCHAR(MAX)
AS
INSERT INTO Alumno(Nombre, ApellidoPaterno, ApellidoMaterno,Foto)
VALUES (@Nombre,@ApellidoPaterno,@ApellidoMaterno,@Foto)
GO
/****** Object:  StoredProcedure [dbo].[AlumnoDelete]    Script Date: 14/01/2023 10:54:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AlumnoDelete]
@IdAlumno INT
AS
DELETE FROM Alumno
WHERE IdAlumno = @IdAlumno
GO
/****** Object:  StoredProcedure [dbo].[AlumnoGetAll]    Script Date: 14/01/2023 10:54:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AlumnoGetAll]
AS
SELECT IdAlumno, Nombre, ApellidoPaterno, ApellidoMaterno, Foto
FROM Alumno
GO
/****** Object:  StoredProcedure [dbo].[AlumnoGetById]    Script Date: 14/01/2023 10:54:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AlumnoGetById]
@IdAlumno INT
AS
SELECT IdAlumno, Nombre, ApellidoPaterno, ApellidoMaterno, Foto
FROM Alumno
WHERE IdAlumno=@IdAlumno
GO
/****** Object:  StoredProcedure [dbo].[AlumnoMateriaAdd]    Script Date: 14/01/2023 10:54:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AlumnoMateriaAdd]
@IdAlumno INT,
@IdMateria INT
AS
INSERT INTO AlumnoMateria(IdAlumno,IdMateria)
VALUES (@IdAlumno,@IdMateria)
GO
/****** Object:  StoredProcedure [dbo].[AlumnoMateriaDelete]    Script Date: 14/01/2023 10:54:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AlumnoMateriaDelete]
@IdAlumno INT,
@IdMatera INT
AS
DELETE FROM AlumnoMateria
WHERE IdAlumno=@IdAlumno
AND IdMateria=@IdMatera
GO
/****** Object:  StoredProcedure [dbo].[AlumnoMateriaGetAll]    Script Date: 14/01/2023 10:54:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AlumnoMateriaGetAll]
AS
SELECT IdAlumnoMateria, Alumno.IdAlumno, Materia.IdMateria, 
Alumno.Nombre AS 'NombreAlumno', Alumno.ApellidoPaterno, Alumno.ApellidoMaterno, Alumno.Foto,
Materia.Nombre AS 'NombreMateria', Materia.Costo
FROM AlumnoMateria
INNER JOIN Alumno ON Alumno.IdAlumno = AlumnoMateria.IdAlumno
INNER JOIN Materia ON Materia.IdMateria = AlumnoMateria.IdMateria
GO
/****** Object:  StoredProcedure [dbo].[AlumnoMateriaGetById]    Script Date: 14/01/2023 10:54:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AlumnoMateriaGetById]
@IdAlumnoMateria INT
AS
SELECT IdAlumnoMateria, Alumno.IdAlumno, Materia.IdMateria, 
Alumno.Nombre AS 'NombreAlumno', Alumno.ApellidoPaterno, Alumno.ApellidoMaterno,Alumno.Foto,
Materia.Nombre AS 'NombreMateria', Materia.Costo
FROM AlumnoMateria
INNER JOIN Alumno ON Alumno.IdAlumno = AlumnoMateria.IdAlumno
INNER JOIN Materia ON Materia.IdMateria = AlumnoMateria.IdMateria
WHERE IdAlumnoMateria = @IdAlumnoMateria
GO
/****** Object:  StoredProcedure [dbo].[AlumnoMateriaUpdate]    Script Date: 14/01/2023 10:54:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AlumnoMateriaUpdate]
@IdAlumnoMateria INT,
@IdAlumno INT,
@IdMateria INT
AS
UPDATE AlumnoMateria
SET IdAlumno=@IdAlumno,IdMateria=@IdMateria
WHERE IdAlumnoMateria=@IdAlumnoMateria
GO
/****** Object:  StoredProcedure [dbo].[AlumnoUpdate]    Script Date: 14/01/2023 10:54:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AlumnoUpdate]
@IdAlumno INT,
@Nombre VARCHAR(50),
@ApellidoPaterno VARCHAR(50),
@ApellidoMaterno VARCHAR(50),
@Foto VARCHAR(MAX)
AS
UPDATE Alumno
SET Nombre=@Nombre, ApellidoPaterno=@ApellidoPaterno, ApellidoMaterno=@ApellidoMaterno, Foto=@Foto
WHERE IdAlumno=@IdAlumno
GO
/****** Object:  StoredProcedure [dbo].[LoginAlumno]    Script Date: 14/01/2023 10:54:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoginAlumno]
@Nombre VARCHAR(50),
@ApellidoPaterno VARCHAR(50)
AS
SELECT Nombre,ApellidoPaterno,ApellidoMaterno
FROM Alumno
WHERE Nombre=@Nombre 
AND ApellidoPaterno=@ApellidoPaterno
GO
/****** Object:  StoredProcedure [dbo].[MateriaAdd]    Script Date: 14/01/2023 10:54:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MateriaAdd]
@Nombre VARCHAR(50),
@Costo DECIMAL
AS
INSERT INTO Materia(Nombre, Costo)
VALUES (@Nombre,@Costo)
GO
/****** Object:  StoredProcedure [dbo].[MateriaDelete]    Script Date: 14/01/2023 10:54:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MateriaDelete]
@IdMateria INT
AS
DELETE FROM Materia
WHERE IdMateria=@IdMateria
GO
/****** Object:  StoredProcedure [dbo].[MateriaGetAll]    Script Date: 14/01/2023 10:54:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MateriaGetAll]
AS
SELECT IdMateria, Nombre, Costo
FROM Materia
GO
/****** Object:  StoredProcedure [dbo].[MateriaGetById]    Script Date: 14/01/2023 10:54:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MateriaGetById]
@IdMateria INT
AS
SELECT IdMateria, Nombre, Costo
FROM Materia
WHERE IdMateria=@IdMateria
GO
/****** Object:  StoredProcedure [dbo].[MateriaGetByIdAlumnoMateria]    Script Date: 14/01/2023 10:54:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MateriaGetByIdAlumnoMateria]
@IdAlumno INT
AS
SELECT IdAlumnoMateria, Alumno.IdAlumno, Materia.IdMateria,
Alumno.Nombre AS 'NombreAlumno', Alumno.ApellidoPaterno, Alumno.ApellidoMaterno, Alumno.Foto,
AlumnoMateria.IdMateria AS 'Materia', Materia.Nombre AS 'NombreMateria', Materia.Costo
FROM AlumnoMateria
INNER JOIN Alumno ON Alumno.IdAlumno = AlumnoMateria.IdAlumno
INNER JOIN Materia ON Materia.IdMateria = AlumnoMateria.IdMateria
WHERE Alumno.IdAlumno = @IdAlumno
GO
/****** Object:  StoredProcedure [dbo].[MateriasNoAsignadas]    Script Date: 14/01/2023 10:54:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MateriasNoAsignadas]
@IdAlumno INT
AS
SELECT m.IdMateria, m.Nombre, m.Costo
FROM Materia m
WHERE m.IdMateria NOT IN
(SELECT am.IdMateria
FROM AlumnoMateria am
WHERE am.IdAlumno = @IdAlumno)
GO
/****** Object:  StoredProcedure [dbo].[MateriaUpdate]    Script Date: 14/01/2023 10:54:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MateriaUpdate]
@IdMateria INT,
@Nombre VARCHAR(50),
@Costo DECIMAL
AS
UPDATE Materia
SET Nombre=@Nombre, Costo=@Costo
WHERE IdMateria=@IdMateria
GO
USE [master]
GO
ALTER DATABASE [ControlEscolar] SET  READ_WRITE 
GO
