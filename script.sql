USE [master]
GO
/****** Object:  Database [Firma]    Script Date: 21.01.2022 15:16:44 ******/
CREATE DATABASE [Firma]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Firma', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Firma.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Firma_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Firma_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Firma] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Firma].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Firma] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Firma] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Firma] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Firma] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Firma] SET ARITHABORT OFF 
GO
ALTER DATABASE [Firma] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Firma] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Firma] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Firma] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Firma] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Firma] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Firma] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Firma] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Firma] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Firma] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Firma] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Firma] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Firma] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Firma] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Firma] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Firma] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Firma] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Firma] SET RECOVERY FULL 
GO
ALTER DATABASE [Firma] SET  MULTI_USER 
GO
ALTER DATABASE [Firma] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Firma] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Firma] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Firma] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Firma] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Firma] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Firma', N'ON'
GO
ALTER DATABASE [Firma] SET QUERY_STORE = OFF
GO
USE [Firma]
GO
/****** Object:  UserDefinedFunction [dbo].[LacznyCzasProjektu]    Script Date: 21.01.2022 15:16:44 ******/
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
/****** Object:  Table [dbo].[Godziny_pracy]    Script Date: 21.01.2022 15:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Godziny_pracy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Pracownicy_Id_prac] [int] NOT NULL,
	[Miesiąc] [date] NOT NULL,
	[Zadeklarowane_godziny] [int] NOT NULL,
 CONSTRAINT [PK_Godziny_pracy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klienci]    Script Date: 21.01.2022 15:16:44 ******/
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
/****** Object:  Table [dbo].[Miejsca]    Script Date: 21.01.2022 15:16:44 ******/
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
/****** Object:  Table [dbo].[Pracownicy]    Script Date: 21.01.2022 15:16:44 ******/
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
/****** Object:  Table [dbo].[Projekty]    Script Date: 21.01.2022 15:16:44 ******/
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
/****** Object:  Table [dbo].[Rodzaje_zatrudnienia]    Script Date: 21.01.2022 15:16:44 ******/
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
/****** Object:  Table [dbo].[Sprzęty]    Script Date: 21.01.2022 15:16:44 ******/
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
/****** Object:  Table [dbo].[Stanowiska]    Script Date: 21.01.2022 15:16:44 ******/
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
/****** Object:  Table [dbo].[Wpisy_pracy]    Script Date: 21.01.2022 15:16:44 ******/
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
/****** Object:  Table [dbo].[Zadania]    Script Date: 21.01.2022 15:16:44 ******/
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
/****** Object:  Table [dbo].[Zespoły]    Script Date: 21.01.2022 15:16:44 ******/
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
SET IDENTITY_INSERT [dbo].[Godziny_pracy] ON 

INSERT [dbo].[Godziny_pracy] ([Id], [Pracownicy_Id_prac], [Miesiąc], [Zadeklarowane_godziny]) VALUES (1, 1, CAST(N'2022-01-01' AS Date), 160)
INSERT [dbo].[Godziny_pracy] ([Id], [Pracownicy_Id_prac], [Miesiąc], [Zadeklarowane_godziny]) VALUES (2, 2, CAST(N'2022-01-01' AS Date), 200)
INSERT [dbo].[Godziny_pracy] ([Id], [Pracownicy_Id_prac], [Miesiąc], [Zadeklarowane_godziny]) VALUES (3, 3, CAST(N'2022-01-01' AS Date), 20)
INSERT [dbo].[Godziny_pracy] ([Id], [Pracownicy_Id_prac], [Miesiąc], [Zadeklarowane_godziny]) VALUES (4, 4, CAST(N'2022-01-01' AS Date), 20)
INSERT [dbo].[Godziny_pracy] ([Id], [Pracownicy_Id_prac], [Miesiąc], [Zadeklarowane_godziny]) VALUES (5, 5, CAST(N'2022-01-01' AS Date), 160)
INSERT [dbo].[Godziny_pracy] ([Id], [Pracownicy_Id_prac], [Miesiąc], [Zadeklarowane_godziny]) VALUES (6, 6, CAST(N'2022-01-01' AS Date), 80)
INSERT [dbo].[Godziny_pracy] ([Id], [Pracownicy_Id_prac], [Miesiąc], [Zadeklarowane_godziny]) VALUES (7, 7, CAST(N'2022-01-01' AS Date), 160)
INSERT [dbo].[Godziny_pracy] ([Id], [Pracownicy_Id_prac], [Miesiąc], [Zadeklarowane_godziny]) VALUES (8, 16, CAST(N'2022-01-01' AS Date), 80)
INSERT [dbo].[Godziny_pracy] ([Id], [Pracownicy_Id_prac], [Miesiąc], [Zadeklarowane_godziny]) VALUES (9, 9, CAST(N'2022-01-01' AS Date), 160)
INSERT [dbo].[Godziny_pracy] ([Id], [Pracownicy_Id_prac], [Miesiąc], [Zadeklarowane_godziny]) VALUES (10, 10, CAST(N'2022-01-01' AS Date), 90)
INSERT [dbo].[Godziny_pracy] ([Id], [Pracownicy_Id_prac], [Miesiąc], [Zadeklarowane_godziny]) VALUES (11, 11, CAST(N'2022-01-01' AS Date), 70)
INSERT [dbo].[Godziny_pracy] ([Id], [Pracownicy_Id_prac], [Miesiąc], [Zadeklarowane_godziny]) VALUES (12, 12, CAST(N'2022-01-01' AS Date), 100)
INSERT [dbo].[Godziny_pracy] ([Id], [Pracownicy_Id_prac], [Miesiąc], [Zadeklarowane_godziny]) VALUES (13, 14, CAST(N'2022-01-01' AS Date), 190)
INSERT [dbo].[Godziny_pracy] ([Id], [Pracownicy_Id_prac], [Miesiąc], [Zadeklarowane_godziny]) VALUES (14, 15, CAST(N'2022-01-01' AS Date), 190)
INSERT [dbo].[Godziny_pracy] ([Id], [Pracownicy_Id_prac], [Miesiąc], [Zadeklarowane_godziny]) VALUES (15, 17, CAST(N'2022-01-01' AS Date), 80)
SET IDENTITY_INSERT [dbo].[Godziny_pracy] OFF
GO
SET IDENTITY_INSERT [dbo].[Klienci] ON 

INSERT [dbo].[Klienci] ([Id], [Imię], [Nazwisko], [Email_klienta], [Numer_telefonu]) VALUES (1, N'Hugo', N'Boss', N'hugoboss@gmail.com', N'346473728')
INSERT [dbo].[Klienci] ([Id], [Imię], [Nazwisko], [Email_klienta], [Numer_telefonu]) VALUES (2, N'Tom', N'Hanks', N'tomhanks@gmail.com', NULL)
INSERT [dbo].[Klienci] ([Id], [Imię], [Nazwisko], [Email_klienta], [Numer_telefonu]) VALUES (3, N'Aleksander', N'Szopa', N'alekszopa@gmail.com', N'555333241')
INSERT [dbo].[Klienci] ([Id], [Imię], [Nazwisko], [Email_klienta], [Numer_telefonu]) VALUES (4, N'Witold', N'Gębicz', N'witoldgebicz@gmail.com', NULL)
INSERT [dbo].[Klienci] ([Id], [Imię], [Nazwisko], [Email_klienta], [Numer_telefonu]) VALUES (5, N'Teresa', N'Fryzura', N'terfryz@gmail.com', N'435252515')
INSERT [dbo].[Klienci] ([Id], [Imię], [Nazwisko], [Email_klienta], [Numer_telefonu]) VALUES (6, N'Oliwia', N'Biegacz', N'oliwiabieg@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Klienci] OFF
GO
SET IDENTITY_INSERT [dbo].[Miejsca] ON 

INSERT [dbo].[Miejsca] ([Id], [Adres], [Nr_pokoju]) VALUES (1, N'Os. Piastowskie 303', 1)
INSERT [dbo].[Miejsca] ([Id], [Adres], [Nr_pokoju]) VALUES (2, N'Os. Piastowskie 303', 2)
INSERT [dbo].[Miejsca] ([Id], [Adres], [Nr_pokoju]) VALUES (3, N'Os. Piastowskie 303', 3)
INSERT [dbo].[Miejsca] ([Id], [Adres], [Nr_pokoju]) VALUES (4, N'Os. Piastowskie 303', 4)
INSERT [dbo].[Miejsca] ([Id], [Adres], [Nr_pokoju]) VALUES (5, N'Os. Piastowskie 303', 5)
INSERT [dbo].[Miejsca] ([Id], [Adres], [Nr_pokoju]) VALUES (6, N'Os. Piastowskie 303', 6)
INSERT [dbo].[Miejsca] ([Id], [Adres], [Nr_pokoju]) VALUES (7, N'Konin ul. Kolska 3', NULL)
INSERT [dbo].[Miejsca] ([Id], [Adres], [Nr_pokoju]) VALUES (8, N'Konin ul. Dworcowa 10', NULL)
INSERT [dbo].[Miejsca] ([Id], [Adres], [Nr_pokoju]) VALUES (9, N'Konin ul. Kolejowa 8', NULL)
INSERT [dbo].[Miejsca] ([Id], [Adres], [Nr_pokoju]) VALUES (10, N'Konin os. Zatorze 3', NULL)
INSERT [dbo].[Miejsca] ([Id], [Adres], [Nr_pokoju]) VALUES (11, N'Stare Miasto 30', NULL)
SET IDENTITY_INSERT [dbo].[Miejsca] OFF
GO
SET IDENTITY_INSERT [dbo].[Pracownicy] ON 

INSERT [dbo].[Pracownicy] ([Id_prac], [Imię], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Rodzaje_zatrudnienia_Id], [Stanowiska_Id], [Zespoły_Id]) VALUES (1, N'Maciej', N'Wawrzyniak', CAST(N'2021-06-03' AS Date), N'macwaw@gmail.com', N'666555444', 0, NULL, 1, 5, 4)
INSERT [dbo].[Pracownicy] ([Id_prac], [Imię], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Rodzaje_zatrudnienia_Id], [Stanowiska_Id], [Zespoły_Id]) VALUES (2, N'Przemysław', N'Szymczak', CAST(N'2021-06-03' AS Date), N'przeszym@gmail.com', N'444222111', 0, NULL, 1, 8, 3)
INSERT [dbo].[Pracownicy] ([Id_prac], [Imię], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Rodzaje_zatrudnienia_Id], [Stanowiska_Id], [Zespoły_Id]) VALUES (3, N'Tomasz', N'Kowalski', CAST(N'2022-01-04' AS Date), N'tomkowal@gmail.com', N'777455577', 0, NULL, 3, 4, 4)
INSERT [dbo].[Pracownicy] ([Id_prac], [Imię], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Rodzaje_zatrudnienia_Id], [Stanowiska_Id], [Zespoły_Id]) VALUES (4, N'Grzegorz', N'Nawrocki', CAST(N'2022-01-03' AS Date), N'grzegnaw@gmail.com', N'555444333', 0, NULL, 3, 4, 3)
INSERT [dbo].[Pracownicy] ([Id_prac], [Imię], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Rodzaje_zatrudnienia_Id], [Stanowiska_Id], [Zespoły_Id]) VALUES (5, N'Anna', N'Cichosz', CAST(N'2021-07-04' AS Date), N'annacich@gmail.com', N'888333111', 0, NULL, 1, 6, 1)
INSERT [dbo].[Pracownicy] ([Id_prac], [Imię], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Rodzaje_zatrudnienia_Id], [Stanowiska_Id], [Zespoły_Id]) VALUES (6, N'Krzysztof', N'Nowy', CAST(N'2021-07-07' AS Date), N'krzysznowy@gmail.com', N'888555333', 0, NULL, 2, 9, 5)
INSERT [dbo].[Pracownicy] ([Id_prac], [Imię], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Rodzaje_zatrudnienia_Id], [Stanowiska_Id], [Zespoły_Id]) VALUES (7, N'Arkadiusz', N'Grzybek', CAST(N'2021-08-01' AS Date), N'arkgrzyb@gmail.com', N'777666777', 0, NULL, 1, 1, 5)
INSERT [dbo].[Pracownicy] ([Id_prac], [Imię], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Rodzaje_zatrudnienia_Id], [Stanowiska_Id], [Zespoły_Id]) VALUES (8, N'Szymon', N'Czajkowski', CAST(N'2021-09-09' AS Date), N'szymczaj@gmail.com', N'232345534', 1, CAST(N'2021-09-10' AS Date), 3, 4, 2)
INSERT [dbo].[Pracownicy] ([Id_prac], [Imię], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Rodzaje_zatrudnienia_Id], [Stanowiska_Id], [Zespoły_Id]) VALUES (9, N'Grzegorz', N'Tracz', CAST(N'2021-09-10' AS Date), N'grzegtracz@gmail.com', N'555552322', 0, NULL, 1, 8, 2)
INSERT [dbo].[Pracownicy] ([Id_prac], [Imię], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Rodzaje_zatrudnienia_Id], [Stanowiska_Id], [Zespoły_Id]) VALUES (10, N'Kamila', N'Lubicz', CAST(N'2021-10-12' AS Date), N'kamilalub@gmail.com', N'774384362', 0, NULL, 2, 3, 2)
INSERT [dbo].[Pracownicy] ([Id_prac], [Imię], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Rodzaje_zatrudnienia_Id], [Stanowiska_Id], [Zespoły_Id]) VALUES (11, N'Janusz', N'Tkacz', CAST(N'2022-01-05' AS Date), N'jantkacz@gmail.com', N'483729832', 0, NULL, 4, 7, 4)
INSERT [dbo].[Pracownicy] ([Id_prac], [Imię], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Rodzaje_zatrudnienia_Id], [Stanowiska_Id], [Zespoły_Id]) VALUES (12, N'Agata', N'Bąk', CAST(N'2022-01-05' AS Date), N'agatabak@gmail.com', N'533262783', 0, NULL, 4, 8, 3)
INSERT [dbo].[Pracownicy] ([Id_prac], [Imię], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Rodzaje_zatrudnienia_Id], [Stanowiska_Id], [Zespoły_Id]) VALUES (13, N'Tomasz', N'Lipa', CAST(N'2021-08-01' AS Date), N'tomlipa@gmail.com', N'743625635', 1, CAST(N'2021-09-01' AS Date), 4, 8, 4)
INSERT [dbo].[Pracownicy] ([Id_prac], [Imię], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Rodzaje_zatrudnienia_Id], [Stanowiska_Id], [Zespoły_Id]) VALUES (14, N'Kamil', N'Ogier', CAST(N'2021-11-01' AS Date), N'kamilogier@gmail.com', N'642323713', 0, NULL, 1, 3, 4)
INSERT [dbo].[Pracownicy] ([Id_prac], [Imię], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Rodzaje_zatrudnienia_Id], [Stanowiska_Id], [Zespoły_Id]) VALUES (15, N'Kajetan', N'Figa', CAST(N'2021-12-03' AS Date), N'kajetanfiga@gmail.com', N'378263722', 0, NULL, 1, 3, 3)
INSERT [dbo].[Pracownicy] ([Id_prac], [Imię], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Rodzaje_zatrudnienia_Id], [Stanowiska_Id], [Zespoły_Id]) VALUES (16, N'Ola', N'Pajac', CAST(N'2022-01-05' AS Date), N'olapajac@gmail.com', N'988323621', 0, NULL, 2, 4, 3)
INSERT [dbo].[Pracownicy] ([Id_prac], [Imię], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Rodzaje_zatrudnienia_Id], [Stanowiska_Id], [Zespoły_Id]) VALUES (17, N'Joanna', N'Puch', CAST(N'2021-11-28' AS Date), N'joannapuch@gmail.com', NULL, 0, NULL, 2, 10, 2)
INSERT [dbo].[Pracownicy] ([Id_prac], [Imię], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Rodzaje_zatrudnienia_Id], [Stanowiska_Id], [Zespoły_Id]) VALUES (18, N'Krystyna', N'Pawlak', CAST(N'2021-06-03' AS Date), N'kryspaw@gmail.com', N'894371263', 1, CAST(N'2021-07-01' AS Date), 1, 6, 1)
INSERT [dbo].[Pracownicy] ([Id_prac], [Imię], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Rodzaje_zatrudnienia_Id], [Stanowiska_Id], [Zespoły_Id]) VALUES (19, N'Tom', N'Levis', CAST(N'2021-06-05' AS Date), N'tomlevis@gmail.com', NULL, 1, CAST(N'2021-12-12' AS Date), 1, 8, 4)
SET IDENTITY_INSERT [dbo].[Pracownicy] OFF
GO
SET IDENTITY_INSERT [dbo].[Projekty] ON 

INSERT [dbo].[Projekty] ([Id], [Termin_oddania], [Opis], [Klienci_Id], [ZespoLy_id]) VALUES (1, CAST(N'2022-03-29' AS Date), N'Aplikacja na telefony, sklep z możliwością zamawiania produktów', 1, 4)
INSERT [dbo].[Projekty] ([Id], [Termin_oddania], [Opis], [Klienci_Id], [ZespoLy_id]) VALUES (2, CAST(N'2022-06-05' AS Date), N'Aplikacja do oglądania filmów z udziałem Toma Hanksa', 2, 3)
INSERT [dbo].[Projekty] ([Id], [Termin_oddania], [Opis], [Klienci_Id], [ZespoLy_id]) VALUES (3, CAST(N'2022-01-25' AS Date), N'Aplikacja do ewidencji pracowników w firmie przewozowej', 3, 2)
INSERT [dbo].[Projekty] ([Id], [Termin_oddania], [Opis], [Klienci_Id], [ZespoLy_id]) VALUES (4, CAST(N'2022-08-12' AS Date), N'Aplikacja do biegania, podaje trase, informacje o przegiegnietym dystansie, czas, inne informacje', 6, 4)
INSERT [dbo].[Projekty] ([Id], [Termin_oddania], [Opis], [Klienci_Id], [ZespoLy_id]) VALUES (5, CAST(N'2022-10-30' AS Date), N'Aplikacja wspomagająca rozliczanie podatków', 4, 3)
INSERT [dbo].[Projekty] ([Id], [Termin_oddania], [Opis], [Klienci_Id], [ZespoLy_id]) VALUES (6, CAST(N'2022-09-04' AS Date), N'Aplikacja do zarządzania siecią sklepów osiedlowych', 5, 2)
SET IDENTITY_INSERT [dbo].[Projekty] OFF
GO
SET IDENTITY_INSERT [dbo].[Rodzaje_zatrudnienia] ON 

INSERT [dbo].[Rodzaje_zatrudnienia] ([Id], [Nazwa], [Min_godzin], [Max_godzin]) VALUES (1, N'Pełny etat', 160, 200)
INSERT [dbo].[Rodzaje_zatrudnienia] ([Id], [Nazwa], [Min_godzin], [Max_godzin]) VALUES (2, N'Pół etatu', 80, 100)
INSERT [dbo].[Rodzaje_zatrudnienia] ([Id], [Nazwa], [Min_godzin], [Max_godzin]) VALUES (3, N'Praktyka', 10, 40)
INSERT [dbo].[Rodzaje_zatrudnienia] ([Id], [Nazwa], [Min_godzin], [Max_godzin]) VALUES (4, N'Umowa zlecenie', 60, 180)
SET IDENTITY_INSERT [dbo].[Rodzaje_zatrudnienia] OFF
GO
SET IDENTITY_INSERT [dbo].[Sprzęty] ON 

INSERT [dbo].[Sprzęty] ([Id], [Typ], [Nazwa], [Opis], [Pracownicy_Id_prac]) VALUES (3, N'Laptop', N'Lenovo ideapad 5', N'Nowy', 10)
INSERT [dbo].[Sprzęty] ([Id], [Typ], [Nazwa], [Opis], [Pracownicy_Id_prac]) VALUES (5, N'Laptop', N'Lenovo ideapad 5', N'Nowy', 14)
INSERT [dbo].[Sprzęty] ([Id], [Typ], [Nazwa], [Opis], [Pracownicy_Id_prac]) VALUES (6, N'Laptop', N'HP omen 15', N'Nowy', 15)
INSERT [dbo].[Sprzęty] ([Id], [Typ], [Nazwa], [Opis], [Pracownicy_Id_prac]) VALUES (7, N'Klawiatura', N'Logitech K380', NULL, 1)
INSERT [dbo].[Sprzęty] ([Id], [Typ], [Nazwa], [Opis], [Pracownicy_Id_prac]) VALUES (8, N'Myszka', N'Razer DeathAdder', NULL, 1)
INSERT [dbo].[Sprzęty] ([Id], [Typ], [Nazwa], [Opis], [Pracownicy_Id_prac]) VALUES (10, N'Klawiatura', N'Steelseries apex 3', NULL, 4)
INSERT [dbo].[Sprzęty] ([Id], [Typ], [Nazwa], [Opis], [Pracownicy_Id_prac]) VALUES (11, N'Myszka', N'Razer Basilisk', NULL, 7)
INSERT [dbo].[Sprzęty] ([Id], [Typ], [Nazwa], [Opis], [Pracownicy_Id_prac]) VALUES (12, N'Laptop', N'HP pavilion', NULL, 17)
SET IDENTITY_INSERT [dbo].[Sprzęty] OFF
GO
SET IDENTITY_INSERT [dbo].[Stanowiska] ON 

INSERT [dbo].[Stanowiska] ([Id], [Nazwa], [Wymagany_staż], [Stawka_godzinowa]) VALUES (1, N'Administrator sieci LAN', 1, 30)
INSERT [dbo].[Stanowiska] ([Id], [Nazwa], [Wymagany_staż], [Stawka_godzinowa]) VALUES (2, N'Junior back-end developer', 1, 40)
INSERT [dbo].[Stanowiska] ([Id], [Nazwa], [Wymagany_staż], [Stawka_godzinowa]) VALUES (3, N'Junior front-end developer', 1, 40)
INSERT [dbo].[Stanowiska] ([Id], [Nazwa], [Wymagany_staż], [Stawka_godzinowa]) VALUES (4, N'Młodszy programista', 0, 16)
INSERT [dbo].[Stanowiska] ([Id], [Nazwa], [Wymagany_staż], [Stawka_godzinowa]) VALUES (5, N'Scrum master', 1, 100)
INSERT [dbo].[Stanowiska] ([Id], [Nazwa], [Wymagany_staż], [Stawka_godzinowa]) VALUES (6, N'Sekretarka', 0, 30)
INSERT [dbo].[Stanowiska] ([Id], [Nazwa], [Wymagany_staż], [Stawka_godzinowa]) VALUES (7, N'Senior back-end developer', 1, 150)
INSERT [dbo].[Stanowiska] ([Id], [Nazwa], [Wymagany_staż], [Stawka_godzinowa]) VALUES (8, N'Senior front-end developer', 1, 120)
INSERT [dbo].[Stanowiska] ([Id], [Nazwa], [Wymagany_staż], [Stawka_godzinowa]) VALUES (9, N'Technik sprzętu', 1, 30)
INSERT [dbo].[Stanowiska] ([Id], [Nazwa], [Wymagany_staż], [Stawka_godzinowa]) VALUES (10, N'Tester', 1, 100)
SET IDENTITY_INSERT [dbo].[Stanowiska] OFF
GO
SET IDENTITY_INSERT [dbo].[Wpisy_pracy] ON 

INSERT [dbo].[Wpisy_pracy] ([Id], [Numer_wpisu], [Czas_rozpoczecia], [Czas_zakończenia], [Opis], [Miejsca_id], [Zadania_id]) VALUES (4, 1, CAST(N'2022-01-10T08:00:00.000' AS DateTime), CAST(N'2022-01-10T16:00:00.000' AS DateTime), N'Stworzenie sprint backlogu i umieszczenie go na gicie', 1, 3)
INSERT [dbo].[Wpisy_pracy] ([Id], [Numer_wpisu], [Czas_rozpoczecia], [Czas_zakończenia], [Opis], [Miejsca_id], [Zadania_id]) VALUES (6, 1, CAST(N'2022-01-09T09:30:00.000' AS DateTime), CAST(N'2022-01-09T14:30:00.000' AS DateTime), N'Stworzenie szkieletu', 7, 19)
INSERT [dbo].[Wpisy_pracy] ([Id], [Numer_wpisu], [Czas_rozpoczecia], [Czas_zakończenia], [Opis], [Miejsca_id], [Zadania_id]) VALUES (7, 2, CAST(N'2022-01-11T15:00:00.000' AS DateTime), CAST(N'2022-01-11T20:00:00.000' AS DateTime), N'Dokonczenie szablonu', 7, 19)
INSERT [dbo].[Wpisy_pracy] ([Id], [Numer_wpisu], [Czas_rozpoczecia], [Czas_zakończenia], [Opis], [Miejsca_id], [Zadania_id]) VALUES (8, 1, CAST(N'2022-01-11T13:00:00.000' AS DateTime), CAST(N'2022-01-11T21:00:00.000' AS DateTime), N'Dodałem opis, ale potrzeba jeszcze formatowania', 8, 18)
INSERT [dbo].[Wpisy_pracy] ([Id], [Numer_wpisu], [Czas_rozpoczecia], [Czas_zakończenia], [Opis], [Miejsca_id], [Zadania_id]) VALUES (9, 1, CAST(N'2022-01-12T08:00:00.000' AS DateTime), CAST(N'2022-01-12T13:00:00.000' AS DateTime), N'Stworzenie 2 testow', 9, 21)
INSERT [dbo].[Wpisy_pracy] ([Id], [Numer_wpisu], [Czas_rozpoczecia], [Czas_zakończenia], [Opis], [Miejsca_id], [Zadania_id]) VALUES (10, 1, CAST(N'2022-01-13T09:00:00.000' AS DateTime), CAST(N'2022-01-13T17:00:00.000' AS DateTime), N'Szukanie bledu', 10, 23)
INSERT [dbo].[Wpisy_pracy] ([Id], [Numer_wpisu], [Czas_rozpoczecia], [Czas_zakończenia], [Opis], [Miejsca_id], [Zadania_id]) VALUES (12, 2, CAST(N'2022-01-14T09:00:00.000' AS DateTime), CAST(N'2022-01-14T17:00:00.000' AS DateTime), N'Znalezienie bledu ale naprawa nie rozwiazuje bledu w 100%', 10, 23)
INSERT [dbo].[Wpisy_pracy] ([Id], [Numer_wpisu], [Czas_rozpoczecia], [Czas_zakończenia], [Opis], [Miejsca_id], [Zadania_id]) VALUES (13, 3, CAST(N'2022-01-15T09:00:00.000' AS DateTime), CAST(N'2022-01-15T17:00:00.000' AS DateTime), N'Rozwiazanie problemu', 10, 23)
INSERT [dbo].[Wpisy_pracy] ([Id], [Numer_wpisu], [Czas_rozpoczecia], [Czas_zakończenia], [Opis], [Miejsca_id], [Zadania_id]) VALUES (14, 1, CAST(N'2022-01-16T07:00:00.000' AS DateTime), CAST(N'2022-01-16T13:00:00.000' AS DateTime), N'Dodanie formularza dodawania pracownika', 11, 27)
INSERT [dbo].[Wpisy_pracy] ([Id], [Numer_wpisu], [Czas_rozpoczecia], [Czas_zakończenia], [Opis], [Miejsca_id], [Zadania_id]) VALUES (17, 1, CAST(N'2022-01-18T19:00:00.000' AS DateTime), CAST(N'2022-01-18T23:00:00.000' AS DateTime), N'Dodanie klas testowych dla formularzy', 2, 29)
SET IDENTITY_INSERT [dbo].[Wpisy_pracy] OFF
GO
SET IDENTITY_INSERT [dbo].[Zadania] ON 

INSERT [dbo].[Zadania] ([Id], [Nazwa], [Czy_zakończone], [Przeznaczony_czas], [Opis], [Pracownicy_Id_prac], [Projekty_Id]) VALUES (1, N'Przydzielenie zadań pracownikom', 0, 0, NULL, 1, 1)
INSERT [dbo].[Zadania] ([Id], [Nazwa], [Czy_zakończone], [Przeznaczony_czas], [Opis], [Pracownicy_Id_prac], [Projekty_Id]) VALUES (3, N'Stworzenie sprint backlogu', 1, 8, NULL, 1, 1)
INSERT [dbo].[Zadania] ([Id], [Nazwa], [Czy_zakończone], [Przeznaczony_czas], [Opis], [Pracownicy_Id_prac], [Projekty_Id]) VALUES (4, N'Stworzenie kilku funkcji', 0, 0, N'funkcje do przyciskow usun z koszyka, dodaj do koszyka', 3, 1)
INSERT [dbo].[Zadania] ([Id], [Nazwa], [Czy_zakończone], [Przeznaczony_czas], [Opis], [Pracownicy_Id_prac], [Projekty_Id]) VALUES (10, N'Stworzenie działającej funkcji zamawiania prouktów', 0, 0, NULL, 14, 1)
INSERT [dbo].[Zadania] ([Id], [Nazwa], [Czy_zakończone], [Przeznaczony_czas], [Opis], [Pracownicy_Id_prac], [Projekty_Id]) VALUES (18, N'Dodanie pola opisu do stron przedmiotów', 0, 8, NULL, 11, 1)
INSERT [dbo].[Zadania] ([Id], [Nazwa], [Czy_zakończone], [Przeznaczony_czas], [Opis], [Pracownicy_Id_prac], [Projekty_Id]) VALUES (19, N'Szablon stron dla filmów', 1, 10, NULL, 2, 2)
INSERT [dbo].[Zadania] ([Id], [Nazwa], [Czy_zakończone], [Przeznaczony_czas], [Opis], [Pracownicy_Id_prac], [Projekty_Id]) VALUES (20, N'Stworzenie animacji płynnych przejść', 0, 0, NULL, 2, 2)
INSERT [dbo].[Zadania] ([Id], [Nazwa], [Czy_zakończone], [Przeznaczony_czas], [Opis], [Pracownicy_Id_prac], [Projekty_Id]) VALUES (21, N'Testy dla funkcji odpowiedzialnych za profil', 0, 5, NULL, 4, 2)
INSERT [dbo].[Zadania] ([Id], [Nazwa], [Czy_zakończone], [Przeznaczony_czas], [Opis], [Pracownicy_Id_prac], [Projekty_Id]) VALUES (22, N'Poprawa wizualna strona głównej', 0, 0, NULL, 12, 2)
INSERT [dbo].[Zadania] ([Id], [Nazwa], [Czy_zakończone], [Przeznaczony_czas], [Opis], [Pracownicy_Id_prac], [Projekty_Id]) VALUES (23, N'Naprawa błędu z wyświetlaniem ocen', 1, 24, N'Niektore gwiazdki znikaja albo pojawiaja sie dodatkowe', 15, 2)
INSERT [dbo].[Zadania] ([Id], [Nazwa], [Czy_zakończone], [Przeznaczony_czas], [Opis], [Pracownicy_Id_prac], [Projekty_Id]) VALUES (25, N'Dodanie opisów do funkcji ', 0, 0, N'Dodanie dokumentacji kodu', 16, 2)
INSERT [dbo].[Zadania] ([Id], [Nazwa], [Czy_zakończone], [Przeznaczony_czas], [Opis], [Pracownicy_Id_prac], [Projekty_Id]) VALUES (27, N'Wyświetlanie formularzy z dodaniem pracownika', 0, 6, NULL, 9, 3)
INSERT [dbo].[Zadania] ([Id], [Nazwa], [Czy_zakończone], [Przeznaczony_czas], [Opis], [Pracownicy_Id_prac], [Projekty_Id]) VALUES (28, N'Przyciski usuwania pracownikow', 0, 0, NULL, 10, 3)
INSERT [dbo].[Zadania] ([Id], [Nazwa], [Czy_zakończone], [Przeznaczony_czas], [Opis], [Pracownicy_Id_prac], [Projekty_Id]) VALUES (29, N'Testy dla wyswietlania formularzy', 0, 4, NULL, 17, 3)
INSERT [dbo].[Zadania] ([Id], [Nazwa], [Czy_zakończone], [Przeznaczony_czas], [Opis], [Pracownicy_Id_prac], [Projekty_Id]) VALUES (30, N'Dodanie opcji komentarza przy ocenie', 0, 0, NULL, 15, 2)
SET IDENTITY_INSERT [dbo].[Zadania] OFF
GO
SET IDENTITY_INSERT [dbo].[Zespoły] ON 

INSERT [dbo].[Zespoły] ([Id], [Nazwa], [Id_kierownika]) VALUES (1, N'Administracja', NULL)
INSERT [dbo].[Zespoły] ([Id], [Nazwa], [Id_kierownika]) VALUES (2, N'Aplikacje bazodanowe', NULL)
INSERT [dbo].[Zespoły] ([Id], [Nazwa], [Id_kierownika]) VALUES (3, N'Aplikacje desktopowe', NULL)
INSERT [dbo].[Zespoły] ([Id], [Nazwa], [Id_kierownika]) VALUES (4, N'Aplikacje mobilne', NULL)
INSERT [dbo].[Zespoły] ([Id], [Nazwa], [Id_kierownika]) VALUES (5, N'Pomoc techniczna', NULL)
SET IDENTITY_INSERT [dbo].[Zespoły] OFF
GO
ALTER TABLE [dbo].[Godziny_pracy]  WITH CHECK ADD  CONSTRAINT [FK_Godziny_pracy_Pracownicy] FOREIGN KEY([Pracownicy_Id_prac])
REFERENCES [dbo].[Pracownicy] ([Id_prac])
GO
ALTER TABLE [dbo].[Godziny_pracy] CHECK CONSTRAINT [FK_Godziny_pracy_Pracownicy]
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
/****** Object:  StoredProcedure [dbo].[GetPracownicy]    Script Date: 21.01.2022 15:16:44 ******/
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
/****** Object:  StoredProcedure [dbo].[Pracownicy_szczegoly]    Script Date: 21.01.2022 15:16:44 ******/
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
/****** Object:  StoredProcedure [dbo].[procGetPracownicy]    Script Date: 21.01.2022 15:16:44 ******/
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
/****** Object:  StoredProcedure [dbo].[procGetStanowiska]    Script Date: 21.01.2022 15:16:44 ******/
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
/****** Object:  StoredProcedure [dbo].[procGetZespoły]    Script Date: 21.01.2022 15:16:44 ******/
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
/****** Object:  StoredProcedure [dbo].[ProcIdKlienci]    Script Date: 21.01.2022 15:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcIdKlienci]     
	@Id AS int
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT *
		FROM [Firma].[dbo].[Klienci]
		WHERE Id = @Id
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcIdMiejsca]    Script Date: 21.01.2022 15:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcIdMiejsca]     
	@Id AS int
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT *
		FROM [Firma].[dbo].[Miejsca]
		WHERE Id = @Id
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcIdPracownicy]    Script Date: 21.01.2022 15:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcIdPracownicy]     
	@Id AS int
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT 
	   [Id_prac] AS Id
      ,[Imię]
      ,[Nazwisko]
      ,[Data_zatrudnienia]
      ,[Email]
      ,[Numer_telefonu]
      ,[Czy_zwolniony]
      ,[Data_zwolnienia]
      ,[Rodzaje_zatrudnienia_Id]
      ,[Stanowiska_Id]
      ,[Zespoły_Id]
	FROM [Firma].[dbo].[Pracownicy]
	WHERE Id_prac = @Id
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcIdPracownicyWpisy Pracy]    Script Date: 21.01.2022 15:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcIdPracownicyWpisy Pracy]     
	@Id AS int
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT z.Nazwa, w.Czas_rozpoczecia, w.Czas_zakończenia, w.Opis
		FROM ([Firma].[dbo].[Pracownicy] p INNER JOIN [Firma].[dbo].[Zadania] z ON p.Id_prac = z.Pracownicy_Id_prac)
		INNER JOIN [Firma].[dbo].[Wpisy_pracy] w ON z.Id = w.Zadania_id
		WHERE Id_prac = @Id
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcIdPracownicyZadania]    Script Date: 21.01.2022 15:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcIdPracownicyZadania]     
	@Id AS int
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT z.Nazwa, z.Opis
		FROM [Firma].[dbo].[Pracownicy] p INNER JOIN [Firma].[dbo].[Zadania] z ON p.Id_prac = z.Pracownicy_Id_prac
		WHERE Id_prac = @Id
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcIdProjekty]    Script Date: 21.01.2022 15:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcIdProjekty]     
	@Id AS int
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT *
		FROM [Firma].[dbo].[Projekty]
		WHERE Id = @Id
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcIdRodzaje Zatrudnienia]    Script Date: 21.01.2022 15:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcIdRodzaje Zatrudnienia]     
	@Id AS int
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT *
		FROM [Firma].[dbo].[Rodzaje_zatrudnienia]
		WHERE Id = @Id
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcIdSprzęty]    Script Date: 21.01.2022 15:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcIdSprzęty]     
	@Id AS int
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT *
		FROM [Firma].[dbo].[Sprzęty]
		WHERE Id = @Id
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcIdStanowiska]    Script Date: 21.01.2022 15:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcIdStanowiska]     
	@Id AS int
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT *
		FROM [Firma].[dbo].[Stanowiska]
		WHERE Id = @Id
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcIdWpisy Pracy]    Script Date: 21.01.2022 15:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcIdWpisy Pracy]     
	@Id AS int
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT *
		FROM [Firma].[dbo].[Wpisy_pracy]
		WHERE Id = @Id
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcIdZadania]    Script Date: 21.01.2022 15:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcIdZadania]     
	@Id AS int
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT *
		FROM [Firma].[dbo].[Zadania]
		WHERE Id = @Id
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcIdZespoły]    Script Date: 21.01.2022 15:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcIdZespoły]     
	@Id AS int
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT *
		FROM [Firma].[dbo].[Zespoły]
		WHERE Id = @Id
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcKlienci]    Script Date: 21.01.2022 15:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcKlienci]     
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT *
		FROM [Firma].[dbo].[Klienci]
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcMiejsca]    Script Date: 21.01.2022 15:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcMiejsca]     
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT *
		FROM [Firma].[dbo].[Miejsca]
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcPracownicy]    Script Date: 21.01.2022 15:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcPracownicy]     
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT 
	   [Id_prac] AS Id
      ,[Imię]
      ,[Nazwisko]
      ,[Data_zatrudnienia]
      ,[Email]
      ,[Numer_telefonu]
      ,[Czy_zwolniony]
      ,[Data_zwolnienia]
      ,[Rodzaje_zatrudnienia_Id]
      ,[Stanowiska_Id]
      ,[Zespoły_Id]
  FROM [Firma].[dbo].[Pracownicy]
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcProjekty]    Script Date: 21.01.2022 15:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcProjekty]     
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT *
		FROM [Firma].[dbo].[Projekty]
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcRodzaje Zatrudnienia]    Script Date: 21.01.2022 15:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcRodzaje Zatrudnienia]     
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT *
		FROM [Firma].[dbo].[Rodzaje_zatrudnienia]
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcSprzęty]    Script Date: 21.01.2022 15:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcSprzęty]     
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT *
		FROM [Firma].[dbo].[Sprzęty]
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcStanowiska]    Script Date: 21.01.2022 15:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcStanowiska]     
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT *
		FROM [Firma].[dbo].[Stanowiska]
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcWpisy Pracy]    Script Date: 21.01.2022 15:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcWpisy Pracy]     
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT *
		FROM [Firma].[dbo].[Wpisy_pracy]
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcZadania]    Script Date: 21.01.2022 15:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcZadania]     
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT *
		FROM [Firma].[dbo].[Zadania]
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcZespoły]    Script Date: 21.01.2022 15:16:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcZespoły]     
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT *
		FROM [Firma].[dbo].[Zespoły]
	COMMIT TRANSACTION
	RETURN
END
GO
USE [master]
GO
ALTER DATABASE [Firma] SET  READ_WRITE 
GO
