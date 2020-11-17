USE [master]
GO
/****** Object:  Database [TeatroProgramacion]    Script Date: 16/11/2020 22:33:49 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'TeatroProgramacion')
BEGIN
CREATE DATABASE [TeatroProgramacion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TeatroProgramacion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TeatroProgramacion.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TeatroProgramacion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TeatroProgramacion_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
ALTER DATABASE [TeatroProgramacion] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TeatroProgramacion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TeatroProgramacion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TeatroProgramacion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TeatroProgramacion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TeatroProgramacion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TeatroProgramacion] SET ARITHABORT OFF 
GO
ALTER DATABASE [TeatroProgramacion] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TeatroProgramacion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TeatroProgramacion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TeatroProgramacion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TeatroProgramacion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TeatroProgramacion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TeatroProgramacion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TeatroProgramacion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TeatroProgramacion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TeatroProgramacion] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TeatroProgramacion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TeatroProgramacion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TeatroProgramacion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TeatroProgramacion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TeatroProgramacion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TeatroProgramacion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TeatroProgramacion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TeatroProgramacion] SET RECOVERY FULL 
GO
ALTER DATABASE [TeatroProgramacion] SET  MULTI_USER 
GO
ALTER DATABASE [TeatroProgramacion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TeatroProgramacion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TeatroProgramacion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TeatroProgramacion] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TeatroProgramacion] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TeatroProgramacion', N'ON'
GO
ALTER DATABASE [TeatroProgramacion] SET QUERY_STORE = OFF
GO
USE [TeatroProgramacion]
GO
/****** Object:  Table [dbo].[Clasificaciones]    Script Date: 16/11/2020 22:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clasificaciones]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Clasificaciones](
	[ClasificacionId] [int] IDENTITY(1,1) NOT NULL,
	[Clasificacion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Clasificaciones] PRIMARY KEY CLUSTERED 
(
	[ClasificacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 16/11/2020 22:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empleados]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Empleados](
	[EmpleadoId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Apellido] [nvarchar](100) NOT NULL,
	[TipoDocumentoId] [int] NOT NULL,
	[NroDocumento] [nvarchar](10) NOT NULL,
	[TelefonoFijo] [nvarchar](20) NULL,
	[TelefonoMovil] [nvarchar](20) NULL,
	[Mail] [nvarchar](150) NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[EmpleadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Eventos]    Script Date: 16/11/2020 22:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Eventos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Eventos](
	[EventoId] [int] IDENTITY(1,1) NOT NULL,
	[TipoEventoId] [int] NOT NULL,
	[ClasificacionId] [int] NOT NULL,
	[Evento] [nvarchar](120) NOT NULL,
	[FechaEvento] [datetime] NOT NULL,
	[Descripcion] [nvarchar](250) NOT NULL,
	[Suspendido] [bit] NOT NULL,
 CONSTRAINT [PK_Eventos] PRIMARY KEY CLUSTERED 
(
	[EventoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[FormasPagos]    Script Date: 16/11/2020 22:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormasPagos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FormasPagos](
	[FormaPagoId] [int] IDENTITY(1,1) NOT NULL,
	[FormaPago] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_FormasPagos] PRIMARY KEY CLUSTERED 
(
	[FormaPagoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[FormasVentas]    Script Date: 16/11/2020 22:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormasVentas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FormasVentas](
	[FormaVentaId] [int] IDENTITY(1,1) NOT NULL,
	[FormaVenta] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_FormasVentas] PRIMARY KEY CLUSTERED 
(
	[FormaVentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Plantas]    Script Date: 16/11/2020 22:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Plantas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Plantas](
	[PlantaId] [int] IDENTITY(1,1) NOT NULL,
	[Planta] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Plantas] PRIMARY KEY CLUSTERED 
(
	[PlantaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TiposDocumentos]    Script Date: 16/11/2020 22:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TiposDocumentos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TiposDocumentos](
	[TipoDocumentoId] [int] IDENTITY(1,1) NOT NULL,
	[TipoDocumento] [nvarchar](50) NULL,
 CONSTRAINT [PK_TiposDocumentos] PRIMARY KEY CLUSTERED 
(
	[TipoDocumentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TiposEventos]    Script Date: 16/11/2020 22:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TiposEventos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TiposEventos](
	[TipoEventoId] [int] IDENTITY(1,1) NOT NULL,
	[TipoEvento] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TiposEventos] PRIMARY KEY CLUSTERED 
(
	[TipoEventoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Ubicaciones]    Script Date: 16/11/2020 22:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ubicaciones]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ubicaciones](
	[UbicacionId] [int] IDENTITY(1,1) NOT NULL,
	[Ubicacion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Ubicaciones] PRIMARY KEY CLUSTERED 
(
	[UbicacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Clasificaciones] ON 

INSERT [dbo].[Clasificaciones] ([ClasificacionId], [Clasificacion]) VALUES (1, N'Apto para todo público')
INSERT [dbo].[Clasificaciones] ([ClasificacionId], [Clasificacion]) VALUES (2, N'Prohibida para 
menores de 18 años')
SET IDENTITY_INSERT [dbo].[Clasificaciones] OFF
SET IDENTITY_INSERT [dbo].[Empleados] ON 

INSERT [dbo].[Empleados] ([EmpleadoId], [Nombre], [Apellido], [TipoDocumentoId], [NroDocumento], [TelefonoFijo], [TelefonoMovil], [Mail]) VALUES (1, N'Gonzalo', N'Misciagna', 1, N'42778488', N'', N'2227 480649', N'gonza999capo@gmail.com')
INSERT [dbo].[Empleados] ([EmpleadoId], [Nombre], [Apellido], [TipoDocumentoId], [NroDocumento], [TelefonoFijo], [TelefonoMovil], [Mail]) VALUES (2, N'Angel', N'Misciagna', 1, N'40430657', N'', N'2227 488372', N'')
INSERT [dbo].[Empleados] ([EmpleadoId], [Nombre], [Apellido], [TipoDocumentoId], [NroDocumento], [TelefonoFijo], [TelefonoMovil], [Mail]) VALUES (3, N'a', N'a', 2, N'a', N'', N'', N'')
INSERT [dbo].[Empleados] ([EmpleadoId], [Nombre], [Apellido], [TipoDocumentoId], [NroDocumento], [TelefonoFijo], [TelefonoMovil], [Mail]) VALUES (4, N'a', N'a', 1, N'a', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[Empleados] OFF
SET IDENTITY_INSERT [dbo].[Eventos] ON 

INSERT [dbo].[Eventos] ([EventoId], [TipoEventoId], [ClasificacionId], [Evento], [FechaEvento], [Descripcion], [Suspendido]) VALUES (1, 1, 1, N'Los Vengadores-EndGame', CAST(N'2020-11-03T22:47:15.000' AS DateTime), N'Los Vengadores enfrentan en su ultima batalla a Thanos', 0)
INSERT [dbo].[Eventos] ([EventoId], [TipoEventoId], [ClasificacionId], [Evento], [FechaEvento], [Descripcion], [Suspendido]) VALUES (2, 3, 1, N'Romeo y Julieta', CAST(N'2020-06-02T00:00:00.000' AS DateTime), N'La clasica historia de Shakespeare sobre las familias Montesco y Capuleto, y la tragica historia de amor', 0)
INSERT [dbo].[Eventos] ([EventoId], [TipoEventoId], [ClasificacionId], [Evento], [FechaEvento], [Descripcion], [Suspendido]) VALUES (4, 2, 1, N'aaa', CAST(N'2020-11-11T23:06:38.057' AS DateTime), N'aa', 1)
INSERT [dbo].[Eventos] ([EventoId], [TipoEventoId], [ClasificacionId], [Evento], [FechaEvento], [Descripcion], [Suspendido]) VALUES (8, 1, 1, N'aaaa', CAST(N'2020-11-15T22:40:38.287' AS DateTime), N's', 0)
SET IDENTITY_INSERT [dbo].[Eventos] OFF
SET IDENTITY_INSERT [dbo].[FormasPagos] ON 

INSERT [dbo].[FormasPagos] ([FormaPagoId], [FormaPago]) VALUES (1, N'Efectivo')
INSERT [dbo].[FormasPagos] ([FormaPagoId], [FormaPago]) VALUES (2, N'Tarjeta de débito')
INSERT [dbo].[FormasPagos] ([FormaPagoId], [FormaPago]) VALUES (3, N'Tarjeta de crédito')
INSERT [dbo].[FormasPagos] ([FormaPagoId], [FormaPago]) VALUES (1002, N'E')
INSERT [dbo].[FormasPagos] ([FormaPagoId], [FormaPago]) VALUES (1003, N'a')
SET IDENTITY_INSERT [dbo].[FormasPagos] OFF
SET IDENTITY_INSERT [dbo].[FormasVentas] ON 

INSERT [dbo].[FormasVentas] ([FormaVentaId], [FormaVenta]) VALUES (1, N'Telefónica')
INSERT [dbo].[FormasVentas] ([FormaVentaId], [FormaVenta]) VALUES (2, N'Personal')
INSERT [dbo].[FormasVentas] ([FormaVentaId], [FormaVenta]) VALUES (3, N'Página web')
INSERT [dbo].[FormasVentas] ([FormaVentaId], [FormaVenta]) VALUES (4, N'Efectivo')
SET IDENTITY_INSERT [dbo].[FormasVentas] OFF
SET IDENTITY_INSERT [dbo].[Plantas] ON 

INSERT [dbo].[Plantas] ([PlantaId], [Planta]) VALUES (1, N'Planta Baja')
INSERT [dbo].[Plantas] ([PlantaId], [Planta]) VALUES (2, N'Primer Piso')
INSERT [dbo].[Plantas] ([PlantaId], [Planta]) VALUES (4, N'a')
INSERT [dbo].[Plantas] ([PlantaId], [Planta]) VALUES (1002, N'as')
SET IDENTITY_INSERT [dbo].[Plantas] OFF
SET IDENTITY_INSERT [dbo].[TiposDocumentos] ON 

INSERT [dbo].[TiposDocumentos] ([TipoDocumentoId], [TipoDocumento]) VALUES (1, N'DNI')
INSERT [dbo].[TiposDocumentos] ([TipoDocumentoId], [TipoDocumento]) VALUES (2, N'Libreta de enrolamiento')
INSERT [dbo].[TiposDocumentos] ([TipoDocumentoId], [TipoDocumento]) VALUES (3, N'aaaa')
SET IDENTITY_INSERT [dbo].[TiposDocumentos] OFF
SET IDENTITY_INSERT [dbo].[TiposEventos] ON 

INSERT [dbo].[TiposEventos] ([TipoEventoId], [TipoEvento]) VALUES (1, N'Cine')
INSERT [dbo].[TiposEventos] ([TipoEventoId], [TipoEvento]) VALUES (2, N'Recital')
INSERT [dbo].[TiposEventos] ([TipoEventoId], [TipoEvento]) VALUES (3, N'Obra de Teatro')
SET IDENTITY_INSERT [dbo].[TiposEventos] OFF
SET IDENTITY_INSERT [dbo].[Ubicaciones] ON 

INSERT [dbo].[Ubicaciones] ([UbicacionId], [Ubicacion]) VALUES (1, N'Butacas')
INSERT [dbo].[Ubicaciones] ([UbicacionId], [Ubicacion]) VALUES (2, N'Palcos')
SET IDENTITY_INSERT [dbo].[Ubicaciones] OFF
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Eventos_Suspendido]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Eventos] ADD  CONSTRAINT [DF_Eventos_Suspendido]  DEFAULT ((0)) FOR [Suspendido]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Empleados_TiposDocumentos]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleados]'))
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_TiposDocumentos] FOREIGN KEY([TipoDocumentoId])
REFERENCES [dbo].[TiposDocumentos] ([TipoDocumentoId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Empleados_TiposDocumentos]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleados]'))
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_TiposDocumentos]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Eventos_Clasificaciones]') AND parent_object_id = OBJECT_ID(N'[dbo].[Eventos]'))
ALTER TABLE [dbo].[Eventos]  WITH CHECK ADD  CONSTRAINT [FK_Eventos_Clasificaciones] FOREIGN KEY([ClasificacionId])
REFERENCES [dbo].[Clasificaciones] ([ClasificacionId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Eventos_Clasificaciones]') AND parent_object_id = OBJECT_ID(N'[dbo].[Eventos]'))
ALTER TABLE [dbo].[Eventos] CHECK CONSTRAINT [FK_Eventos_Clasificaciones]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Eventos_TiposEventos]') AND parent_object_id = OBJECT_ID(N'[dbo].[Eventos]'))
ALTER TABLE [dbo].[Eventos]  WITH CHECK ADD  CONSTRAINT [FK_Eventos_TiposEventos] FOREIGN KEY([TipoEventoId])
REFERENCES [dbo].[TiposEventos] ([TipoEventoId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Eventos_TiposEventos]') AND parent_object_id = OBJECT_ID(N'[dbo].[Eventos]'))
ALTER TABLE [dbo].[Eventos] CHECK CONSTRAINT [FK_Eventos_TiposEventos]
GO
USE [master]
GO
ALTER DATABASE [TeatroProgramacion] SET  READ_WRITE 
GO
