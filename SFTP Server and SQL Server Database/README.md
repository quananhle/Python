# Update Chassis Info to Central Database

## Process Flow

![21 drawio](https://user-images.githubusercontent.com/35042430/224184756-f7e524ef-4f8e-43c9-b9e7-43d7fc7015c4.png)

## Low Level Design:

1. __STX Wuxi__

	a. FTP/SFTP access to SFTP Server ```10.12.134.46```

	b. Go to the directory ```CHASSIS_UPLOAD```

	c. Upload file in ```.csv``` format

2.	__GDL__

	a. Schedule/Run `Airflow DAGs`

	b. `Airflow` scheduler triggers the task instances and calls `CIMS App API` in `10.12.134.68`

	c. `CIMS App` is getting called and run its methods:

	i. Execute database function ```fn_GetLuNamebyValue``` to get control values from ```10.12.134.40```:
	
	```Python
	def run_mqsql_function(self, conn, function, params):
		results = None
		try:
			cursor = conn.cursor()
			if len(function) == 0:
				raise Exception('Missing data layer name element')
			if len(params) == 0:
				raise Exception('Missing data layer elements')
			query = f"SELECT {function}"
			# print(query , params)
			cursor.execute(query , params)
			results = cursor.fetchall()
			cursor.close()
			return results

		except Exception as inst:
			self.fn_error = str(inst)
			return str(inst)
			
	def get_control_values(self, db_conn, params):
		try:
			results = self.run_mqsql_function(db_conn, "dbo.fn_GetLuValue (?,?)" , params)
			for result in results:
				res = result[0]

		except Exception as inst:
			self.sp_error = str(inst)
			return

		return res
	```

	```Python
	path_to_download = db_obj.get_control_values(db_conn, ('CHASSIS_CENTRAL_DB_UPLOAD' , ''))		# /CHASSIS_UPLOAD/	
	path_to_read 	 = db_obj.get_control_values(db_conn, ('CHASSIS_CENTRAL_DB_IN' , ''))			# /CHASSIS_IN/
	path_to_write 	 = db_obj.get_control_values(db_conn, ('CHASSIS_CENTRAL_DB_OUT' , ''))			# /CHASSIS_OUT/
	path_to_fail 	 = db_obj.get_control_values(db_conn, ('CHASSIS_CENTRAL_DB_FAIL' , ''))			# /CHASISS_FAIL/
	stored_procedure = db_obj.get_control_values(db_conn, ('CHASSIS_UPLOAD_SP' , ''))			# Exec [dbo].[chassis_info_upload_sp] ?	
	server_transtype = db_obj.get_control_values(db_conn, ('CHASSIS_UPLOAD_SFTP_SERVER_TRANSTYPE' , ''))	# SFTP_SERVER_CONFIG	
	valid_transtype  = db_obj.get_control_values(db_conn, ('CHASSIS_UPLOAD_SP_VALIDATE_TRANSTYPE' , ''))	# SAVE_CHASSIS	
	save_transtype 	 = db_obj.get_control_values(db_conn, ('CHASSIS_UPLOAD_SP_DATA_TRANSTYPE' , ''))	# SAVE_LOG
	log_transtype 	 = db_obj.get_control_values(db_conn, ('CHASSIS_UPLOAD_SP_LOG_TRANSTYPE' , ''))		# VALIDATE_FILE	
	```


	  ii.	Execute the stored procedure with transtype ```SFTP_SERVER_CONFIG``` to get the token and keys, decrypt in the backend and connect to SFTP server ```10.12.134.46```
	  
	```SQL
	-- Process input data into separate data variables
	INSERT INTO @Data_Input(data_fields) SELECT data_fields FROM dbo.string_split_fn('CHASSIS_DATA',@str_input);

	SELECT @transtype	 = data_fields FROM @Data_Input WHERE rowid = 1;
	SELECT @file_name	 = data_fields FROM @Data_Input WHERE rowid = 2;
	SELECT @chassis_data 	 = COALESCE(@chassis_data + ', ', '') + data_fields FROM @Data_Input WHERE rowid > 2
	```

	```Python
	# SFTP object
	try:
		# PRD DB object
		db_obj = JobDataLayer()
		db_conn = db_obj.connect()

		sftp_params = db_obj.setparams(ptype, [server_transtype])
		sp_result = db_conn.execute( stored_procedure , (sftp_params) )		# Exec [dbo].[chassis_info_upload_sp] 'SFTP_SERVER_CONFIG'

		if sp_result:
			rows = sp_result.fetchall()
			ssh_key, key, server_token = rows[0][1], rows[1][1], rows[2][1]
			hostname, username, password, cnopts = db_obj.get_sftp_server_config(ssh_key, key, server_token)

			srv_obj = SFTPConnection(hostname=hostname, username=username, password=password, cnopts=cnopts)

	except (Exception) as error:

		log_params = db_obj.setparams(ptype, [log_transtype, 'EXCEPTION', error])
		sp_result = db_conn.execute( stored_procedure , (log_params) )		# Exec [dbo].[chassis_info_upload_sp] 'SAVE_LOG'
		db_conn.commit()
	```
      
	```SQL
		IF @transtype='SFTP_SERVER_CONFIG'
		BEGIN

			SET @ssh_key = 'AAAAB3NzaC1yc2EAAAABIwAAAIEAtaxE8kCbv5mp4X8XZgL/ue9neejVHTHw8JaMpIlrEmhO1NwLLO8wlxjvsvb0nl3l0zw/pBJ0lXJFWrCuvWwnxZNUjwi7ukpMdVL0T/pvG085gt8YcqkIXMwEfIA3Zsqd0rQiFpQBqF/tHLkSV3IS872Dz+kLRMiIBhwcPPbp8zU=';

			-- '{"Hostname":"10.12.134.46", "Username":"sgtpatp", "Password":"s34g4t3"}'
			-- Encryption: https://8gwifi.org/fernet.jsp#

			SET @key = '8ORF30nfYwGE0dDOR6gxlA21vvcRAyufhcyqBGKYdqk=';
			SET @server_token = 'gAAAAABj3DwrKTRTLuctRSuI0OG1UKVj8CG_u5lfZZhW-ogdFPboMOWrB_lrzCK-OLrjSFuoVa256FH7N_pPO0qPptA0qzNxwq5F05d3C28PkI-_ZUSPbg4R2Dt1kgNxHUNvDkuxzLPOgyq8vb4PHys2n58OLCgXXwdU20aICTJxePtR8l5zHXc=';

			INSERT INTO @Data_Return(data_fields) VALUES (@ssh_key);
			INSERT INTO @Data_Return(data_fields) VALUES (@key);
			INSERT INTO @Data_Return(data_fields) VALUES (@server_token);

			SELECT * FROM @Data_Return;
			RETURN 0

		END	
	```

	```Python
	def fernet_decrypt(self, token, key):
		fernet = Fernet(bytes(key, 'utf-8'))
		values = json.loads(fernet.decrypt(bytes(token, 'utf-8')).decode())
		return values

	def get_hostkey(self, host_name, host_key):
		keydata = bytes(host_key, 'utf-8')
		key = paramiko.RSAKey(data=decodebytes(keydata))
		cnopts = pysftp.CnOpts()
		cnopts.hostkeys.add(host_name, 'ssh-rsa', key)
		return cnopts

	def get_sftp_server_config(self, host_key, fernet_key, server_token):
		server_config = self.fernet_decrypt(server_token, fernet_key)
		hostname, username, password = server_config["Hostname"], server_config["Username"], server_config["Password"]
		cnopts = self.get_hostkey(hostname, host_key)
		return (hostname, username, password, cnopts)
	```

	```SQL
	IF @transtype = 'SAVE_LOG'
	BEGIN
		INSERT INTO mfwebservicelog WITH (ROWLOCK) VALUES ('chassis_info_upload_sp' , '' , '' , '' ,  @createdt , @last_edit_dt , @createby , @file_name , @chassis_data , '' , '');
		RETURN 0
	END
	```
	
	  iii. Using the control values, call ```FTP/SFTP``` access method to access to ```10.12.134.46``` and go to directory ```/CHASSIS_UPLOAD/```
	  
	```Python
	try:
		# PRD DB object
		db_obj = JobDataLayer()
		db_conn = db_obj.connect()

		srv_obj.connect()

		# # Get files in the CHASSIS_UPLOAD directory
		files = srv_obj.get_file(path_to_download)
	```
      
	  iv.	Loop through every file in the directory:
      
	- Execute stored procedure ```chassis_info_upload_sp``` with transtype ```VALIDATE_FILE``` to validate file

	- If file is in correct format: add to file set

	- If file is not in correct format: save log, move to file to ```/CHASSIS_FAIL/```, and check the next file

	- If there is no more file in ```/CHASSIS_UPLOAD/```: end the task


	```Python
	# Validate directory and files
	for file in files:
		valid_params = db_obj.setparams(ptype, [valid_transtype, file])
		sp_result = db_conn.execute( stored_procedure , (valid_params) )				# Exec [dbo].[chassis_info_upload_sp] 'VALIDATE_FILE'

		# If file is valid, add file to the file set for later processing
		if sp_result:
			rows = sp_result.fetchall()
			for row in rows:
				message = row[0].split(',')[0].strip()

				if message != file:
					file_set.add(file)

				# If file is invalid, save log and move file to Chassis Fail
				if message == file:
					log_params = db_obj.setparams(ptype, [log_transtype, file, message])
					sp_result = db_conn.execute( stored_procedure , (log_params) )		# Exec [dbo].[chassis_info_upload_sp] 'SAVE_LOG'
					db_conn.commit()

					srv_obj.connection.rename(file, path_to_fail + file)			# /CHASISS_FAIL/

		db_conn.commit()
	```
	
	```SQL
	IF @transtype='VALIDATE_FILE'
	BEGIN

		SET @file_name = ISNULL(RTRIM(LTRIM(@file_name)), '')
		SET @length = LEN(@file_name)

		IF @file_name = '' OR @length = 0
		BEGIN
			INSERT INTO mfwebservicelog WITH (ROWLOCK) VALUES ('chassis_info_upload_sp' , '' , '' , '' , @createdt , @last_edit_dt , @createby , @file_name , 'ERROR' , '' , 'No file is available to read.');
			RETURN 100
		END

		-- Name of the file
		SET @prefix = SUBSTRING(@file_name, 1, @length-4)

		-- Format of the file
		SET @suffix = SUBSTRING(@file_name, @length-2, 3)

		IF @suffix <> 'csv'
		BEGIN
			INSERT INTO mfwebservicelog WITH (ROWLOCK) VALUES ('chassis_info_upload_sp', '', '' , '' ,  @createdt , @last_edit_dt , @createby , @file_name , 'ERROR' , '' , 'File is in the wrong format.');
			SELECT @file_name AS 'ERROR'
			RETURN 100
		END

		SELECT 'OK' as 'RESULT'
		RETURN 0

	END	
	```
	
      v. Method to process file is called:
      
	- Move file to ```/CHASSIS_IN/```

	```Python
	for file in file_set:
		# Move files to the CHASSIS_IN directory
		srv_obj.connection.rename(file, path_to_read + file)						# /CHASSIS_IN/
	```
	
		- Loop until there is no values left in the file:
		- Read file by lines and split instaces by delimiters
		- Parse the value as the parameter of stored procedure ```chassis_info_upload_sp``` and execute the SP with transtype ```SAVE_CHASSIS```

	```Python
	# Get files
	srv_obj.connection.cwd(path_to_read)
	files = srv_obj.connection.listdir()

	# Read files
	for file in files:
		try:
			with srv_obj.connection.open(file, "r") as remote_file:
				# Skip the header
				next(remote_file)
				for line in remote_file:
					# Ignore empty spaces
					if not line.isspace():
						# Trim leading spaces, trailing spaces
						data = line.strip()
						# If not empty line, join all fields into 1 single string
						value_fields = ''.join(map(str, data))
						# Remove double quotes in the parameter
						parameter = value_fields.replace("\"", "")


						save_params = db_obj.setparams(ptype, [save_transtype, file, parameter])
						sp_result = db_conn.execute( stored_procedure , (save_params) )		# Exec [dbo].[chassis_info_upload_sp] 'SAVE_CHASSIS
						db_conn.commit()

				remote_file.close()
	```
	
	```SQL
	IF @transtype = 'SAVE_CHASSIS'
	BEGIN

		INSERT INTO @Data_Return(data_fields) SELECT data_fields FROM dbo.string_split_fn('CHASSIS_DATA',@chassis_data);
		SET @status = 'OK'

		SELECT @serial_number = data_fields FROM @Data_Return WHERE rowid = 1;
		SELECT @part_number   = data_fields FROM @Data_Return WHERE rowid = 2;
		SELECT @parent_matnr  = data_fields FROM @Data_Return WHERE rowid = 3;
		SELECT @parent_sernr  = data_fields FROM @Data_Return WHERE rowid = 4;

		EXEC sfcIstpXMLDataDetailEdit 'INSERT', @site , @datatype , @part_number , @serial_number , '' , '' , '' , '' , '' , '' ,
									  @parent_matnr , @parent_sernr , '' , '' , '' , '' , '' , '' , '' , '' , '' , '' , '' , '' , ''

		INSERT INTO mfwebservicelog WITH (ROWLOCK) VALUES ('sfcIstpXMLDataDetailEdit', @serial_number, @part_number , @file_name ,  @createdt , @last_edit_dt , @createby , '' , 'P' , '' , '');


		RETURN 0
	END
	```

	- If there  is no values to read in the file, move the file to ```/CHASSIS_OUT/```

	```Python
	for file in files:
		# Move files to CHASSIS_OUT directory
		srv_obj.connection.rename(file, path_to_write + file)


	srv_obj.disconnect()
	```
