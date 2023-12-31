USE [PostirushkiFrolov]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 20.12.2023 16:00:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[IdBranch] [int] NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
	[Adress] [nvarchar](50) NOT NULL,
	[IdStaff1] [int] NOT NULL,
	[IdStaff2] [int] NOT NULL,
	[Phone] [int] NOT NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[IdBranch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calculation]    Script Date: 20.12.2023 16:00:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calculation](
	[IdCalculation] [int] NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Calculation] PRIMARY KEY CLUSTERED 
(
	[IdCalculation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offer]    Script Date: 20.12.2023 16:00:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offer](
	[IdOffer] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[IdShift] [int] NOT NULL,
	[IdWM] [int] NOT NULL,
	[IdPowder] [int] NOT NULL,
	[IdService] [int] NOT NULL,
	[IdCalculation] [int] NOT NULL,
	[IdStatus] [int] NOT NULL,
 CONSTRAINT [PK_Offer] PRIMARY KEY CLUSTERED 
(
	[IdOffer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Powder]    Script Date: 20.12.2023 16:00:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Powder](
	[IdPowder] [int] NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Powder] PRIMARY KEY CLUSTERED 
(
	[IdPowder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 20.12.2023 16:00:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[IdRole] [int] NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[IdRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 20.12.2023 16:00:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[IdService] [int] NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[IdService] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shift]    Script Date: 20.12.2023 16:00:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shift](
	[IdShift] [int] NOT NULL,
	[StartDateTime] [datetime] NOT NULL,
	[EndDateTime] [datetime] NOT NULL,
	[IdStaff] [int] NOT NULL,
	[IdBranch] [int] NOT NULL,
 CONSTRAINT [PK_Shift] PRIMARY KEY CLUSTERED 
(
	[IdShift] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 20.12.2023 16:00:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[IdStaff] [int] NOT NULL,
	[Surname] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Patronymic] [nvarchar](20) NOT NULL,
	[Login] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[IdRole] [int] NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[IdStaff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WashingMachine]    Script Date: 20.12.2023 16:00:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WashingMachine](
	[IdWM] [int] NOT NULL,
	[IdBranch] [int] NOT NULL,
	[IsWorking] [bit] NOT NULL,
 CONSTRAINT [PK_WashingMachine] PRIMARY KEY CLUSTERED 
(
	[IdWM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WashingStatus]    Script Date: 20.12.2023 16:00:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WashingStatus](
	[IdStatus] [int] NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_WashingStatus] PRIMARY KEY CLUSTERED 
(
	[IdStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Branch] ([IdBranch], [Title], [Adress], [IdStaff1], [IdStaff2], [Phone]) VALUES (1, N'Branch1', N'Sovetskaya, 60', 1, 2, 56969)
INSERT [dbo].[Branch] ([IdBranch], [Title], [Adress], [IdStaff1], [IdStaff2], [Phone]) VALUES (2, N'Branch2', N'Sovetskaya, 1', 3, 4, 32657)
INSERT [dbo].[Branch] ([IdBranch], [Title], [Adress], [IdStaff1], [IdStaff2], [Phone]) VALUES (3, N'Branch3', N'Nedelina, 1', 5, 6, 13645)
INSERT [dbo].[Branch] ([IdBranch], [Title], [Adress], [IdStaff1], [IdStaff2], [Phone]) VALUES (4, N'Branch4', N'Nedelina, 60', 7, 9, 78567)
INSERT [dbo].[Branch] ([IdBranch], [Title], [Adress], [IdStaff1], [IdStaff2], [Phone]) VALUES (5, N'Branch5', N'Frunze, 30', 10, 11, 35645)
GO
INSERT [dbo].[Calculation] ([IdCalculation], [Title]) VALUES (1, N'Наличными')
INSERT [dbo].[Calculation] ([IdCalculation], [Title]) VALUES (2, N'Безналом')
GO
INSERT [dbo].[Offer] ([IdOffer], [Date], [IdShift], [IdWM], [IdPowder], [IdService], [IdCalculation], [IdStatus]) VALUES (1, CAST(N'2023-11-05' AS Date), 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Offer] ([IdOffer], [Date], [IdShift], [IdWM], [IdPowder], [IdService], [IdCalculation], [IdStatus]) VALUES (2, CAST(N'2023-11-05' AS Date), 2, 2, 1, 2, 2, 2)
INSERT [dbo].[Offer] ([IdOffer], [Date], [IdShift], [IdWM], [IdPowder], [IdService], [IdCalculation], [IdStatus]) VALUES (3, CAST(N'2023-11-05' AS Date), 3, 3, 1, 1, 1, 3)
INSERT [dbo].[Offer] ([IdOffer], [Date], [IdShift], [IdWM], [IdPowder], [IdService], [IdCalculation], [IdStatus]) VALUES (4, CAST(N'2023-11-05' AS Date), 4, 4, 1, 2, 2, 1)
INSERT [dbo].[Offer] ([IdOffer], [Date], [IdShift], [IdWM], [IdPowder], [IdService], [IdCalculation], [IdStatus]) VALUES (5, CAST(N'2023-11-05' AS Date), 1, 5, 1, 1, 1, 2)
INSERT [dbo].[Offer] ([IdOffer], [Date], [IdShift], [IdWM], [IdPowder], [IdService], [IdCalculation], [IdStatus]) VALUES (6, CAST(N'2023-11-06' AS Date), 2, 6, 2, 2, 2, 3)
INSERT [dbo].[Offer] ([IdOffer], [Date], [IdShift], [IdWM], [IdPowder], [IdService], [IdCalculation], [IdStatus]) VALUES (7, CAST(N'2023-11-06' AS Date), 3, 7, 2, 1, 1, 1)
INSERT [dbo].[Offer] ([IdOffer], [Date], [IdShift], [IdWM], [IdPowder], [IdService], [IdCalculation], [IdStatus]) VALUES (8, CAST(N'2023-11-06' AS Date), 4, 8, 2, 2, 2, 2)
INSERT [dbo].[Offer] ([IdOffer], [Date], [IdShift], [IdWM], [IdPowder], [IdService], [IdCalculation], [IdStatus]) VALUES (9, CAST(N'2023-11-06' AS Date), 1, 9, 2, 1, 1, 3)
INSERT [dbo].[Offer] ([IdOffer], [Date], [IdShift], [IdWM], [IdPowder], [IdService], [IdCalculation], [IdStatus]) VALUES (10, CAST(N'2023-11-06' AS Date), 2, 10, 2, 2, 2, 1)
INSERT [dbo].[Offer] ([IdOffer], [Date], [IdShift], [IdWM], [IdPowder], [IdService], [IdCalculation], [IdStatus]) VALUES (11, CAST(N'2023-11-07' AS Date), 3, 11, 3, 1, 1, 2)
INSERT [dbo].[Offer] ([IdOffer], [Date], [IdShift], [IdWM], [IdPowder], [IdService], [IdCalculation], [IdStatus]) VALUES (12, CAST(N'2023-11-07' AS Date), 4, 12, 3, 2, 2, 3)
INSERT [dbo].[Offer] ([IdOffer], [Date], [IdShift], [IdWM], [IdPowder], [IdService], [IdCalculation], [IdStatus]) VALUES (13, CAST(N'2023-11-07' AS Date), 1, 13, 3, 1, 1, 1)
INSERT [dbo].[Offer] ([IdOffer], [Date], [IdShift], [IdWM], [IdPowder], [IdService], [IdCalculation], [IdStatus]) VALUES (14, CAST(N'2023-11-07' AS Date), 2, 14, 3, 2, 2, 2)
INSERT [dbo].[Offer] ([IdOffer], [Date], [IdShift], [IdWM], [IdPowder], [IdService], [IdCalculation], [IdStatus]) VALUES (15, CAST(N'2023-11-07' AS Date), 3, 15, 3, 1, 1, 3)
GO
INSERT [dbo].[Powder] ([IdPowder], [Title], [Price]) VALUES (1, N'Tide', CAST(35.00 AS Decimal(10, 2)))
INSERT [dbo].[Powder] ([IdPowder], [Title], [Price]) VALUES (2, N'Ariel', CAST(25.00 AS Decimal(10, 2)))
INSERT [dbo].[Powder] ([IdPowder], [Title], [Price]) VALUES (3, N'Persil', CAST(30.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Role] ([IdRole], [Title]) VALUES (1, N'Сотрудник')
INSERT [dbo].[Role] ([IdRole], [Title]) VALUES (2, N'Администратор')
GO
INSERT [dbo].[Service] ([IdService], [Title], [Price]) VALUES (1, N'Стирка', CAST(250.00 AS Decimal(10, 2)))
INSERT [dbo].[Service] ([IdService], [Title], [Price]) VALUES (2, N'Сушка', CAST(150.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Shift] ([IdShift], [StartDateTime], [EndDateTime], [IdStaff], [IdBranch]) VALUES (1, CAST(N'2023-10-10T08:00:00.000' AS DateTime), CAST(N'2023-10-10T16:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Shift] ([IdShift], [StartDateTime], [EndDateTime], [IdStaff], [IdBranch]) VALUES (2, CAST(N'2023-10-11T08:00:00.000' AS DateTime), CAST(N'2023-10-11T16:00:00.000' AS DateTime), 2, 2)
INSERT [dbo].[Shift] ([IdShift], [StartDateTime], [EndDateTime], [IdStaff], [IdBranch]) VALUES (3, CAST(N'2023-10-12T08:00:00.000' AS DateTime), CAST(N'2023-10-12T16:00:00.000' AS DateTime), 3, 3)
INSERT [dbo].[Shift] ([IdShift], [StartDateTime], [EndDateTime], [IdStaff], [IdBranch]) VALUES (4, CAST(N'2023-10-13T08:00:00.000' AS DateTime), CAST(N'2023-10-13T16:00:00.000' AS DateTime), 4, 4)
GO
INSERT [dbo].[Staff] ([IdStaff], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (1, N'Ковалёва', N'Алиса', N'Георгиевна', N'kag', N'skhegi', 1)
INSERT [dbo].[Staff] ([IdStaff], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (2, N'Гущина', N'Антонина', N'Матвеевна', N'gam', N'frowth', 1)
INSERT [dbo].[Staff] ([IdStaff], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (3, N'Панфилова', N'Юстина', N'Никитевна', N'pun', N'luasgm', 1)
INSERT [dbo].[Staff] ([IdStaff], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (4, N'Дроздова', N'Радмила', N'Станиславовна', N'drs', N'ntxjpw', 1)
INSERT [dbo].[Staff] ([IdStaff], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (5, N'Воронова', N'Юланта', N'Всеволодовна', N'vuv', N'irzsln', 1)
INSERT [dbo].[Staff] ([IdStaff], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (6, N'Орлова', N'Ксения', N'Александровна', N'oka', N'nxfvyl', 1)
INSERT [dbo].[Staff] ([IdStaff], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (7, N'Носкова', N'Дания', N'Петровна', N'ndp', N'bxqdpa', 2)
INSERT [dbo].[Staff] ([IdStaff], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (8, N'Кулагина', N'Александра', N'Якововна', N'kay', N'ilswvx', 1)
INSERT [dbo].[Staff] ([IdStaff], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (9, N'Некрасова', N'Мария', N'Лаврентьевна', N'nml', N'aimgut', 1)
INSERT [dbo].[Staff] ([IdStaff], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (10, N'Кулагина', N'Беатриса', N'Рудольфовна', N'kbr', N'sgnvmm', 1)
INSERT [dbo].[Staff] ([IdStaff], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (11, N'Беспалова', N'Жюли', N'Евсеевна', N'bge', N'nuexgq', 1)
INSERT [dbo].[Staff] ([IdStaff], [Surname], [Name], [Patronymic], [Login], [Password], [IdRole]) VALUES (12, N'testsur', N'testname', N'testpat', N'testllog', N'testpas', 2)
GO
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (1, 1, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (2, 1, 0)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (3, 1, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (4, 1, 0)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (5, 1, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (6, 1, 0)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (7, 1, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (8, 1, 0)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (9, 1, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (10, 1, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (11, 2, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (12, 2, 0)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (13, 2, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (14, 2, 0)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (15, 2, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (16, 2, 0)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (17, 2, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (18, 2, 0)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (19, 2, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (20, 2, 0)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (21, 3, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (22, 3, 0)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (23, 3, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (24, 3, 0)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (25, 3, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (26, 3, 0)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (27, 3, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (28, 3, 0)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (29, 3, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (30, 3, 0)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (31, 4, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (32, 4, 0)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (33, 4, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (34, 4, 0)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (35, 4, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (36, 4, 0)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (37, 4, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (38, 4, 0)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (39, 4, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (40, 4, 0)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (41, 5, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (42, 5, 0)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (43, 5, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (44, 5, 0)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (45, 5, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (46, 5, 0)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (47, 5, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (48, 5, 0)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (49, 5, 1)
INSERT [dbo].[WashingMachine] ([IdWM], [IdBranch], [IsWorking]) VALUES (50, 5, 0)
GO
INSERT [dbo].[WashingStatus] ([IdStatus], [Title]) VALUES (1, N'В работе')
INSERT [dbo].[WashingStatus] ([IdStatus], [Title]) VALUES (2, N'Готов')
INSERT [dbo].[WashingStatus] ([IdStatus], [Title]) VALUES (3, N'Выдан')
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [FK_Offer_Calculation] FOREIGN KEY([IdCalculation])
REFERENCES [dbo].[Calculation] ([IdCalculation])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [FK_Offer_Calculation]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [FK_Offer_Powder] FOREIGN KEY([IdPowder])
REFERENCES [dbo].[Powder] ([IdPowder])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [FK_Offer_Powder]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [FK_Offer_Service] FOREIGN KEY([IdService])
REFERENCES [dbo].[Service] ([IdService])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [FK_Offer_Service]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [FK_Offer_Shift] FOREIGN KEY([IdShift])
REFERENCES [dbo].[Shift] ([IdShift])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [FK_Offer_Shift]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [FK_Offer_WashingMachine] FOREIGN KEY([IdWM])
REFERENCES [dbo].[WashingMachine] ([IdWM])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [FK_Offer_WashingMachine]
GO
ALTER TABLE [dbo].[Offer]  WITH CHECK ADD  CONSTRAINT [FK_Offer_WashingStatus] FOREIGN KEY([IdStatus])
REFERENCES [dbo].[WashingStatus] ([IdStatus])
GO
ALTER TABLE [dbo].[Offer] CHECK CONSTRAINT [FK_Offer_WashingStatus]
GO
ALTER TABLE [dbo].[Shift]  WITH CHECK ADD  CONSTRAINT [FK_Shift_Branch] FOREIGN KEY([IdBranch])
REFERENCES [dbo].[Branch] ([IdBranch])
GO
ALTER TABLE [dbo].[Shift] CHECK CONSTRAINT [FK_Shift_Branch]
GO
ALTER TABLE [dbo].[Shift]  WITH CHECK ADD  CONSTRAINT [FK_Shift_Staff] FOREIGN KEY([IdStaff])
REFERENCES [dbo].[Staff] ([IdStaff])
GO
ALTER TABLE [dbo].[Shift] CHECK CONSTRAINT [FK_Shift_Staff]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Role] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Role] ([IdRole])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Role]
GO
ALTER TABLE [dbo].[WashingMachine]  WITH CHECK ADD  CONSTRAINT [FK_WashingMachine_Branch] FOREIGN KEY([IdBranch])
REFERENCES [dbo].[Branch] ([IdBranch])
GO
ALTER TABLE [dbo].[WashingMachine] CHECK CONSTRAINT [FK_WashingMachine_Branch]
GO
