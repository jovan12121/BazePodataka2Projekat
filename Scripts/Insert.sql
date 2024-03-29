USE [BazePodataka2]
GO
SET IDENTITY_INSERT [dbo].[DobavljacDelova] ON 

INSERT [dbo].[DobavljacDelova] ([DobavljacId], [Naziv], [VrstaDelova]) VALUES (1, N'TMD Friction', N'Kocnice')
INSERT [dbo].[DobavljacDelova] ([DobavljacId], [Naziv], [VrstaDelova]) VALUES (2, N'ICER', N'Kocnice')
INSERT [dbo].[DobavljacDelova] ([DobavljacId], [Naziv], [VrstaDelova]) VALUES (3, N'Castrol', N'Ulja')
INSERT [dbo].[DobavljacDelova] ([DobavljacId], [Naziv], [VrstaDelova]) VALUES (4, N'Eneos', N'Ulja')
INSERT [dbo].[DobavljacDelova] ([DobavljacId], [Naziv], [VrstaDelova]) VALUES (5, N'Neki dobavljac', N'Delovi menjaca')
INSERT [dbo].[DobavljacDelova] ([DobavljacId], [Naziv], [VrstaDelova]) VALUES (6, N'Dobavljac', N'Delovi motora')
SET IDENTITY_INSERT [dbo].[DobavljacDelova] OFF
GO
SET IDENTITY_INSERT [dbo].[Mesto] ON 

INSERT [dbo].[Mesto] ([MestoId], [PostanskiBroj], [Naziv]) VALUES (1, N'11000', N'Beograd')
INSERT [dbo].[Mesto] ([MestoId], [PostanskiBroj], [Naziv]) VALUES (2, N'21000', N'Novi Sad')
SET IDENTITY_INSERT [dbo].[Mesto] OFF
GO
SET IDENTITY_INSERT [dbo].[Servis] ON 

INSERT [dbo].[Servis] ([ServisId], [Adresa], [GodinaOsnivanja], [MestoId]) VALUES (1, N'789 Glavna ulica', 2000, 1)
INSERT [dbo].[Servis] ([ServisId], [Adresa], [GodinaOsnivanja], [MestoId]) VALUES (2, N'321 Neka ulica', 2010, 2)
SET IDENTITY_INSERT [dbo].[Servis] OFF
GO
INSERT [dbo].[Saradjuje] ([ServisId], [DobavljacId]) VALUES (1, 1)
INSERT [dbo].[Saradjuje] ([ServisId], [DobavljacId]) VALUES (1, 3)
INSERT [dbo].[Saradjuje] ([ServisId], [DobavljacId]) VALUES (1, 4)
INSERT [dbo].[Saradjuje] ([ServisId], [DobavljacId]) VALUES (1, 6)
INSERT [dbo].[Saradjuje] ([ServisId], [DobavljacId]) VALUES (2, 2)
INSERT [dbo].[Saradjuje] ([ServisId], [DobavljacId]) VALUES (2, 4)
INSERT [dbo].[Saradjuje] ([ServisId], [DobavljacId]) VALUES (2, 5)
GO
SET IDENTITY_INSERT [dbo].[Vlasnik] ON 

INSERT [dbo].[Vlasnik] ([VlasnikId], [Ime], [Prezime], [JMBG], [Adresa], [MestoId]) VALUES (1, N'Marko', N'Markovic', N'1234567890123', N'123 Glavna ulica', 1)
INSERT [dbo].[Vlasnik] ([VlasnikId], [Ime], [Prezime], [JMBG], [Adresa], [MestoId]) VALUES (2, N'Jovana', N'Jovanovic', N'9876543210987', N'456 Neka ulica', 2)
INSERT [dbo].[Vlasnik] ([VlasnikId], [Ime], [Prezime], [JMBG], [Adresa], [MestoId]) VALUES (3, N'Mika', N'Antic', N'1210987901796', N'22 Ulica Brestova', 1)
INSERT [dbo].[Vlasnik] ([VlasnikId], [Ime], [Prezime], [JMBG], [Adresa], [MestoId]) VALUES (4, N'Vladislav', N'Petkovic', N'2305977769029', N'36 Puskinova', 2)
INSERT [dbo].[Vlasnik] ([VlasnikId], [Ime], [Prezime], [JMBG], [Adresa], [MestoId]) VALUES (6, N'Milutin', N'Bojic', N'1507969456654', N'55 Maksima Gorkog', 1)
INSERT [dbo].[Vlasnik] ([VlasnikId], [Ime], [Prezime], [JMBG], [Adresa], [MestoId]) VALUES (7, N'Jovan', N'Ducic', N'2201991937518', N'2 Bulevar Oslobodjenja', 2)
INSERT [dbo].[Vlasnik] ([VlasnikId], [Ime], [Prezime], [JMBG], [Adresa], [MestoId]) VALUES (8, N'Djura', N'Jaksic', N'3007945309786', N'4 Bulevar Cara Lazara', 1)
INSERT [dbo].[Vlasnik] ([VlasnikId], [Ime], [Prezime], [JMBG], [Adresa], [MestoId]) VALUES (9, N'Milos', N'Crnjanski', N'1906968839554', N'8 Sumatra', 2)
SET IDENTITY_INSERT [dbo].[Vlasnik] OFF
GO
SET IDENTITY_INSERT [dbo].[Radnik] ON 

INSERT [dbo].[Radnik] ([RadnikId], [Ime], [Prezime], [JMBG], [Adresa], [Plata], [TipRadnika], [ServisId], [MestoId]) VALUES (1, N'Petar', N'Petrovic', N'4567890123456', N'789 ulica brestova', CAST(65000.00 AS Decimal(10, 2)), N'Automehanicar', 1, 1)
INSERT [dbo].[Radnik] ([RadnikId], [Ime], [Prezime], [JMBG], [Adresa], [Plata], [TipRadnika], [ServisId], [MestoId]) VALUES (2, N'Janko', N'Jankovic', N'6543210987654', N'321 Glavna ulica', CAST(60000.00 AS Decimal(10, 2)), N'Racunovodja', 2, 2)
INSERT [dbo].[Radnik] ([RadnikId], [Ime], [Prezime], [JMBG], [Adresa], [Plata], [TipRadnika], [ServisId], [MestoId]) VALUES (4, N'Nikola', N'Mirotic', N'1505991159746', N'5 Ulica vukova', CAST(55000.00 AS Decimal(10, 2)), N'Racunovodja', 1, 1)
INSERT [dbo].[Radnik] ([RadnikId], [Ime], [Prezime], [JMBG], [Adresa], [Plata], [TipRadnika], [ServisId], [MestoId]) VALUES (5, N'Uros', N'Trifunovic', N'1210000123531', N'14 Gogoljeva', CAST(191000.00 AS Decimal(10, 2)), N'Automehanicar', 1, 2)
INSERT [dbo].[Radnik] ([RadnikId], [Ime], [Prezime], [JMBG], [Adresa], [Plata], [TipRadnika], [ServisId], [MestoId]) VALUES (6, N'Tristan', N'Vukcevic', N'1810003567996', N'27 Alekse Santica', CAST(68000.00 AS Decimal(10, 2)), N'Automehanicar', 1, 1)
INSERT [dbo].[Radnik] ([RadnikId], [Ime], [Prezime], [JMBG], [Adresa], [Plata], [TipRadnika], [ServisId], [MestoId]) VALUES (7, N'Danilo', N'Andjusic', N'1504992987462', N'46 Cirpanova', CAST(193000.00 AS Decimal(10, 2)), N'Automehanicar', 1, 2)
INSERT [dbo].[Radnik] ([RadnikId], [Ime], [Prezime], [JMBG], [Adresa], [Plata], [TipRadnika], [ServisId], [MestoId]) VALUES (10, N'Aleksa', N'Avramovic', N'1510995230149', N'55 Mise Dimitrijevica', CAST(128000.00 AS Decimal(10, 2)), N'Automehanicar', 2, 1)
INSERT [dbo].[Radnik] ([RadnikId], [Ime], [Prezime], [JMBG], [Adresa], [Plata], [TipRadnika], [ServisId], [MestoId]) VALUES (11, N'Alen', N'Smailagic', N'0703000780156', N'123 Nemanjina', CAST(60000.00 AS Decimal(10, 2)), N'Automehanicar', 2, 2)
INSERT [dbo].[Radnik] ([RadnikId], [Ime], [Prezime], [JMBG], [Adresa], [Plata], [TipRadnika], [ServisId], [MestoId]) VALUES (12, N'Bojan', N'Dubljevic', N'1510993128746', N'89 Ulica treca', CAST(112000.00 AS Decimal(10, 2)), N'Automehanicar', 2, 1)
INSERT [dbo].[Radnik] ([RadnikId], [Ime], [Prezime], [JMBG], [Adresa], [Plata], [TipRadnika], [ServisId], [MestoId]) VALUES (13, N'Vanja', N'Marinkovic', N'1010990703649', N'11 Lasla Gala', CAST(65000.00 AS Decimal(10, 2)), N'Automehanicar', 2, 2)
SET IDENTITY_INSERT [dbo].[Radnik] OFF
GO
SET IDENTITY_INSERT [dbo].[Automobil] ON 

INSERT [dbo].[Automobil] ([AutomobilId], [Proizvodjac], [Model], [GodinaProizvodnje], [BrojSasije], [VlasnikId]) VALUES (1, N'Toyota', N'Corolla', 2018, N'JTMDFREV1GD247890', 1)
INSERT [dbo].[Automobil] ([AutomobilId], [Proizvodjac], [Model], [GodinaProizvodnje], [BrojSasije], [VlasnikId]) VALUES (2, N'Honda', N'Civic', 2020, N'JN1CV6EK4DM012345', 2)
INSERT [dbo].[Automobil] ([AutomobilId], [Proizvodjac], [Model], [GodinaProizvodnje], [BrojSasije], [VlasnikId]) VALUES (4, N'Audi', N'A4', 2010, N'WAUZZZ4BZWN049194', 3)
INSERT [dbo].[Automobil] ([AutomobilId], [Proizvodjac], [Model], [GodinaProizvodnje], [BrojSasije], [VlasnikId]) VALUES (5, N'BMW', N'320', 2000, N'WBAVB73538FV70090', 4)
INSERT [dbo].[Automobil] ([AutomobilId], [Proizvodjac], [Model], [GodinaProizvodnje], [BrojSasije], [VlasnikId]) VALUES (6, N'Mercedes Benz', N'E320', 2015, N'WDDGF8AB5DR245678', 6)
INSERT [dbo].[Automobil] ([AutomobilId], [Proizvodjac], [Model], [GodinaProizvodnje], [BrojSasije], [VlasnikId]) VALUES (7, N'Volkswagen', N'Golf', 2022, N'WVWZZZ3CZEE123456', 7)
INSERT [dbo].[Automobil] ([AutomobilId], [Proizvodjac], [Model], [GodinaProizvodnje], [BrojSasije], [VlasnikId]) VALUES (8, N'Ford', N'Ranger', 2018, N'1FMCU9HX1LUB12345', 8)
INSERT [dbo].[Automobil] ([AutomobilId], [Proizvodjac], [Model], [GodinaProizvodnje], [BrojSasije], [VlasnikId]) VALUES (9, N'Nissan', N'ix35', 2015, N'5FNRL5H42DB012345', 9)
INSERT [dbo].[Automobil] ([AutomobilId], [Proizvodjac], [Model], [GodinaProizvodnje], [BrojSasije], [VlasnikId]) VALUES (10, N'Audi', N'A6', 2019, N'WAUZZZ8K3EA012345', 1)
INSERT [dbo].[Automobil] ([AutomobilId], [Proizvodjac], [Model], [GodinaProizvodnje], [BrojSasije], [VlasnikId]) VALUES (11, N'Chevrolet', N'Spark', 2009, N'1G1JC5SH7D4112345', 2)
INSERT [dbo].[Automobil] ([AutomobilId], [Proizvodjac], [Model], [GodinaProizvodnje], [BrojSasije], [VlasnikId]) VALUES (12, N'Tesla', N'Model 3', 2018, N'5YJSA1E17HF123456', 3)
INSERT [dbo].[Automobil] ([AutomobilId], [Proizvodjac], [Model], [GodinaProizvodnje], [BrojSasije], [VlasnikId]) VALUES (13, N'Kia', N'Sportage', 2009, N'KNDJT2A61C7432109', 1)
INSERT [dbo].[Automobil] ([AutomobilId], [Proizvodjac], [Model], [GodinaProizvodnje], [BrojSasije], [VlasnikId]) VALUES (14, N'Mazda', N'6', 2012, N'JM1NDAL7XF1234567', 6)
SET IDENTITY_INSERT [dbo].[Automobil] OFF
GO
SET IDENTITY_INSERT [dbo].[VrstaPopravke] ON 

INSERT [dbo].[VrstaPopravke] ([VrstaPopravkeId], [Naziv]) VALUES (1, N'Popravka motora')
INSERT [dbo].[VrstaPopravke] ([VrstaPopravkeId], [Naziv]) VALUES (2, N'Zamena kocnica')
INSERT [dbo].[VrstaPopravke] ([VrstaPopravkeId], [Naziv]) VALUES (3, N'Mali servis')
INSERT [dbo].[VrstaPopravke] ([VrstaPopravkeId], [Naziv]) VALUES (4, N'Veliki servis')
INSERT [dbo].[VrstaPopravke] ([VrstaPopravkeId], [Naziv]) VALUES (5, N'Popravka klime')
INSERT [dbo].[VrstaPopravke] ([VrstaPopravkeId], [Naziv]) VALUES (6, N'Popravka menjaca')
INSERT [dbo].[VrstaPopravke] ([VrstaPopravkeId], [Naziv]) VALUES (7, N'Popravka trapa')
INSERT [dbo].[VrstaPopravke] ([VrstaPopravkeId], [Naziv]) VALUES (8, N'Popravka turbine')
INSERT [dbo].[VrstaPopravke] ([VrstaPopravkeId], [Naziv]) VALUES (9, N'Zamena svecica')
INSERT [dbo].[VrstaPopravke] ([VrstaPopravkeId], [Naziv]) VALUES (10, N'Zamena bregastog vratila')
SET IDENTITY_INSERT [dbo].[VrstaPopravke] OFF
GO
SET IDENTITY_INSERT [dbo].[Dovezen] ON 

INSERT [dbo].[Dovezen] ([DovezenId], [AutomobilId], [VrstaPopravkeId]) VALUES (1, 1, 1)
INSERT [dbo].[Dovezen] ([DovezenId], [AutomobilId], [VrstaPopravkeId]) VALUES (23, 1, 2)
INSERT [dbo].[Dovezen] ([DovezenId], [AutomobilId], [VrstaPopravkeId]) VALUES (2, 2, 2)
INSERT [dbo].[Dovezen] ([DovezenId], [AutomobilId], [VrstaPopravkeId]) VALUES (3, 4, 6)
INSERT [dbo].[Dovezen] ([DovezenId], [AutomobilId], [VrstaPopravkeId]) VALUES (9, 5, 1)
INSERT [dbo].[Dovezen] ([DovezenId], [AutomobilId], [VrstaPopravkeId]) VALUES (6, 5, 7)
INSERT [dbo].[Dovezen] ([DovezenId], [AutomobilId], [VrstaPopravkeId]) VALUES (4, 5, 8)
INSERT [dbo].[Dovezen] ([DovezenId], [AutomobilId], [VrstaPopravkeId]) VALUES (5, 5, 10)
INSERT [dbo].[Dovezen] ([DovezenId], [AutomobilId], [VrstaPopravkeId]) VALUES (10, 6, 1)
INSERT [dbo].[Dovezen] ([DovezenId], [AutomobilId], [VrstaPopravkeId]) VALUES (11, 6, 8)
INSERT [dbo].[Dovezen] ([DovezenId], [AutomobilId], [VrstaPopravkeId]) VALUES (20, 7, 3)
INSERT [dbo].[Dovezen] ([DovezenId], [AutomobilId], [VrstaPopravkeId]) VALUES (19, 8, 4)
INSERT [dbo].[Dovezen] ([DovezenId], [AutomobilId], [VrstaPopravkeId]) VALUES (18, 9, 4)
INSERT [dbo].[Dovezen] ([DovezenId], [AutomobilId], [VrstaPopravkeId]) VALUES (17, 10, 2)
INSERT [dbo].[Dovezen] ([DovezenId], [AutomobilId], [VrstaPopravkeId]) VALUES (16, 11, 5)
INSERT [dbo].[Dovezen] ([DovezenId], [AutomobilId], [VrstaPopravkeId]) VALUES (15, 11, 6)
INSERT [dbo].[Dovezen] ([DovezenId], [AutomobilId], [VrstaPopravkeId]) VALUES (14, 12, 7)
INSERT [dbo].[Dovezen] ([DovezenId], [AutomobilId], [VrstaPopravkeId]) VALUES (13, 13, 1)
INSERT [dbo].[Dovezen] ([DovezenId], [AutomobilId], [VrstaPopravkeId]) VALUES (12, 14, 10)
SET IDENTITY_INSERT [dbo].[Dovezen] OFF
GO
INSERT [dbo].[Automehanicar] ([RadnikId]) VALUES (1)
INSERT [dbo].[Automehanicar] ([RadnikId]) VALUES (5)
INSERT [dbo].[Automehanicar] ([RadnikId]) VALUES (6)
INSERT [dbo].[Automehanicar] ([RadnikId]) VALUES (7)
INSERT [dbo].[Automehanicar] ([RadnikId]) VALUES (10)
INSERT [dbo].[Automehanicar] ([RadnikId]) VALUES (11)
INSERT [dbo].[Automehanicar] ([RadnikId]) VALUES (12)
INSERT [dbo].[Automehanicar] ([RadnikId]) VALUES (13)
GO
INSERT [dbo].[Racunovodja] ([RadnikId]) VALUES (2)
INSERT [dbo].[Racunovodja] ([RadnikId]) VALUES (4)
GO
SET IDENTITY_INSERT [dbo].[Obucen] ON 

INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (1, 1, 1)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (2, 1, 2)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (35, 1, 8)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (34, 1, 10)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (10, 5, 1)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (11, 6, 1)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (13, 6, 9)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (12, 6, 10)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (16, 7, 5)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (15, 7, 7)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (14, 7, 8)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (19, 10, 3)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (20, 10, 4)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (18, 10, 6)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (22, 11, 1)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (23, 11, 2)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (24, 11, 3)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (21, 11, 5)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (25, 11, 10)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (26, 12, 1)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (29, 12, 7)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (27, 12, 8)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (28, 12, 10)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (30, 13, 3)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (31, 13, 4)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (32, 13, 5)
INSERT [dbo].[Obucen] ([ObucenId], [RadnikId], [VrstaPopravkeId]) VALUES (33, 13, 7)
SET IDENTITY_INSERT [dbo].[Obucen] OFF
GO
INSERT [dbo].[MesecniIzvestaj] ([Mesec], [Godina], [Prihodi], [Troskovi], [Saldo], [UkupniSaldo], [RadnikId]) VALUES (1, 2023, CAST(500000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[MesecniIzvestaj] ([Mesec], [Godina], [Prihodi], [Troskovi], [Saldo], [UkupniSaldo], [RadnikId]) VALUES (1, 2023, CAST(750000.00 AS Decimal(10, 2)), CAST(620000.00 AS Decimal(10, 2)), CAST(130000.00 AS Decimal(10, 2)), CAST(130000.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[MesecniIzvestaj] ([Mesec], [Godina], [Prihodi], [Troskovi], [Saldo], [UkupniSaldo], [RadnikId]) VALUES (2, 2023, CAST(620000.00 AS Decimal(10, 2)), CAST(400000.00 AS Decimal(10, 2)), CAST(220000.00 AS Decimal(10, 2)), CAST(270000.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[MesecniIzvestaj] ([Mesec], [Godina], [Prihodi], [Troskovi], [Saldo], [UkupniSaldo], [RadnikId]) VALUES (2, 2023, CAST(650000.00 AS Decimal(10, 2)), CAST(620000.00 AS Decimal(10, 2)), CAST(30000.00 AS Decimal(10, 2)), CAST(160000.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[MesecniIzvestaj] ([Mesec], [Godina], [Prihodi], [Troskovi], [Saldo], [UkupniSaldo], [RadnikId]) VALUES (3, 2023, CAST(550000.00 AS Decimal(10, 2)), CAST(470000.00 AS Decimal(10, 2)), CAST(80000.00 AS Decimal(10, 2)), CAST(350000.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[MesecniIzvestaj] ([Mesec], [Godina], [Prihodi], [Troskovi], [Saldo], [UkupniSaldo], [RadnikId]) VALUES (3, 2023, CAST(800000.00 AS Decimal(10, 2)), CAST(670000.00 AS Decimal(10, 2)), CAST(130000.00 AS Decimal(10, 2)), CAST(310000.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[MesecniIzvestaj] ([Mesec], [Godina], [Prihodi], [Troskovi], [Saldo], [UkupniSaldo], [RadnikId]) VALUES (4, 2023, CAST(480000.00 AS Decimal(10, 2)), CAST(400000.00 AS Decimal(10, 2)), CAST(80000.00 AS Decimal(10, 2)), CAST(460000.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[MesecniIzvestaj] ([Mesec], [Godina], [Prihodi], [Troskovi], [Saldo], [UkupniSaldo], [RadnikId]) VALUES (4, 2023, CAST(580000.00 AS Decimal(10, 2)), CAST(550000.00 AS Decimal(10, 2)), CAST(30000.00 AS Decimal(10, 2)), CAST(340000.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[MesecniIzvestaj] ([Mesec], [Godina], [Prihodi], [Troskovi], [Saldo], [UkupniSaldo], [RadnikId]) VALUES (5, 2023, CAST(700000.00 AS Decimal(10, 2)), CAST(550000.00 AS Decimal(10, 2)), CAST(150000.00 AS Decimal(10, 2)), CAST(650000.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[MesecniIzvestaj] ([Mesec], [Godina], [Prihodi], [Troskovi], [Saldo], [UkupniSaldo], [RadnikId]) VALUES (5, 2023, CAST(550000.00 AS Decimal(10, 2)), CAST(530000.00 AS Decimal(10, 2)), CAST(20000.00 AS Decimal(10, 2)), CAST(360000.00 AS Decimal(10, 2)), 4)
GO
INSERT [dbo].[Popravka] ([Datum], [Cena], [DovezenId], [ObucenId]) VALUES (CAST(N'2023-01-20' AS Date), CAST(25000.00 AS Decimal(10, 2)), 9, 12)
INSERT [dbo].[Popravka] ([Datum], [Cena], [DovezenId], [ObucenId]) VALUES (CAST(N'2023-01-20' AS Date), CAST(8500.00 AS Decimal(10, 2)), 19, 20)
INSERT [dbo].[Popravka] ([Datum], [Cena], [DovezenId], [ObucenId]) VALUES (CAST(N'2023-02-01' AS Date), CAST(150.00 AS Decimal(10, 2)), 1, 1)
INSERT [dbo].[Popravka] ([Datum], [Cena], [DovezenId], [ObucenId]) VALUES (CAST(N'2023-03-01' AS Date), CAST(12000.00 AS Decimal(10, 2)), 4, 14)
INSERT [dbo].[Popravka] ([Datum], [Cena], [DovezenId], [ObucenId]) VALUES (CAST(N'2023-03-15' AS Date), CAST(200.00 AS Decimal(10, 2)), 2, 2)
INSERT [dbo].[Popravka] ([Datum], [Cena], [DovezenId], [ObucenId]) VALUES (CAST(N'2023-03-15' AS Date), CAST(12000.00 AS Decimal(10, 2)), 10, 1)
INSERT [dbo].[Popravka] ([Datum], [Cena], [DovezenId], [ObucenId]) VALUES (CAST(N'2023-03-22' AS Date), CAST(8500.00 AS Decimal(10, 2)), 15, 18)
INSERT [dbo].[Popravka] ([Datum], [Cena], [DovezenId], [ObucenId]) VALUES (CAST(N'2023-04-10' AS Date), CAST(5000.00 AS Decimal(10, 2)), 6, 15)
INSERT [dbo].[Popravka] ([Datum], [Cena], [DovezenId], [ObucenId]) VALUES (CAST(N'2023-04-11' AS Date), CAST(10000.00 AS Decimal(10, 2)), 13, 10)
INSERT [dbo].[Popravka] ([Datum], [Cena], [DovezenId], [ObucenId]) VALUES (CAST(N'2023-04-12' AS Date), CAST(30000.00 AS Decimal(10, 2)), 3, 11)
INSERT [dbo].[Popravka] ([Datum], [Cena], [DovezenId], [ObucenId]) VALUES (CAST(N'2023-04-12' AS Date), CAST(16500.00 AS Decimal(10, 2)), 12, 25)
INSERT [dbo].[Popravka] ([Datum], [Cena], [DovezenId], [ObucenId]) VALUES (CAST(N'2023-04-18' AS Date), CAST(5500.00 AS Decimal(10, 2)), 16, 16)
INSERT [dbo].[Popravka] ([Datum], [Cena], [DovezenId], [ObucenId]) VALUES (CAST(N'2023-04-18' AS Date), CAST(4200.00 AS Decimal(10, 2)), 17, 2)
INSERT [dbo].[Popravka] ([Datum], [Cena], [DovezenId], [ObucenId]) VALUES (CAST(N'2023-04-22' AS Date), CAST(11000.00 AS Decimal(10, 2)), 14, 15)
INSERT [dbo].[Popravka] ([Datum], [Cena], [DovezenId], [ObucenId]) VALUES (CAST(N'2023-05-01' AS Date), CAST(8000.00 AS Decimal(10, 2)), 5, 12)
INSERT [dbo].[Popravka] ([Datum], [Cena], [DovezenId], [ObucenId]) VALUES (CAST(N'2023-05-05' AS Date), CAST(10000.00 AS Decimal(10, 2)), 20, 30)
INSERT [dbo].[Popravka] ([Datum], [Cena], [DovezenId], [ObucenId]) VALUES (CAST(N'2023-05-22' AS Date), CAST(8999.00 AS Decimal(10, 2)), 18, 31)
INSERT [dbo].[Popravka] ([Datum], [Cena], [DovezenId], [ObucenId]) VALUES (CAST(N'2023-06-01' AS Date), CAST(9200.00 AS Decimal(10, 2)), 11, 14)
GO
