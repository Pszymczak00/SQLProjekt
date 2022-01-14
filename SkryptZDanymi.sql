USE [Firma]
GO
/****** Object:  UserDefinedFunction [dbo].[LacznyCzasProjektu]    Script Date: 14.01.2022 20:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[LacznyCzasProjektu](@id int)
RETURNS INT
AS   
BEGIN
    RETURN(
	SELECT SUM(Przeznaczony_czas)
	FROM zadania
	WHERE Projekty_Id = @id 
	)
END
GO
/****** Object:  Table [dbo].[Klienci]    Script Date: 14.01.2022 20:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klienci](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Imię] [varchar](50) NOT NULL,
	[Nazwisko] [varchar](50) NOT NULL,
	[Email_klienta] [varchar](50) NOT NULL,
	[Numer_telefonu] [varchar](9) NULL,
 CONSTRAINT [PK_Klienci] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Miejsca]    Script Date: 14.01.2022 20:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Miejsca](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adres] [varchar](50) NOT NULL,
	[Nr_pokoju] [int] NULL,
 CONSTRAINT [PK_Miejsca] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pracownicy]    Script Date: 14.01.2022 20:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pracownicy](
	[Id_prac] [int] IDENTITY(1,1) NOT NULL,
	[Imię] [varchar](50) NOT NULL,
	[Nazwisko] [varchar](50) NOT NULL,
	[Data_zatrudnienia] [date] NOT NULL,
	[Email] [varchar](50) NULL,
	[Numer_telefonu] [varchar](9) NULL,
	[Czy_zwolniony] [bit] NULL,
	[Data_zwolnienia] [date] NULL,
	[Rodzaje_zatrudnienia_Id] [int] NOT NULL,
	[Stanowiska_Id] [int] NOT NULL,
	[Zespoły_Id] [int] NOT NULL,
 CONSTRAINT [PK_Pracownicy] PRIMARY KEY CLUSTERED 
(
	[Id_prac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projekty]    Script Date: 14.01.2022 20:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projekty](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Termin_oddania] [date] NOT NULL,
	[Opis] [varchar](200) NULL,
	[Klienci_Id] [int] NOT NULL,
	[ZespoLy_id] [int] NOT NULL,
 CONSTRAINT [PK_Projekty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rodzaje_zatrudnienia]    Script Date: 14.01.2022 20:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rodzaje_zatrudnienia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [varchar](50) NOT NULL,
	[Min_godzin] [int] NOT NULL,
	[Max_godzin] [int] NOT NULL,
 CONSTRAINT [PK_Rodzaje_zatrudnienia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sprzęty]    Script Date: 14.01.2022 20:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sprzęty](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Typ] [varchar](50) NOT NULL,
	[Nazwa] [varchar](50) NOT NULL,
	[Opis] [varchar](200) NULL,
	[Pracownicy_Id_prac] [int] NOT NULL,
 CONSTRAINT [PK_Sprzęty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stanowiska]    Script Date: 14.01.2022 20:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stanowiska](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [varchar](50) NOT NULL,
	[Wymagany_staż] [int] NOT NULL,
	[Stawka_godzinowa] [int] NOT NULL,
 CONSTRAINT [PK_Stanowiska] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wpisy_pracy]    Script Date: 14.01.2022 20:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wpisy_pracy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Numer_wpisu] [int] NOT NULL,
	[Czas_rozpoczecia] [datetime] NOT NULL,
	[Czas_zakończenia] [datetime] NOT NULL,
	[Opis] [varchar](200) NOT NULL,
	[Miejsca_id] [int] NOT NULL,
	[Zadania_id] [int] NOT NULL,
 CONSTRAINT [PK_Wpisy_pracy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zadania]    Script Date: 14.01.2022 20:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zadania](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [varchar](50) NOT NULL,
	[Czy_zakończone] [bit] NOT NULL,
	[Przeznaczony_czas] [int] NOT NULL,
	[Opis] [varchar](200) NULL,
	[Pracownicy_Id_prac] [int] NOT NULL,
	[Projekty_Id] [int] NOT NULL,
 CONSTRAINT [PK_Zadania] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zespoły]    Script Date: 14.01.2022 20:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zespoły](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [varchar](50) NOT NULL,
	[Id_kierownika] [int] NULL,
 CONSTRAINT [PK_Zespoły] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Pracownicy]  WITH CHECK ADD  CONSTRAINT [FK_Pracownicy_Rodzaje_zatrudnienia] FOREIGN KEY([Rodzaje_zatrudnienia_Id])
REFERENCES [dbo].[Rodzaje_zatrudnienia] ([Id])
GO
ALTER TABLE [dbo].[Pracownicy] CHECK CONSTRAINT [FK_Pracownicy_Rodzaje_zatrudnienia]
GO
ALTER TABLE [dbo].[Pracownicy]  WITH CHECK ADD  CONSTRAINT [FK_Pracownicy_Stanowiska] FOREIGN KEY([Stanowiska_Id])
REFERENCES [dbo].[Stanowiska] ([Id])
GO
ALTER TABLE [dbo].[Pracownicy] CHECK CONSTRAINT [FK_Pracownicy_Stanowiska]
GO
ALTER TABLE [dbo].[Pracownicy]  WITH CHECK ADD  CONSTRAINT [FK_Pracownicy_Zespoły] FOREIGN KEY([Zespoły_Id])
REFERENCES [dbo].[Zespoły] ([Id])
GO
ALTER TABLE [dbo].[Pracownicy] CHECK CONSTRAINT [FK_Pracownicy_Zespoły]
GO
ALTER TABLE [dbo].[Projekty]  WITH CHECK ADD  CONSTRAINT [FK_Projekty_Klienci] FOREIGN KEY([Klienci_Id])
REFERENCES [dbo].[Klienci] ([Id])
GO
ALTER TABLE [dbo].[Projekty] CHECK CONSTRAINT [FK_Projekty_Klienci]
GO
ALTER TABLE [dbo].[Projekty]  WITH CHECK ADD  CONSTRAINT [FK_Projekty_Zespoły] FOREIGN KEY([ZespoLy_id])
REFERENCES [dbo].[Zespoły] ([Id])
GO
ALTER TABLE [dbo].[Projekty] CHECK CONSTRAINT [FK_Projekty_Zespoły]
GO
ALTER TABLE [dbo].[Sprzęty]  WITH CHECK ADD  CONSTRAINT [FK_Sprzęty_Pracownicy] FOREIGN KEY([Pracownicy_Id_prac])
REFERENCES [dbo].[Pracownicy] ([Id_prac])
GO
ALTER TABLE [dbo].[Sprzęty] CHECK CONSTRAINT [FK_Sprzęty_Pracownicy]
GO
ALTER TABLE [dbo].[Wpisy_pracy]  WITH CHECK ADD  CONSTRAINT [FK_Wpisy_pracy_Miejsca] FOREIGN KEY([Miejsca_id])
REFERENCES [dbo].[Miejsca] ([Id])
GO
ALTER TABLE [dbo].[Wpisy_pracy] CHECK CONSTRAINT [FK_Wpisy_pracy_Miejsca]
GO
ALTER TABLE [dbo].[Wpisy_pracy]  WITH CHECK ADD  CONSTRAINT [FK_Wpisy_pracy_Zadania] FOREIGN KEY([Zadania_id])
REFERENCES [dbo].[Zadania] ([Id])
GO
ALTER TABLE [dbo].[Wpisy_pracy] CHECK CONSTRAINT [FK_Wpisy_pracy_Zadania]
GO
ALTER TABLE [dbo].[Zadania]  WITH CHECK ADD  CONSTRAINT [FK_Zadania_Pracownicy] FOREIGN KEY([Pracownicy_Id_prac])
REFERENCES [dbo].[Pracownicy] ([Id_prac])
GO
ALTER TABLE [dbo].[Zadania] CHECK CONSTRAINT [FK_Zadania_Pracownicy]
GO
ALTER TABLE [dbo].[Zadania]  WITH CHECK ADD  CONSTRAINT [FK_Zadania_Projekty] FOREIGN KEY([Projekty_Id])
REFERENCES [dbo].[Projekty] ([Id])
GO
ALTER TABLE [dbo].[Zadania] CHECK CONSTRAINT [FK_Zadania_Projekty]
GO
ALTER TABLE [dbo].[Zespoły]  WITH CHECK ADD  CONSTRAINT [FK_Zespoły_Pracownicy] FOREIGN KEY([Id_kierownika])
REFERENCES [dbo].[Pracownicy] ([Id_prac])
GO
ALTER TABLE [dbo].[Zespoły] CHECK CONSTRAINT [FK_Zespoły_Pracownicy]
GO
/****** Object:  StoredProcedure [dbo].[GetPracownicy]    Script Date: 14.01.2022 20:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPracownicy]     
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT * FROM [dbo].[Pracownicy];
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[Pracownicy_szczegoly]    Script Date: 14.01.2022 20:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pracownicy_szczegoly]     

AS   
    SET NOCOUNT ON;  
    SELECT *  
    FROM ((Pracownicy p JOIN Zespoły z ON p.Zespoły_Id = z.Id) JOIN 
	Stanowiska s ON p.Stanowiska_Id = s.Id) JOIN
	Rodzaje_zatrudnienia r ON r.Id = p.Rodzaje_zatrudnienia_Id
GO
/****** Object:  StoredProcedure [dbo].[procGetPracownicy]    Script Date: 14.01.2022 20:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procGetPracownicy]     
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT * FROM [dbo].[Pracownicy];
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[procGetStanowiska]    Script Date: 14.01.2022 20:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procGetStanowiska]     
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT * FROM [dbo].[Stanowiska];
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[procGetZespoły]    Script Date: 14.01.2022 20:46:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procGetZespoły]     
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT * FROM [dbo].[Zespoły];
	COMMIT TRANSACTION
	RETURN
END
GO
