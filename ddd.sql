USE [master]
SET IDENTITY_INSERT [dbo].[Klienci] ON 

INSERT [dbo].[Klienci] ([Id], [Imię], [Nazwisko], [Email_klienta], [Numer_telefonu]) VALUES (1, N'Hugo', N'Boss', N'hugoboss@gmail.com', N'346473728')
INSERT [dbo].[Klienci] ([Id], [Imię], [Nazwisko], [Email_klienta], [Numer_telefonu]) VALUES (2, N'Tom', N'Hanks', N'tomhanks@gmail.com', NULL)
INSERT [dbo].[Klienci] ([Id], [Imię], [Nazwisko], [Email_klienta], [Numer_telefonu]) VALUES (3, N'Aleksander', N'Szopa', N'alekszopa@gmail.com', N'555333241')
INSERT [dbo].[Klienci] ([Id], [Imię], [Nazwisko], [Email_klienta], [Numer_telefonu]) VALUES (4, N'Witold', N'Gębicz', N'witoldgebicz@gmail.com', NULL)
INSERT [dbo].[Klienci] ([Id], [Imię], [Nazwisko], [Email_klienta], [Numer_telefonu]) VALUES (5, N'Teresa', N'Fryzura', N'terfryz@gmail.com', N'435252515')
INSERT [dbo].[Klienci] ([Id], [Imię], [Nazwisko], [Email_klienta], [Numer_telefonu]) VALUES (6, N'Oliwia', N'Biegacz', N'oliwiabieg@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Klienci] OFF
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
INSERT [dbo].[Pracownicy] ([Id_prac], [Imię], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Rodzaje_zatrudnienia_Id], [Stanowiska_Id], [Zespoły_Id]) VALUES (17, N'Joanna', N'Puch', CAST(N'2021-11-28' AS Date), N'joannapuch@gmail.com', NULL, 0, NULL, 2, 4, 2)
INSERT [dbo].[Pracownicy] ([Id_prac], [Imię], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Rodzaje_zatrudnienia_Id], [Stanowiska_Id], [Zespoły_Id]) VALUES (18, N'Krystyna', N'Pawlak', CAST(N'2021-06-03' AS Date), N'kryspaw@gmail.com', N'894371263', 1, CAST(N'2021-07-01' AS Date), 1, 6, 1)
INSERT [dbo].[Pracownicy] ([Id_prac], [Imię], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Rodzaje_zatrudnienia_Id], [Stanowiska_Id], [Zespoły_Id]) VALUES (19, N'Tom', N'Levis', CAST(N'2021-06-05' AS Date), N'tomlevis@gmail.com', NULL, 1, CAST(N'2021-12-12' AS Date), 1, 8, 4)
SET IDENTITY_INSERT [dbo].[Pracownicy] OFF
GO
SET IDENTITY_INSERT [dbo].[Projekty] ON 

INSERT [dbo].[Projekty] ([Id], [Termin_oddania], [Opis], [Klienci_Id], [ZespoLy_id]) VALUES (1, CAST(N'2022-03-29' AS Date), N'Aplikacja na telefony, sklep z możliwością zamawiania produktów', 1, 4)
INSERT [dbo].[Projekty] ([Id], [Termin_oddania], [Opis], [Klienci_Id], [ZespoLy_id]) VALUES (2, CAST(N'2022-06-05' AS Date), N'Aplikacja do oglądania filmów z udziałem Toma Hanksa', 2, 3)
INSERT [dbo].[Projekty] ([Id], [Termin_oddania], [Opis], [Klienci_Id], [ZespoLy_id]) VALUES (3, CAST(N'2022-01-25' AS Date), N'Aplikacja do ewidencji pracowników w firmie przewozowej', 3, 2)
INSERT [dbo].[Projekty] ([Id], [Termin_oddania], [Opis], [Klienci_Id], [ZespoLy_id]) VALUES (4, CAST(N'2022-04-12' AS Date), N'Aplikacja do biegania, podaje trase, informacje o przegiegnietym dystansie, czas, inne informacje', 6, 4)
INSERT [dbo].[Projekty] ([Id], [Termin_oddania], [Opis], [Klienci_Id], [ZespoLy_id]) VALUES (5, CAST(N'2022-05-30' AS Date), N'Aplikacja wspomagająca rozliczanie podatków', 4, 3)
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
SET IDENTITY_INSERT [dbo].[Zadania] ON 

INSERT [dbo].[Zadania] ([Id], [Nazwa], [Czy_zakończone], [Przeznaczony_czas], [Opis], [Pracownicy_Id_prac], [Projekty_Id]) VALUES (1, N'Przydzielenie zadań pracownikom', 0, 0, NULL, 1, 1)
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
SET QUOTED_IDENTIFIER ON
USE [master]
GO
ALTER DATABASE [Firma] SET  READ_WRITE 
GO
