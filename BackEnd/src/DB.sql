USE [master]
GO
/****** Object:  Database [UniversidadDB]    Script Date: 13/7/2023 14:22:50 ******/
CREATE DATABASE [UniversidadDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversidadDB', FILENAME = N'C:\SQLData\UniversidadDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UniversidadDB_log', FILENAME = N'C:\SQLData\UniversidadDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [UniversidadDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversidadDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversidadDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversidadDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversidadDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversidadDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversidadDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversidadDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversidadDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversidadDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversidadDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversidadDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversidadDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversidadDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversidadDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversidadDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversidadDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversidadDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversidadDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversidadDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversidadDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversidadDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversidadDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversidadDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversidadDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversidadDB] SET  MULTI_USER 
GO
ALTER DATABASE [UniversidadDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversidadDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversidadDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversidadDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UniversidadDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UniversidadDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [UniversidadDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [UniversidadDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [UniversidadDB]
GO
/****** Object:  Table [dbo].[decano]    Script Date: 13/7/2023 14:22:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[decano](
	[idDecano] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[CI] [varchar](50) NULL,
	[idUsuario] [int] NULL,
 CONSTRAINT [PK_Decano] PRIMARY KEY CLUSTERED 
(
	[idDecano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estudiante]    Script Date: 13/7/2023 14:22:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estudiante](
	[idEstudiante] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NULL,
	[apellido] [varchar](50) NULL,
	[CI] [int] NULL,
	[idMalla] [int] NULL,
	[idUsuario] [int] NULL,
 CONSTRAINT [PK_Estudiante] PRIMARY KEY CLUSTERED 
(
	[idEstudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estudianteMateria]    Script Date: 13/7/2023 14:22:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estudianteMateria](
	[idEstudianteMateria] [int] IDENTITY(1,1) NOT NULL,
	[idEstudiante] [int] NULL,
	[idMateria] [int] NULL,
	[status] [varchar](100) NULL,
 CONSTRAINT [PK_estudianteMateria] PRIMARY KEY CLUSTERED 
(
	[idEstudianteMateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estudianteReprobado]    Script Date: 13/7/2023 14:22:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estudianteReprobado](
	[idEstudianteReprobado] [int] IDENTITY(1,1) NOT NULL,
	[idMateria] [int] NULL,
	[idEstudiante] [int] NULL,
	[promedio] [float] NULL,
 CONSTRAINT [PK_estudianteReprobado] PRIMARY KEY CLUSTERED 
(
	[idEstudianteReprobado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[malla]    Script Date: 13/7/2023 14:22:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[malla](
	[idMalla] [int] IDENTITY(1,1) NOT NULL,
	[nombreMalla] [varchar](150) NOT NULL,
	[idDecano] [int] NULL,
 CONSTRAINT [PK_malla] PRIMARY KEY CLUSTERED 
(
	[idMalla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[materia]    Script Date: 13/7/2023 14:22:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[materia](
	[idMateria] [int] IDENTITY(1,1) NOT NULL,
	[nombreMateria] [varchar](50) NOT NULL,
	[idSemestre] [int] NULL,
	[codigo] [varchar](50) NULL,
	[horasTeoricas] [int] NULL,
	[horasPracticas] [int] NULL,
	[creditos] [int] NULL,
	[requisito] [varchar](50) NULL,
	[costo] [int] NULL,
 CONSTRAINT [PK_materia] PRIMARY KEY CLUSTERED 
(
	[idMateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[materiaAprobada]    Script Date: 13/7/2023 14:22:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[materiaAprobada](
	[idMateriaAprobada] [int] IDENTITY(1,1) NOT NULL,
	[idEstudiante] [int] NULL,
	[idMateria] [int] NULL,
	[promedio] [float] NULL,
 CONSTRAINT [PK_materiaAprobada] PRIMARY KEY CLUSTERED 
(
	[idMateriaAprobada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[materiaNota]    Script Date: 13/7/2023 14:22:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[materiaNota](
	[idMateriaNota] [int] IDENTITY(1,1) NOT NULL,
	[idNota] [int] NULL,
	[idMateria] [int] NULL,
	[idEstudiante] [int] NULL,
 CONSTRAINT [PK_materiaNota] PRIMARY KEY CLUSTERED 
(
	[idMateriaNota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nota]    Script Date: 13/7/2023 14:22:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nota](
	[idNota] [int] IDENTITY(1,1) NOT NULL,
	[nota] [int] NULL,
	[nombreNota] [varchar](255) NULL,
 CONSTRAINT [PK_nota] PRIMARY KEY CLUSTERED 
(
	[idNota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[semestre]    Script Date: 13/7/2023 14:22:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[semestre](
	[idSemestre] [int] IDENTITY(1,1) NOT NULL,
	[nombreSemestre] [varchar](50) NOT NULL,
	[idMalla] [int] NULL,
 CONSTRAINT [PK_semestre] PRIMARY KEY CLUSTERED 
(
	[idSemestre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 13/7/2023 14:22:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](150) NULL,
	[password] [varchar](150) NULL,
	[email] [varchar](150) NULL,
	[rol] [varchar](50) NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[decano]  WITH CHECK ADD  CONSTRAINT [FK_decano_usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[decano] CHECK CONSTRAINT [FK_decano_usuario]
GO
ALTER TABLE [dbo].[estudiante]  WITH CHECK ADD  CONSTRAINT [FK_estudiante_malla] FOREIGN KEY([idMalla])
REFERENCES [dbo].[malla] ([idMalla])
GO
ALTER TABLE [dbo].[estudiante] CHECK CONSTRAINT [FK_estudiante_malla]
GO
ALTER TABLE [dbo].[estudiante]  WITH CHECK ADD  CONSTRAINT [FK_estudiante_usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[estudiante] CHECK CONSTRAINT [FK_estudiante_usuario]
GO
ALTER TABLE [dbo].[estudianteMateria]  WITH CHECK ADD  CONSTRAINT [FK_estudianteMateria_estudiante] FOREIGN KEY([idEstudiante])
REFERENCES [dbo].[estudiante] ([idEstudiante])
GO
ALTER TABLE [dbo].[estudianteMateria] CHECK CONSTRAINT [FK_estudianteMateria_estudiante]
GO
ALTER TABLE [dbo].[estudianteMateria]  WITH CHECK ADD  CONSTRAINT [FK_estudianteMateria_materia] FOREIGN KEY([idMateria])
REFERENCES [dbo].[materia] ([idMateria])
GO
ALTER TABLE [dbo].[estudianteMateria] CHECK CONSTRAINT [FK_estudianteMateria_materia]
GO
ALTER TABLE [dbo].[estudianteReprobado]  WITH CHECK ADD  CONSTRAINT [FK_estudianteReprobado_estudiante] FOREIGN KEY([idEstudiante])
REFERENCES [dbo].[estudiante] ([idEstudiante])
GO
ALTER TABLE [dbo].[estudianteReprobado] CHECK CONSTRAINT [FK_estudianteReprobado_estudiante]
GO
ALTER TABLE [dbo].[estudianteReprobado]  WITH CHECK ADD  CONSTRAINT [FK_estudianteReprobado_materia] FOREIGN KEY([idMateria])
REFERENCES [dbo].[materia] ([idMateria])
GO
ALTER TABLE [dbo].[estudianteReprobado] CHECK CONSTRAINT [FK_estudianteReprobado_materia]
GO
ALTER TABLE [dbo].[malla]  WITH CHECK ADD  CONSTRAINT [FK_malla_decano] FOREIGN KEY([idDecano])
REFERENCES [dbo].[decano] ([idDecano])
GO
ALTER TABLE [dbo].[malla] CHECK CONSTRAINT [FK_malla_decano]
GO
ALTER TABLE [dbo].[materia]  WITH CHECK ADD  CONSTRAINT [FK_materia_semestre] FOREIGN KEY([idSemestre])
REFERENCES [dbo].[semestre] ([idSemestre])
GO
ALTER TABLE [dbo].[materia] CHECK CONSTRAINT [FK_materia_semestre]
GO
ALTER TABLE [dbo].[materiaAprobada]  WITH CHECK ADD  CONSTRAINT [FK_materiaAprobada_estudiante] FOREIGN KEY([idEstudiante])
REFERENCES [dbo].[estudiante] ([idEstudiante])
GO
ALTER TABLE [dbo].[materiaAprobada] CHECK CONSTRAINT [FK_materiaAprobada_estudiante]
GO
ALTER TABLE [dbo].[materiaAprobada]  WITH CHECK ADD  CONSTRAINT [FK_materiaAprobada_materia] FOREIGN KEY([idMateria])
REFERENCES [dbo].[materia] ([idMateria])
GO
ALTER TABLE [dbo].[materiaAprobada] CHECK CONSTRAINT [FK_materiaAprobada_materia]
GO
ALTER TABLE [dbo].[materiaNota]  WITH CHECK ADD  CONSTRAINT [FK_materiaNota_materia] FOREIGN KEY([idMateria])
REFERENCES [dbo].[materia] ([idMateria])
GO
ALTER TABLE [dbo].[materiaNota] CHECK CONSTRAINT [FK_materiaNota_materia]
GO
ALTER TABLE [dbo].[materiaNota]  WITH CHECK ADD  CONSTRAINT [FK_materiaNota_nota] FOREIGN KEY([idNota])
REFERENCES [dbo].[nota] ([idNota])
GO
ALTER TABLE [dbo].[materiaNota] CHECK CONSTRAINT [FK_materiaNota_nota]
GO
ALTER TABLE [dbo].[semestre]  WITH CHECK ADD  CONSTRAINT [FK_semestre_malla] FOREIGN KEY([idMalla])
REFERENCES [dbo].[malla] ([idMalla])
GO
ALTER TABLE [dbo].[semestre] CHECK CONSTRAINT [FK_semestre_malla]
GO
USE [master]
GO
ALTER DATABASE [UniversidadDB] SET  READ_WRITE 
GO
