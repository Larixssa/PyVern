import os
from os import path
from platform import system

def get_file(file):
	if not file == "":
		return file

def os_exec(command, mode):
	sys_name = system()
	if not command == "":
		if sys_name == "Windows":
			if mode == "ps":
				os.system(f"powershell -command {command}")
			elif mode == "default":
				os.system(command)
		elif sys_name == "Linux":
			if mode == "default":
				os.system(command)

def write_to_file(_file, content, mode):
	if not _file is None or not _file == "":
		with open(get_file(_file), mode) as f:
			f.write(content)

def start_setup():
	default_config_path = "config"

	required_files = [
		"set_compile.txt",
		"set_get_started.txt",
		"cursor.txt",
		"username.txt",
		"userid.txt"
	]

	if system() == "Windows":
		os_exec("clear", "ps")
	elif system() == "Linux":
		os_exec("clear", "default")

	if system() == "Windows":
		os_exec("mkdir config", "ps")
	elif system() == "Linux":
		os_exec("mkdir config", "default")

	""" Old Method
	if system() == "Windows":
		os_exec("ni config/set_compile.txt", "ps")
		os_exec("ni config/set_get_started.txt", "ps")
		os_exec("ni config/cursor.txt", "ps")
	elif system() == "Linux":
		os_exec("touch config/set_compile.txt", "default")
		os_exec("touch config/set_get_started.txt", "default")
		os_exec("touch config/cursor.txt", "default")
	"""

	for i in range(0, len(required_files)):
		if system() == "Windows":
			os_exec(f"ni {default_config_path}/{required_files[i]}", "ps")
		elif system() == "Linux":
			os_exec(f"touch {default_config_path}/{required_files[i]}", "default")

	write_to_file(f"{default_config_path}/set_compile.txt", "True", "w")
	write_to_file(f"{default_config_path}/set_get_started.txt", "True", "w")
	write_to_file(f"{default_config_path}/cursor.txt", "$", "w")
	if system() == "Windows":
		os_exec("clear", "ps")
	elif system() == "Linux":
		os_exec("clear", "default")

start_setup()