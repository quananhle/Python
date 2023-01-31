import pyodbc as pdb
import paramiko
from base64 import decodebytes
import pysftp

#=== LOCAL IMPORTS
from datalayer import *
from sftp_connection import *
from databases import *


class Job:
	def process_chassis(self):

		# SFTP object
		keydata = databases.SECRET_HOST_KEY
		key = paramiko.RSAKey(data=decodebytes(keydata))
		cnopts = pysftp.CnOpts()
		cnopts.hostkeys.add(databases.sftp_server["Hostname"], 'ssh-rsa', key)
		sftp_obj = SFTPConnection(sftp_server["Hostname"], sftp_server["Username"], sftp_server["Password"], cnopts)

		# PRD DB object
		db_obj = JobDataLayer()
		db_conn = db_obj.connect()

		# Central DB object
		central_db_conn = pdb.connect(central_db_conn_str)
		central_db_cursor = central_db_conn.cursor()

		file_set = set()
		ptype = 'SQL_SERVER_STR'


		# Get control values
		path_to_download = db_obj.get_control_values(db_conn, ('CHASSIS_CENTRAL_DB_TEST_UPLOAD' , ''))
		path_to_read 	 = db_obj.get_control_values(db_conn, ('CHASSIS_CENTRAL_DB_TEST_IN' , ''))
		path_to_write 	 = db_obj.get_control_values(db_conn, ('CHASSIS_CENTRAL_DB_TEST_OUT' , ''))
		stored_procedure = db_obj.get_control_values(db_conn, ('CHASSIS_UPLOAD_SP' , ''))
		valid_transtype  = db_obj.get_control_values(db_conn, ('CHASSIS_UPLOAD_SP_VALIDATE_TRANSTYPE' , ''))
		save_transtype 	 = db_obj.get_control_values(db_conn, ('CHASSIS_UPLOAD_SP_DATA_TRANSTYPE' , ''))
		log_transtype 	 = db_obj.get_control_values(db_conn, ('CHASSIS_UPLOAD_SP_LOG_TRANSTYPE' , ''))


		try:
			sftp_obj.connect()
			# Get files in the CHASSIS_UPLOAD directory
			files = sftp_obj.get_file(path_to_download)

			# Validate directory and files
			for file in files:
				valid_params = db_obj.setparams(ptype, [valid_transtype, file])
				sp_result = db_conn.execute( stored_procedure , (valid_params) )
				
				# If file is valid, add file to the file set for later processing
				if sp_result:
					rows = sp_result.fetchall()
					for row in rows:
						message = row[0].split(',')[0].strip()
						if message != file:
							file_set.add(file)

				db_conn.commit()


			for file in file_set:
				# Move files to the CHASSIS_IN directory
				sftp_obj.connection.rename(file, path_to_read + file)


			# Get files
			files = sftp_obj.get_file(path_to_read)


			# Read files
			for file in files:
				try:
					with sftp_obj.connection.open(file, "r+") as remote_file:
						for line in remote_file:
							# Ignore empty spaces
							if not line.isspace():
								# Trim leading spaces, trailing spaces
								data = line.strip()
								# If not empty line, join all fields into 1 single parameter
								value_fields = ''.join(map(str, data))
								# Remove single quotes in the parameter
								parameter = value_fields.replace("'", "")

								save_params = db_obj.setparams(ptype, [save_transtype, file, parameter])
								sp_result = db_conn.execute( stored_procedure , (save_params) )
								db_conn.commit()

						remote_file.close()

				except(Exception) as r:
					error = str(r)
					log_params = db_obj.setparams(ptype, [log_transtype, file, error])
					sp_result = db_conn.execute( stored_procedure , (log_params) )
					db_conn.commit()


			for file in files:
				# Move files to CHASSIS_OUT directory
				sftp_obj.connection.rename(file, path_to_write + file)
				

			sftp_obj.disconnect()


		except(Exception) as r:
			error = str(r)
			log_params = db_obj.setparams(ptype, [log_transtype, file, error])
			sp_result = db_conn.execute( stored_procedure , (log_params) )
			db_conn.commit()

#=================================================================================#


chassis_obj = Job()
chassis_obj.process_chassis()

