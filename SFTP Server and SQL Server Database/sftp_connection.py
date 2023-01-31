import pysftp
import os

class SFTPConnection:
	def __init__(self, hostname, username, password, cnopts, port=22):
		"""Constructor Method"""
		# Set connection object to None (initial value)
		self.connection = None
		self.hostname = hostname
		self.username = username
		self.password = password
		self.cnopts = cnopts
		self.port = port
	
	def connect(self):
		"""Connects to the sftp server and returns the sftp connection object"""

		try:
			# Get the sftp connection object
			self.connection = pysftp.Connection(
				host=self.hostname,
				username=self.username,
				password=self.password,
				cnopts=self.cnopts,
				port=self.port
			)
		except Exception as err:
			raise Exception(err)
		print(f"Connected to {self.hostname} as {self.username}.")

	def disconnect(self):
		"""Closes the sftp connection"""
		self.connection.close()
		print(f"Disconnected from host {self.hostname}")

	def listdir(self, remote_path):
		"""lists all the files and directories in the specified path and returns them"""
		for obj in self.connection.listdir(remote_path):
			yield obj

	def listdir_attr(self, remote_path):
		"""lists all the files and directories (with their attributes) in the specified path and returns them"""
		for attr in self.connection.listdir_attr(remote_path):
			yield attr

	def download(self, remote_path, target_local_path):
		"""
		Downloads the file from remote sftp server to local.
		Also, by default extracts the file to the specified target_local_path
		"""

		try:
			print(
				f"downloading from {self.hostname} as {self.username} [(remote path : {remote_path});(local path: {target_local_path})]"
			)

			# Create the target directory if it does not exist
			path, _ = os.path.split(target_local_path)
			if not os.path.isdir(path):
				try:
					os.makedirs(path)
				except Exception as err:
					raise Exception(err)

			# Download from remote sftp server to local
			self.connection.get(remote_path, target_local_path)
			print("download completed")

		except Exception as err:
			raise Exception(err)

	def upload(self, source_local_path, remote_path):
		"""
		Uploads the source files from local to the sftp server.
		"""
		try:
			print(
				f"uploading to {self.hostname} as {self.username} [(remote path: {remote_path});(source local path: {source_local_path})]"
			)

			# Download file from SFTP
			self.connection.put(source_local_path, remote_path)
			print("upload completed")

		except Exception as err:
			raise Exception(err)
		
	def get_file(self, path):
		self.connection.cwd(path)
		files = self.connection.listdir()
		return files

