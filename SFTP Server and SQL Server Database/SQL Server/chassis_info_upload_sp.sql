USE [efoxsfcSGSL10_DEV]
GO
/****** Object:  StoredProcedure [dbo].[chassis_info_upload_sp]    Script Date: 2/28/2023 9:57:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author	  :	Quan Le
-- Create date: 2023-01-01
-- Description:	To upload chassis information to the Central DB
-- =============================================

ALTER PROCEDURE [dbo].[chassis_info_upload_sp]
	-- Add the parameters for the stored procedure here
	@str_input				VARCHAR (300)
AS

DECLARE @transtype			    VARCHAR (100)
DECLARE @file_name			    VARCHAR (100)
DECLARE @chassis_data		    VARCHAR (450)
DECLARE	@site				        VARCHAR (50)
DECLARE	@status				      VARCHAR (50)
DECLARE	@datatype			      VARCHAR (50)
DECLARE	@createby			      VARCHAR (50)
DECLARE	@createdt			      DATETIME
DECLARE	@last_edit_by		    VARCHAR (50)
DECLARE	@last_edit_dt		    DATETIME
DECLARE	@part_number		    VARCHAR (100)
DECLARE	@serial_number		  VARCHAR (100)
DECLARE	@feature_code		    VARCHAR (100)
DECLARE	@material_class		  VARCHAR (100)
DECLARE	@characteristics	  VARCHAR (50)
DECLARE	@component_type		  VARCHAR (50)
DECLARE	@wwn				        VARCHAR (50)
DECLARE	@cust_serial		    VARCHAR (50)
DECLARE	@parent_matnr		    VARCHAR (100)
DECLARE	@parent_sernr		    VARCHAR (100)
DECLARE	@ecb_c				      VARCHAR (50)
DECLARE	@equipment_no		    VARCHAR (50)
DECLARE	@mac_addr_c			    VARCHAR (50)
DECLARE	@service_tag_c		  VARCHAR (50)
DECLARE	@position_type		  VARCHAR (50)
DECLARE	@position_no		    VARCHAR (50)
DECLARE	@cust_part			    VARCHAR (50)
DECLARE	@cust_ecrev			    VARCHAR (50)
DECLARE	@vendor_part		    VARCHAR (50)
DECLARE	@position_required	VARCHAR (50)
DECLARE	@revision			      VARCHAR (50)
DECLARE @intFrom            INT  
DECLARE @intTo              INT  
DECLARE @length					    INT
DECLARE	@prefix				      VARCHAR (50)
DECLARE	@suffix				      VARCHAR (10)

DECLARE @ssh_key			      VARCHAR (250)
DECLARE @key				        VARCHAR (100)
DECLARE @server_token		    VARCHAR (300)

DECLARE @Data_Input table (
	rowid				INT IDENTITY,
	data_fields			VARCHAR(650) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT '',
	PRIMARY KEY (rowid)
)

DECLARE @Data_Return table (
	rowid				INT IDENTITY,
	data_fields			VARCHAR(650) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT '',
	PRIMARY KEY (rowid)
)

BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON

SET @site		      = 'GDL'
SET @datatype	    = 'NORMAL'
SET @createby	    = 'Airflow'
SET @createdt	    = GETDATE()
SET @last_edit_by = 'Airflow'
SET @last_edit_dt = GETDATE()

	-- Process input data into separate data variables
	INSERT INTO @Data_Input(data_fields) SELECT data_fields FROM dbo.string_split_fn('CHASSIS_DATA',@str_input);

	SELECT @transtype	 = data_fields FROM @Data_Input WHERE rowid = 1;
	SELECT @file_name	 = data_fields FROM @Data_Input WHERE rowid = 2;
	SELECT @chassis_data = COALESCE(@chassis_data + ', ', '') + data_fields FROM @Data_Input WHERE rowid > 2
		
	--INSERT INTO @Data_Return(data_fields) SELECT data_fields FROM dbo.string_split_fn('CHASSIS_DATA',@chassis_data);
	--SELECT * FROM @Data_Input
	--SELECT * FROM @Data_Return
	--RETURN 0

	IF @transtype IS NULL
	BEGIN
		RAISERROR 99999 'ERROR: Transaction type can not be NULL.'
		RETURN 100
	END



	IF @transtype='SFTP_SERVER_CONFIG'
	BEGIN

		SET @ssh_key = '';


		-- Encryption: https://8gwifi.org/fernet.jsp#

		SET @key = '';
		SET @server_token = 'gAAAAABj3DwrKTRTLuctRSuI0OG1UKVj8CG_u5lfZZhW-ogdFPboMOWrB_lrzCK-OLrjSFuoVa256FH7N_pPO0qPptA0qzNxwq5F05d3C28PkI-_ZUSPbg4R2Dt1kgNxHUNvDkuxzLPOgyq8vb4PHys2n58OLCgXXwdU20aICTJxePtR8l5zHXc=';

		INSERT INTO @Data_Return(data_fields) VALUES (@ssh_key);
		INSERT INTO @Data_Return(data_fields) VALUES (@key);
		INSERT INTO @Data_Return(data_fields) VALUES (@server_token);

		SELECT * FROM @Data_Return;
		RETURN 0

	END	



	IF @transtype='VALIDATE_FILE'
	BEGIN
	
		SET @file_name = ISNULL(RTRIM(LTRIM(@file_name)), '')
		SET @length = LEN(@file_name)
		
		IF @file_name = '' OR @length = 0
		BEGIN
			INSERT INTO mfwebservicelog WITH (ROWLOCK) VALUES ('chassis_info_upload_test_sp' , '' , '' , '' , @createdt , @last_edit_dt , @createby , @file_name , 'ERROR' , '' , 'No file is available to read.');
			RETURN 100
		END
		
		-- Name of the file
		SET @prefix = SUBSTRING(@file_name, 1, @length-4)
		
		-- Format of the file
		SET @suffix = SUBSTRING(@file_name, @length-2, 3)
		
		IF @suffix <> 'csv'
		BEGIN
			INSERT INTO mfwebservicelog WITH (ROWLOCK) VALUES ('chassis_info_upload_test_sp', '', '' , '' ,  @createdt , @last_edit_dt , @createby , @file_name , 'ERROR' , '' , 'File is in the wrong format.');
			SELECT @file_name AS 'ERROR'
			RETURN 100
		END
	
		SELECT 'OK' as 'RESULT'
		RETURN 0
	
	END	


	IF @transtype = 'SAVE_CHASSIS'
	BEGIN

		INSERT INTO @Data_Return(data_fields) SELECT data_fields FROM dbo.string_split_fn('CHASSIS_DATA',@chassis_data);
		SET @status = 'OK'

		----SELECT @site		  = data_fields FROM @Data_Return WHERE rowid = 1;	
		----SELECT @datatype		  = data_fields FROM @Data_Return WHERE rowid = 3;	
		----SELECT @part_number		  = data_fields FROM @Data_Return WHERE rowid = 8;	
		----SELECT @serial_number	  = data_fields FROM @Data_Return WHERE rowid = 9;	
		----SELECT @feature_code	  = data_fields FROM @Data_Return WHERE rowid = 10;	
		----SELECT @material_class	  = data_fields FROM @Data_Return WHERE rowid = 11;	
		----SELECT @characteristics	  = data_fields FROM @Data_Return WHERE rowid = 12;	
		----SELECT @component_type	  = data_fields FROM @Data_Return WHERE rowid = 13;	
		----SELECT @wwn			  = data_fields FROM @Data_Return WHERE rowid = 14;	
		----SELECT @cust_serial		  = data_fields FROM @Data_Return WHERE rowid = 15;	
		----SELECT @parent_matnr	  = data_fields FROM @Data_Return WHERE rowid = 16;	
		----SELECT @parent_sernr	  = data_fields FROM @Data_Return WHERE rowid = 17;	
		----SELECT @ecb_c		  = data_fields FROM @Data_Return WHERE rowid = 18;	
		----SELECT @equipment_no	  = data_fields FROM @Data_Return WHERE rowid = 19;	
		----SELECT @mac_addr_c		  = data_fields FROM @Data_Return WHERE rowid = 20;	
		----SELECT @service_tag_c	  = data_fields FROM @Data_Return WHERE rowid = 21;	
		----SELECT @position_type	  = data_fields FROM @Data_Return WHERE rowid = 22;	
		----SELECT @position_no		  = data_fields FROM @Data_Return WHERE rowid = 23;	
		----SELECT @cust_part		  = data_fields FROM @Data_Return WHERE rowid = 24;	
		----SELECT @cust_ecrev		  = data_fields FROM @Data_Return WHERE rowid = 25;	
		----SELECT @vendor_part		  = data_fields FROM @Data_Return WHERE rowid = 26;	
		----SELECT @position_required 	  = data_fields FROM @Data_Return WHERE rowid = 27;	
		----SELECT @revision		  = data_fields FROM @Data_Return WHERE rowid = 28;	

		-- SELECT @site AS 'Site' , @status AS 'DataStatus', @datatype AS 'DataType' , @createby AS 'CreateBy' , @createdt AS 'CreateDT' , @last_edit_by AS 'LastEditBy' , @last_edit_dt AS 'LastEditDT' , 
		-- 		@part_number AS 'PART_NUMBER' , @serial_number AS 'SERIAL_NUMBER' , @feature_code AS 'FEATURE_CODE' , @material_class AS 'MATERIAL_CLASS' , @characteristics AS 'CHARACTERISTIC' , 
		-- 		@component_type AS 'COMPONENT_TYPE' , @wwn AS 'WWN' , @cust_serial AS 'CUST_SERIAL' , @parent_matnr AS 'PARENT_MATNR' , @parent_sernr AS 'PARENT_SERNR' , @ecb_c AS 'ECB_C', 
		-- 		@equipment_no AS 'EQUIPMENT_NO' , @mac_addr_c AS 'MAC_ADDR_C' , @service_tag_c AS 'SERVICE_TAG_C' , @position_type AS 'POSITION_TYPE' , @position_no AS 'POSITION_NO' , 
		-- 		@cust_part AS 'CUST_PART' , @cust_ecrev AS 'CUST_ECREV' , @vendor_part AS 'VENDOR_PART' , @position_required AS 'POSITION_REQD' , @revision AS 'REVISION' ;

		--INSERT INTO ZPE_ISTPCOMP WITH (ROWLOCK) 
		--		VALUES (@site , @status , @datatype , USER_NAME() , GETDATE() , USER_NAME() , GETDATE() , 
		--		@part_number , @serial_number , @feature_code , @material_class , @characteristics , @component_type , 
		--		@wwn , @cust_serial , @parent_matnr , @parent_sernr , @ecb_c , @equipment_no , @mac_addr_c , @service_tag_c , 
		--		@position_type , @position_no , @cust_part , @cust_ecrev , @vendor_part , @position_required , @revision);



		SELECT @serial_number = data_fields FROM @Data_Return WHERE rowid = 1;
		SELECT @part_number	  = data_fields FROM @Data_Return WHERE rowid = 2;
		SELECT @parent_matnr  = data_fields FROM @Data_Return WHERE rowid = 3;
		SELECT @parent_sernr  = data_fields FROM @Data_Return WHERE rowid = 4;

		----INSERT INTO ZPE_ISTPCOMP_TEST (DataStatus , CreateBy , CreateDT , LastEditBy , LastEditDT , PART_NUMBER , SERIAL_NUMBER , PARENT_MATNR , PARENT_SERNR)
		----				  VALUES (@status , @createby , @createdt , @last_edit_by , @last_edit_dt , @part_number , @serial_number , @parent_matnr , @parent_sernr);
		----INSERT INTO mfwebservicelog WITH (ROWLOCK) VALUES ('chassis_info_upload_test_sp', @serial_number, @part_number , @file_name ,  @createdt , @last_edit_dt , @createby , '' , 'P' , '' , '');

		EXEC sfcIstpXMLDataDetailEdit 'INSERT', @site , @datatype , @part_number , @serial_number , '' , '' , '' , '' , '' , '' ,
									  @parent_matnr , @parent_sernr , '' , '' , '' , '' , '' , '' , '' , '' , '' , '' , '' , '' , ''

		INSERT INTO mfwebservicelog WITH (ROWLOCK) VALUES ('sfcIstpXMLDataDetailEdit', @serial_number, @part_number , @file_name ,  @createdt , @last_edit_dt , @createby , '' , 'P' , '' , '');



		----EXEC dbo.sfcIstpXMLDataDetailEdit 'INSERT' , @site , @datatype , @part_number , @serial_number , @feature_code , @material_class , @characteristics , 
		----								@component_type , @wwn , @cust_serial , @parent_matnr , @parent_sernr , @ecb_c , @equipment_no , @mac_addr_c , @service_tag_c,
		----								@position_type , @position_no , @cust_part , @cust_ecrev , @vendor_part , @position_required, @revision
		----INSERT INTO mfwebservicelog WITH (ROWLOCK) VALUES ('sfcIstpXMLDataDetailEdit', @serial_number, @part_number , @file_name ,  @createdt , @last_edit_dt , @createby , '' , 'P' , '' , '');

		RETURN 0
	END


	IF @transtype = 'SAVE_LOG'
	BEGIN
		INSERT INTO mfwebservicelog WITH (ROWLOCK) VALUES ('chassis_info_upload_test_sp' , '' , '' , '' ,  @createdt , @last_edit_dt , @createby , @file_name , @chassis_data , '' , '');
		RETURN 0
	END

ELSE
	BEGIN        
		RAISERROR 99996 'ERROR:  The transaction type that was passed in is UNKNOWN.'        
		RETURN 100
	END
END

SET NOCOUNT OFF
RETURN 0
