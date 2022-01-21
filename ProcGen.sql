USE [Firma]
GO
/****** Object:  StoredProcedure [dbo].[ProcIdKlienci]    Script Date: 21.01.2022 13:25:32 ******/
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
/****** Object:  StoredProcedure [dbo].[ProcIdMiejsca]    Script Date: 21.01.2022 13:25:32 ******/
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
/****** Object:  StoredProcedure [dbo].[ProcIdPracownicy]    Script Date: 21.01.2022 13:25:32 ******/
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
      ,[Imi獧
      ,[Nazwisko]
      ,[Data_zatrudnienia]
      ,[Email]
      ,[Numer_telefonu]
      ,[Czy_zwolniony]
      ,[Data_zwolnienia]
      ,[Rodzaje_zatrudnienia_Id]
      ,[Stanowiska_Id]
      ,[Zespo造_Id]
	FROM [Firma].[dbo].[Pracownicy]
	WHERE Id_prac = @Id
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcIdProjekty]    Script Date: 21.01.2022 13:25:32 ******/
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
/****** Object:  StoredProcedure [dbo].[ProcIdRodzaje Zatrudnienia]    Script Date: 21.01.2022 13:25:32 ******/
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
/****** Object:  StoredProcedure [dbo].[ProcIdSprz皻y]    Script Date: 21.01.2022 13:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcIdSprz皻y]     
	@Id AS int
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT *
		FROM [Firma].[dbo].[Sprz皻y]
		WHERE Id = @Id
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcIdStanowiska]    Script Date: 21.01.2022 13:25:32 ******/
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
/****** Object:  StoredProcedure [dbo].[ProcIdWpisy Pracy]    Script Date: 21.01.2022 13:25:32 ******/
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
/****** Object:  StoredProcedure [dbo].[ProcIdZadania]    Script Date: 21.01.2022 13:25:32 ******/
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
/****** Object:  StoredProcedure [dbo].[ProcIdZespo造]    Script Date: 21.01.2022 13:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcIdZespo造]     
	@Id AS int
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT *
		FROM [Firma].[dbo].[Zespo造]
		WHERE Id = @Id
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcKlienci]    Script Date: 21.01.2022 13:25:32 ******/
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
/****** Object:  StoredProcedure [dbo].[ProcMiejsca]    Script Date: 21.01.2022 13:25:32 ******/
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
/****** Object:  StoredProcedure [dbo].[ProcPracownicy]    Script Date: 21.01.2022 13:25:32 ******/
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
      ,[Imi獧
      ,[Nazwisko]
      ,[Data_zatrudnienia]
      ,[Email]
      ,[Numer_telefonu]
      ,[Czy_zwolniony]
      ,[Data_zwolnienia]
      ,[Rodzaje_zatrudnienia_Id]
      ,[Stanowiska_Id]
      ,[Zespo造_Id]
  FROM [Firma].[dbo].[Pracownicy]
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcProjekty]    Script Date: 21.01.2022 13:25:32 ******/
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
/****** Object:  StoredProcedure [dbo].[ProcRodzaje Zatrudnienia]    Script Date: 21.01.2022 13:25:32 ******/
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
/****** Object:  StoredProcedure [dbo].[ProcSprz皻y]    Script Date: 21.01.2022 13:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcSprz皻y]     
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT *
		FROM [Firma].[dbo].[Sprz皻y]
	COMMIT TRANSACTION
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[ProcStanowiska]    Script Date: 21.01.2022 13:25:32 ******/
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
/****** Object:  StoredProcedure [dbo].[ProcWpisy Pracy]    Script Date: 21.01.2022 13:25:32 ******/
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
/****** Object:  StoredProcedure [dbo].[ProcZadania]    Script Date: 21.01.2022 13:25:32 ******/
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
/****** Object:  StoredProcedure [dbo].[ProcZespo造]    Script Date: 21.01.2022 13:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProcZespo造]     
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRANSACTION
		SELECT *
		FROM [Firma].[dbo].[Zespo造]
	COMMIT TRANSACTION
	RETURN
END
GO
