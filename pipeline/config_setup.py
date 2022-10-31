from os import system

def get_file(file):
	if not file == "":
		return file

def os_exec(command, mode):
	if not command == "":
		if mode == "ps":
			system(f"powershell -command {command}")
		elif mode == "default":
			system(command)

def write_to_file(_file, content, mode):
	if not _file is None or not _file == "":
		with open(get_file(_file), mode) as f:
			f.write(content)

def start_setup():
	default_config_path = "config"
	os_exec("mkdir config", "ps")
	os_exec("ni config/set_compile.txt", "ps")
	os_exec("ni config/set_get_started.txt", "ps")
	os_exec("ni config/cursor.txt", "ps")
	write_to_file(f"{default_config_path}/set_compile.txt", "True", "w")
	write_to_file(f"{default_config_path}/set_get_started.txt", "True", "w")
	write_to_file(f"{default_config_path}/cursor.txt", "$", "w")
	os_exec("clear", "ps")
	print("Finished setting up.")

start_setup()