USE [Firma]
GO
SET IDENTITY_INSERT [dbo].[Klienci] ON 

INSERT [dbo].[Klienci] ([Id_klienta], [Imie], [Nazwisko], [Email_klienta], [Numer_telefonu]) VALUES (1, N'Hugo', N'Boss', N'hugoboss@gmail.com', N'347462722')
INSERT [dbo].[Klienci] ([Id_klienta], [Imie], [Nazwisko], [Email_klienta], [Numer_telefonu]) VALUES (2, N'Tom', N'Hanks', N'tomhanks@gmail.com', NULL)
INSERT [dbo].[Klienci] ([Id_klienta], [Imie], [Nazwisko], [Email_klienta], [Numer_telefonu]) VALUES (3, N'Aleksander', N'Szopa', N'alekszopa@gmail.com', N'555332321')
INSERT [dbo].[Klienci] ([Id_klienta], [Imie], [Nazwisko], [Email_klienta], [Numer_telefonu]) VALUES (4, N'Witold', N'Gębicz', N'witoldgebicz@gmail.com', NULL)
INSERT [dbo].[Klienci] ([Id_klienta], [Imie], [Nazwisko], [Email_klienta], [Numer_telefonu]) VALUES (5, N'Terasa', N'Fryzura', N'terfryz@gmail.com', N'437252515')
INSERT [dbo].[Klienci] ([Id_klienta], [Imie], [Nazwisko], [Email_klienta], [Numer_telefonu]) VALUES (6, N'Oliwia', N'Biegacz', N'oliwiabieg@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Klienci] OFF
GO
INSERT [dbo].[Zespol] ([Nazwa_zespolu], [Id_kierownika]) VALUES (N'Administracja', 6)
INSERT [dbo].[Zespol] ([Nazwa_zespolu], [Id_kierownika]) VALUES (N'Aplikacje bazodanowe', 10)
INSERT [dbo].[Zespol] ([Nazwa_zespolu], [Id_kierownika]) VALUES (N'Aplikacje desktopowe', 2)
INSERT [dbo].[Zespol] ([Nazwa_zespolu], [Id_kierownika]) VALUES (N'Aplikacje mobilne', 1)
INSERT [dbo].[Zespol] ([Nazwa_zespolu], [Id_kierownika]) VALUES (N'Pomoc Techniczna', 7)
GO
SET IDENTITY_INSERT [dbo].[Projekty] ON 

INSERT [dbo].[Projekty] ([Id_projektu], [Termin_oddania], [Opis], [Nazwa_zespolu], [Id_klienta]) VALUES (2, CAST(N'2022-03-29T00:00:00.000' AS DateTime), N'Aplikacja na telefony, sklep z mozliwoscia zamawiania produktow', N'Aplikacje mobilne', 1)
INSERT [dbo].[Projekty] ([Id_projektu], [Termin_oddania], [Opis], [Nazwa_zespolu], [Id_klienta]) VALUES (3, CAST(N'2022-06-05T00:00:00.000' AS DateTime), N'Aplikacja do oglądania filmów z udziałem Toma Hanksa', N'Aplikacje desktopowe', 2)
INSERT [dbo].[Projekty] ([Id_projektu], [Termin_oddania], [Opis], [Nazwa_zespolu], [Id_klienta]) VALUES (4, CAST(N'2022-01-25T00:00:00.000' AS DateTime), N'Aplikacja do ewidencji pracowników w firmie przewozowej', N'Aplikacje bazodanowe', 3)
INSERT [dbo].[Projekty] ([Id_projektu], [Termin_oddania], [Opis], [Nazwa_zespolu], [Id_klienta]) VALUES (5, CAST(N'2022-04-12T00:00:00.000' AS DateTime), N'Aplikacja do biegania, podaje trasę, informacje o przebiegniętym dystansie, czas, inne informacje', N'Aplikacje mobilne', 6)
INSERT [dbo].[Projekty] ([Id_projektu], [Termin_oddania], [Opis], [Nazwa_zespolu], [Id_klienta]) VALUES (6, CAST(N'2022-05-30T00:00:00.000' AS DateTime), N'Aplikacja wspomagająca rozliczanie podatków', N'Aplikacje desktopowe', 4)
INSERT [dbo].[Projekty] ([Id_projektu], [Termin_oddania], [Opis], [Nazwa_zespolu], [Id_klienta]) VALUES (7, CAST(N'2022-09-04T00:00:00.000' AS DateTime), N'Aplikacja do zarządania siecią sklepów osiedlowych', N'Aplikacje bazodanowe', 5)
SET IDENTITY_INSERT [dbo].[Projekty] OFF
GO
INSERT [dbo].[Rodzaj_zatrudniania] ([Nazwa_rodzaju_zatrudnienia], [Min_godzin], [Max_godzin]) VALUES (N'Pełny etat', 160, 200)
INSERT [dbo].[Rodzaj_zatrudniania] ([Nazwa_rodzaju_zatrudnienia], [Min_godzin], [Max_godzin]) VALUES (N'Pół etatu', 80, 100)
INSERT [dbo].[Rodzaj_zatrudniania] ([Nazwa_rodzaju_zatrudnienia], [Min_godzin], [Max_godzin]) VALUES (N'Praktyka', 10, 40)
INSERT [dbo].[Rodzaj_zatrudniania] ([Nazwa_rodzaju_zatrudnienia], [Min_godzin], [Max_godzin]) VALUES (N'Umowa zlecenie', 60, 180)
GO
INSERT [dbo].[Stanowisko] ([Nazwa_stanowiska], [Wymagany_staz], [Stawka_godzinowa]) VALUES (N'Administrator sieci LAN', 1, 30)
INSERT [dbo].[Stanowisko] ([Nazwa_stanowiska], [Wymagany_staz], [Stawka_godzinowa]) VALUES (N'Junior back-end developer', 1, 40)
INSERT [dbo].[Stanowisko] ([Nazwa_stanowiska], [Wymagany_staz], [Stawka_godzinowa]) VALUES (N'Junior front-end developer', 1, 40)
INSERT [dbo].[Stanowisko] ([Nazwa_stanowiska], [Wymagany_staz], [Stawka_godzinowa]) VALUES (N'Młodszy programista', 0, 16)
INSERT [dbo].[Stanowisko] ([Nazwa_stanowiska], [Wymagany_staz], [Stawka_godzinowa]) VALUES (N'Scrum master', 1, 100)
INSERT [dbo].[Stanowisko] ([Nazwa_stanowiska], [Wymagany_staz], [Stawka_godzinowa]) VALUES (N'Sekretarka', 0, 30)
INSERT [dbo].[Stanowisko] ([Nazwa_stanowiska], [Wymagany_staz], [Stawka_godzinowa]) VALUES (N'Senior back-end developer', 1, 150)
INSERT [dbo].[Stanowisko] ([Nazwa_stanowiska], [Wymagany_staz], [Stawka_godzinowa]) VALUES (N'Senior front-end developer', 1, 120)
INSERT [dbo].[Stanowisko] ([Nazwa_stanowiska], [Wymagany_staz], [Stawka_godzinowa]) VALUES (N'Technik sprzętu', 1, 30)
INSERT [dbo].[Stanowisko] ([Nazwa_stanowiska], [Wymagany_staz], [Stawka_godzinowa]) VALUES (N'Tester', 1, 100)
GO
SET IDENTITY_INSERT [dbo].[Pracownicy] ON 

INSERT [dbo].[Pracownicy] ([Id_pracownika], [Imie], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Stanowisko], [Rodzaj_zatrudnienia], [Zespol]) VALUES (1, N'Maciej', N'Wawrzyniak', CAST(N'2021-06-03' AS Date), N'macwaw@gmail.com', N'666555444', 0, NULL, N'Scrum master', N'Pełny etat', N'Aplikacje mobilne')
INSERT [dbo].[Pracownicy] ([Id_pracownika], [Imie], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Stanowisko], [Rodzaj_zatrudnienia], [Zespol]) VALUES (2, N'Przemyslaw', N'Szymczak', CAST(N'2021-06-03' AS Date), N'przemszym@gmail.com', N'444222111', 0, NULL, N'Senior front-end developer', N'Pełny etat', N'Aplikacje desktopowe')
INSERT [dbo].[Pracownicy] ([Id_pracownika], [Imie], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Stanowisko], [Rodzaj_zatrudnienia], [Zespol]) VALUES (4, N'Tomasz', N'Kowalski', CAST(N'2022-01-04' AS Date), N'tomkowal@gmail.com', N'777555777', 0, NULL, N'Młodszy programista', N'Praktyka', N'Aplikacje mobilne')
INSERT [dbo].[Pracownicy] ([Id_pracownika], [Imie], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Stanowisko], [Rodzaj_zatrudnienia], [Zespol]) VALUES (5, N'Grzegorz', N'Nawrocki', CAST(N'2022-01-03' AS Date), N'grzegnawroc@gmail.com', N'555444333', 0, NULL, N'Młodszy programista', N'Praktyka', N'Aplikacje desktopowe')
INSERT [dbo].[Pracownicy] ([Id_pracownika], [Imie], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Stanowisko], [Rodzaj_zatrudnienia], [Zespol]) VALUES (6, N'Anna', N'Cichosz', CAST(N'2021-07-04' AS Date), N'annacich@gmail.com', N'888333222', 0, NULL, N'Sekretarka', N'Pełny etat', N'Administracja')
INSERT [dbo].[Pracownicy] ([Id_pracownika], [Imie], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Stanowisko], [Rodzaj_zatrudnienia], [Zespol]) VALUES (7, N'Krzysztof', N'Nowy', CAST(N'2021-07-07' AS Date), N'krzysznowy@gmail.com', N'888333111', 0, NULL, N'Technik sprzętu', N'Pół etatu', N'Pomoc techniczna')
INSERT [dbo].[Pracownicy] ([Id_pracownika], [Imie], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Stanowisko], [Rodzaj_zatrudnienia], [Zespol]) VALUES (8, N'Arkadiusz', N'Grzybek', CAST(N'2021-08-01' AS Date), N'arkgrzyb@gmail.com', N'777666777', 0, NULL, N'Administrator sieci LAN', N'Pełny etat', N'Pomoc techniczna')
INSERT [dbo].[Pracownicy] ([Id_pracownika], [Imie], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Stanowisko], [Rodzaj_zatrudnienia], [Zespol]) VALUES (9, N'Szymon', N'Czajkowski', CAST(N'2021-09-09' AS Date), N'szymczaj@gmail.com', N'555222111', 1, CAST(N'2021-09-10' AS Date), N'Młodszy programista', N'Praktyka', N'Aplikacje bazodanowe')
INSERT [dbo].[Pracownicy] ([Id_pracownika], [Imie], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Stanowisko], [Rodzaj_zatrudnienia], [Zespol]) VALUES (10, N'Grzegorz', N'Tracz', CAST(N'2021-09-10' AS Date), N'grzegtracz@gmail.com', N'444111888', 0, NULL, N'Senior front-end developer', N'Pełny etat', N'Aplikacje bazodanowe')
INSERT [dbo].[Pracownicy] ([Id_pracownika], [Imie], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Stanowisko], [Rodzaj_zatrudnienia], [Zespol]) VALUES (11, N'Kamila', N'Lubicz', CAST(N'2021-10-12' AS Date), N'kamilalubicz@gmail.com', N'774341213', 0, NULL, N'Junior front-end developer', N'Pół etatu', N'Aplikacje bazodanowe')
INSERT [dbo].[Pracownicy] ([Id_pracownika], [Imie], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Stanowisko], [Rodzaj_zatrudnienia], [Zespol]) VALUES (12, N'Janusz', N'Tkacz', CAST(N'2022-01-05' AS Date), N'janusztkacz@gmail.com', N'743235637', 0, NULL, N'Senior back-end developer', N'Umowa zlecenie', N'Aplikacje mobilne')
INSERT [dbo].[Pracownicy] ([Id_pracownika], [Imie], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Stanowisko], [Rodzaj_zatrudnienia], [Zespol]) VALUES (13, N'Agata', N'Bąk', CAST(N'2022-01-05' AS Date), N'agatabak@gmail.com', N'621625143', 0, NULL, N'Senior front-end developer', N'Umowa zlecenie', N'Aplikacje desktopowe')
INSERT [dbo].[Pracownicy] ([Id_pracownika], [Imie], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Stanowisko], [Rodzaj_zatrudnienia], [Zespol]) VALUES (14, N'Tomasz', N'Lipa', CAST(N'2021-08-01' AS Date), N'tomaszlipa@gmail.com', N'352562321', 1, CAST(N'2021-09-01' AS Date), N'Senior front-end developer', N'Umowa zlecenie', N'Aplikacje mobilne')
INSERT [dbo].[Pracownicy] ([Id_pracownika], [Imie], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Stanowisko], [Rodzaj_zatrudnienia], [Zespol]) VALUES (15, N'Kamil', N'Ogier', CAST(N'2021-11-01' AS Date), N'kamilogier@gmail.com', N'545364362', 0, NULL, N'Junior front-end developer', N'Pełny etat', N'Aplikacje mobilne')
INSERT [dbo].[Pracownicy] ([Id_pracownika], [Imie], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Stanowisko], [Rodzaj_zatrudnienia], [Zespol]) VALUES (16, N'Kamil', N'Figa', CAST(N'2021-12-03' AS Date), N'kamilfiga@gmail.com', N'437643672', 0, NULL, N'Junior front-end developer', N'Pełny etat', N'Aplikacje desktopowe')
INSERT [dbo].[Pracownicy] ([Id_pracownika], [Imie], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Stanowisko], [Rodzaj_zatrudnienia], [Zespol]) VALUES (17, N'Ola', N'Pajac', CAST(N'2022-01-05' AS Date), N'olapajac@gmail.com', N'883832732', 0, NULL, N'Młodszy programista', N'Pół etatu ', N'Aplikacje desktopowe')
INSERT [dbo].[Pracownicy] ([Id_pracownika], [Imie], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Stanowisko], [Rodzaj_zatrudnienia], [Zespol]) VALUES (18, N'Joanna', N'Puch', CAST(N'2021-11-28' AS Date), N'joannapuch@gmail.com', NULL, 0, NULL, N'Młodszy programista', N'Pół etatu', N'Aplikacje bazodanowe')
INSERT [dbo].[Pracownicy] ([Id_pracownika], [Imie], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Stanowisko], [Rodzaj_zatrudnienia], [Zespol]) VALUES (19, N'Krystyna', N'Pawlak', CAST(N'2021-06-03' AS Date), N'kryspaw@gmail.com', N'764536832', 1, CAST(N'2021-07-01' AS Date), N'Sekretarka', N'Pełny etat', N'Administracja')
INSERT [dbo].[Pracownicy] ([Id_pracownika], [Imie], [Nazwisko], [Data_zatrudnienia], [Email], [Numer_telefonu], [Czy_zwolniony], [Data_zwolnienia], [Stanowisko], [Rodzaj_zatrudnienia], [Zespol]) VALUES (21, N'Tom', N'Levis', CAST(N'2021-06-05' AS Date), N'tomlevis@gmail.com', NULL, 1, CAST(N'2021-12-12' AS Date), N'Senior front-end developer', N'Pełny etat', N'Aplikacje mobilne')
SET IDENTITY_INSERT [dbo].[Pracownicy] OFF
GO
SET IDENTITY_INSERT [dbo].[Zadania] ON 

INSERT [dbo].[Zadania] ([Id_zadania], [Nazwa_zadania], [Przeznaczony_czas], [Opis], [Id_pracownika], [Id_projektu]) VALUES (4, N'Przydzielenie zadań pracownikom', 0, NULL, 1, 2)
INSERT [dbo].[Zadania] ([Id_zadania], [Nazwa_zadania], [Przeznaczony_czas], [Opis], [Id_pracownika], [Id_projektu]) VALUES (5, N'Przygotowanie raportu z poprzedniego tygodnia', 0, NULL, 1, 2)
INSERT [dbo].[Zadania] ([Id_zadania], [Nazwa_zadania], [Przeznaczony_czas], [Opis], [Id_pracownika], [Id_projektu]) VALUES (6, N'Funkcja sumowania koszyka', 0, N'Stworzenie funkcji do sumowania zawartości koszyka', 4, 2)
INSERT [dbo].[Zadania] ([Id_zadania], [Nazwa_zadania], [Przeznaczony_czas], [Opis], [Id_pracownika], [Id_projektu]) VALUES (7, N'Poprawa umieszczenia guzika', 2, N'Poprawa umieszczenia przycisku do wyświetlania koszyka', 4, 2)
SET IDENTITY_INSERT [dbo].[Zadania] OFF
GO
