USE [BazePodataka2]
GO
/****** Object:  Table [dbo].[Automehanicar]    Script Date: 7.6.2023. 15:12:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Automehanicar](
	[RadnikId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RadnikId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Automobil]    Script Date: 7.6.2023. 15:12:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Automobil](
	[AutomobilId] [int] IDENTITY(1,1) NOT NULL,
	[Proizvodjac] [varchar](50) NOT NULL,
	[Model] [varchar](50) NOT NULL,
	[GodinaProizvodnje] [int] NOT NULL,
	[BrojSasije] [varchar](17) NOT NULL,
	[VlasnikId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AutomobilId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DobavljacDelova]    Script Date: 7.6.2023. 15:12:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DobavljacDelova](
	[DobavljacId] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](50) NOT NULL,
	[VrstaDelova] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DobavljacId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dovezen]    Script Date: 7.6.2023. 15:12:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dovezen](
	[DovezenId] [int] IDENTITY(1,1) NOT NULL,
	[AutomobilId] [int] NOT NULL,
	[VrstaPopravkeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DovezenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Dovezen_Automobil_VrstaP] UNIQUE NONCLUSTERED 
(
	[AutomobilId] ASC,
	[VrstaPopravkeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MesecniIzvestaj]    Script Date: 7.6.2023. 15:12:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MesecniIzvestaj](
	[Mesec] [int] NOT NULL,
	[Godina] [int] NOT NULL,
	[Prihodi] [decimal](10, 2) NOT NULL,
	[Troskovi] [decimal](10, 2) NOT NULL,
	[Saldo] [decimal](10, 2) NOT NULL,
	[UkupniSaldo] [decimal](10, 2) NOT NULL,
	[RadnikId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Mesec] ASC,
	[Godina] ASC,
	[RadnikId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mesto]    Script Date: 7.6.2023. 15:12:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesto](
	[MestoId] [int] IDENTITY(1,1) NOT NULL,
	[PostanskiBroj] [varchar](10) NOT NULL,
	[Naziv] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MestoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Obucen]    Script Date: 7.6.2023. 15:12:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Obucen](
	[ObucenId] [int] IDENTITY(1,1) NOT NULL,
	[RadnikId] [int] NOT NULL,
	[VrstaPopravkeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ObucenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Obucen_Automehanicar_VrstaP] UNIQUE NONCLUSTERED 
(
	[RadnikId] ASC,
	[VrstaPopravkeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Popravka]    Script Date: 7.6.2023. 15:12:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Popravka](
	[Datum] [date] NOT NULL,
	[Cena] [decimal](10, 2) NOT NULL,
	[DovezenId] [int] NOT NULL,
	[ObucenId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Datum] ASC,
	[DovezenId] ASC,
	[ObucenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Racunovodja]    Script Date: 7.6.2023. 15:12:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Racunovodja](
	[RadnikId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RadnikId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Radnik]    Script Date: 7.6.2023. 15:12:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Radnik](
	[RadnikId] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [varchar](50) NOT NULL,
	[Prezime] [varchar](50) NOT NULL,
	[JMBG] [varchar](13) NOT NULL,
	[Adresa] [varchar](100) NOT NULL,
	[Plata] [decimal](10, 2) NOT NULL,
	[TipRadnika] [varchar](50) NOT NULL,
	[ServisId] [int] NOT NULL,
	[MestoId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RadnikId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Saradjuje]    Script Date: 7.6.2023. 15:12:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Saradjuje](
	[ServisId] [int] NOT NULL,
	[DobavljacId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ServisId] ASC,
	[DobavljacId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servis]    Script Date: 7.6.2023. 15:12:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servis](
	[ServisId] [int] IDENTITY(1,1) NOT NULL,
	[Adresa] [varchar](100) NOT NULL,
	[GodinaOsnivanja] [int] NOT NULL,
	[MestoId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ServisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vlasnik]    Script Date: 7.6.2023. 15:12:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vlasnik](
	[VlasnikId] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [varchar](50) NOT NULL,
	[Prezime] [varchar](50) NOT NULL,
	[JMBG] [varchar](13) NOT NULL,
	[Adresa] [varchar](100) NOT NULL,
	[MestoId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VlasnikId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VrstaPopravke]    Script Date: 7.6.2023. 15:12:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VrstaPopravke](
	[VrstaPopravkeId] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VrstaPopravkeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Automehanicar]  WITH CHECK ADD FOREIGN KEY([RadnikId])
REFERENCES [dbo].[Radnik] ([RadnikId])
GO
ALTER TABLE [dbo].[Automobil]  WITH CHECK ADD FOREIGN KEY([VlasnikId])
REFERENCES [dbo].[Vlasnik] ([VlasnikId])
GO
ALTER TABLE [dbo].[Dovezen]  WITH CHECK ADD FOREIGN KEY([AutomobilId])
REFERENCES [dbo].[Automobil] ([AutomobilId])
GO
ALTER TABLE [dbo].[Dovezen]  WITH CHECK ADD FOREIGN KEY([VrstaPopravkeId])
REFERENCES [dbo].[VrstaPopravke] ([VrstaPopravkeId])
GO
ALTER TABLE [dbo].[MesecniIzvestaj]  WITH CHECK ADD FOREIGN KEY([RadnikId])
REFERENCES [dbo].[Racunovodja] ([RadnikId])
GO
ALTER TABLE [dbo].[Obucen]  WITH CHECK ADD FOREIGN KEY([RadnikId])
REFERENCES [dbo].[Automehanicar] ([RadnikId])
GO
ALTER TABLE [dbo].[Obucen]  WITH CHECK ADD FOREIGN KEY([VrstaPopravkeId])
REFERENCES [dbo].[VrstaPopravke] ([VrstaPopravkeId])
GO
ALTER TABLE [dbo].[Popravka]  WITH CHECK ADD FOREIGN KEY([DovezenId])
REFERENCES [dbo].[Dovezen] ([DovezenId])
GO
ALTER TABLE [dbo].[Popravka]  WITH CHECK ADD FOREIGN KEY([ObucenId])
REFERENCES [dbo].[Obucen] ([ObucenId])
GO
ALTER TABLE [dbo].[Racunovodja]  WITH CHECK ADD FOREIGN KEY([RadnikId])
REFERENCES [dbo].[Radnik] ([RadnikId])
GO
ALTER TABLE [dbo].[Radnik]  WITH CHECK ADD FOREIGN KEY([MestoId])
REFERENCES [dbo].[Mesto] ([MestoId])
GO
ALTER TABLE [dbo].[Radnik]  WITH CHECK ADD FOREIGN KEY([ServisId])
REFERENCES [dbo].[Servis] ([ServisId])
GO
ALTER TABLE [dbo].[Saradjuje]  WITH CHECK ADD FOREIGN KEY([DobavljacId])
REFERENCES [dbo].[DobavljacDelova] ([DobavljacId])
GO
ALTER TABLE [dbo].[Saradjuje]  WITH CHECK ADD FOREIGN KEY([ServisId])
REFERENCES [dbo].[Servis] ([ServisId])
GO
ALTER TABLE [dbo].[Servis]  WITH CHECK ADD FOREIGN KEY([MestoId])
REFERENCES [dbo].[Mesto] ([MestoId])
GO
ALTER TABLE [dbo].[Vlasnik]  WITH CHECK ADD FOREIGN KEY([MestoId])
REFERENCES [dbo].[Mesto] ([MestoId])
GO
