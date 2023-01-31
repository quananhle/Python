# Check connections
import pyodbc as pdb
import databases
import json


class JobDataLayer():
	def __init__(self):
		self.sp_error = None
		self.fn_error = None

	def connect(self):
		err_result = None
		try:
			print (databases.conn_str)
			db_connected = pdb.connect(databases.conn_str)
		except Exception as error:
			err_result = str(error)
			print(err_result)
		finally:
			return db_connected		

	def run_function(self, conn, function, params):
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
	
	def run_stored_procedure(self, conn, stored_procedure, params):
		value = None
		cursor = conn.cursor()
		
		try:
			if len(stored_procedure) == 0:
				raise Exception('Missing data layer name element')
			if len(params) == 0:
				raise Exception('Missing data layer elements')
			# query = f"EXEC {stored_procedure} {params}"
			# print(query)
			cursor.execute( stored_procedure , params )
			rows = cursor.fetchall()
			for row in rows:
				value = row[0]
			conn.commit()
			return value

		except Exception as inst:
			self.sp_error = str(inst)
			return self.sp_error
		
	def get_control_values(self, db_conn, params):
		# for result in self.run_function(db_conn, function, params): return result[0]
		try:
			results = self.run_function(db_conn, "dbo.fn_GetLuValue (?,?)" , params)
			for result in results:
				res = result[0]

		except Exception as inst:
			self.sp_error = str(inst)
			return

		return res
	
	def setparams(self, ptype, params):
		value = None

		if len(params) == 0:
			return value

		if ptype == 'JSON':
			value = f'{json.dumps([params])}'
		if ptype == 'STR':
			value = ','.join([f"'{str(item)}'" for item in params])
		if ptype == 'SQL_SERVER_STR':
			value = ','.join(item for item in params)

		return value
