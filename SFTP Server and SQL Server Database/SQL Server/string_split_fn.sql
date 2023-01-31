-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author	  :	Quan Le
-- Create date: 2023-01-30
-- Description:	To split input string into data table
-- =============================================
CREATE FUNCTION [dbo].[string_split_fn] (
	@transtype		VARCHAR(100),
	-- Add the parameters for the function here
	@list			VARCHAR(500)
)
RETURNS  
@ParsedList table (
	rowid				INT IDENTITY,
	data_fields			VARCHAR(100) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT '',
	PRIMARY KEY (rowid)
)
AS
    BEGIN
    DECLARE @data_fields varchar(100), @Pos int

	SET @list = LTRIM(RTRIM(@list))+ ','
	SET @Pos = CHARINDEX(',', @list, 1)

	IF REPLACE(@list, ',', '') <> ''
	BEGIN
		WHILE @Pos > 0
		BEGIN
			SET @data_fields = LTRIM(RTRIM(LEFT(@list, @Pos - 1)))

			IF @transtype = 'CHASSIS_DATA'
			BEGIN
				--IF @data_fields <> ''
				--BEGIN
				--	INSERT INTO @ParsedList (data_fields) VALUES (CAST(@data_fields AS VARCHAR))
				--END
				INSERT INTO @ParsedList (data_fields) VALUES (CAST(@data_fields AS VARCHAR)) --Use Appropriate conversion
			END

			SET @list = RIGHT(@list, LEN(@list) - @Pos)
			SET @Pos = CHARINDEX(',', @list, 1)

		END
	END 
	ELSE
	BEGIN
		INSERT INTO @ParsedList (data_fields) VALUES ('EMPTY INPUT') --Use Appropriate conversion
	END
RETURN
END
