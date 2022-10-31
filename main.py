from os import system, path
from platform import python_version
from random import randint
import time
import datetime
import webbrowser








# -----------------<  Text Utilities  >----------------- #

# Text Colors
RED = "\033[0;31m"
ORANGE = "\033[0;38m"
GREEN = "\033[0;32m"
YELLOW = "\033[1;33m"
CYAN = "\033[0;36m"
LIGHT_CYAN = "\033[1;36m"
PURPLE = "\033[0;35m"
LIGHT_PURPLE = "\033[1;35m"
LIGHT_WHITE = "\033[1;37m"
DARK_GRAY = "\033[1;30m"
LIGHT_GREEN = "\033[1;32m"
LIGHT_GRAY = "\033[0;37m"
BLUE = "\033[0;34m"
LIGHT_BLUE = "\033[1;34m"

# Styles
BOLD = "\033[1m"
ITALIC = "\033[3m"
UNDERLINE = "\033[4m"
CROSSED = "\033[9m"
END = "\033[0m"

# Message Prefixes
WARN = f"{ORANGE}WARNING{END}"
ERROR = f"{RED}ERROR{END}"
SUCCESS = f"{GREEN}SUCCESS{END}"








# -----------------<  General functions  >------------------ #

def get_file(file):
	if not file == "":
		return file

def generate_credits():
	cred = f"\n{CYAN}By: {get_credits()} - Version: {get_version()}{END}"
	print(cred)

def generate_title():
	title = f"""{PURPLE}{BOLD}
┌─┐ ┬ ┬┬  ┬┌─┐┬─┐┌┐┌
│─┼┐└┬┘└┐┌┘├┤ ├┬┘│││
└─┘└ ┴  └┘ └─┘┴└─┘└┘
	{END}"""
	print(title, end="")
	print(f"\n{create_bar('-', 65)}")

def init(gen_title, gen_creds, clear_screen, gen_get_started):

	logging(get_file("logs/logfile.txt"), "Client Loaded.")

	if clear_screen == True:
		os_exec("clear", "ps")

	if gen_title == True:
		generate_title()

	if gen_creds == True:
		generate_credits()

	if gen_get_started == True or gen_get_started == "True":
		get_started()

	print(f"\n{YELLOW}{get_cursor('cursor')}{END}", end="")
	prompt = input()
	parse_cmd(prompt.lower())

def init_log_files():
	os_exec("mkdir logs", "ps")
	os_exec("ni logs/logfile.txt", "ps")

def load_state(wait_time_a, wait_time_b, _compile):
	loading_files = []
	if _compile == True:
		init_log_files()
		os_exec("clear", "ps")
		print(f"{BLUE}[ Compiling QyVern - {get_version()} ]{END}")

		add_fake_loading_path("display.create_bar", loading_files)
		add_fake_loading_path("display.get_version", loading_files)
		add_fake_loading_path("display.get_credits", loading_files)
		add_fake_loading_path("display.get_cursor", loading_files)
		add_fake_loading_path("states.loading", loading_files)
		add_fake_loading_path("logging.console_display", loading_files)
		add_fake_loading_path("logging.logging_std", loading_files)
		add_fake_loading_path("misc.newline", loading_files)
		add_fake_loading_path("misc.chk_cmd", loading_files)
		add_fake_loading_path("misc.repo_desc", loading_files)
		add_fake_loading_path("misc.get_help", loading_files)
		add_fake_loading_path("misc.get_time", loading_files)
		add_fake_loading_path("parser.cmd_parse", loading_files)
		add_fake_loading_path("parser.os_exec", loading_files)
		add_fake_loading_path("parser.command_parser", loading_files)

		for i in range(0, len(loading_files)):
			console_display(f"Compiling {loading_files[i]}...")
			logging(get_file("logs/logfile.txt"), f"Compiling file > {loading_files[i]}")
			wait(randint(wait_time_a, wait_time_b))

		write_to_file("config/set_compile.txt", "False", "w")
	logging(get_file("logs/logfile.txt"), "Successfully loaded in!")
	init(True, True, True, True)








# -----------------<  Display functions  >----------------- #

def get_credits():
	creds_f = open(get_file("client_env/credits.txt"), "r")
	return creds_f.read()

def get_version():
	version_f = open(get_file("client_env/version.txt"), "r")
	return version_f.read()

def get_console_version():
	c_version_f = read_file("client_env/console_version.txt")
	return c_version_f

def get_cursor(cursor_file):
	if not cursor_file == "":
		cursor_str = open(get_file(f"config/{cursor_file}.txt"), "r")
		return f"{cursor_str.read()} "

def display_version_of(version_of):
	if not version_of == "" or not version_of is None:

		version_keyword = None

		if version_of == "client" or version_of == "main":
			print(f"\n{PURPLE}[Client Version]{END} : {get_version()}")
			version_keyword = "Client"

		elif version_of == "console" or version_of == "cl":
			print(f"\n{BLUE}[Console Version]{END}\n{get_console_version()}")
			version_keyword = "Console"

		elif version_of == "python" or version_of == "py":
			print(f"\n{LIGHT_GREEN}[Python Version]{END} : {python_version()}")
			version_keyword = "Python"

		logging(get_file("logs/logfile.txt"), f"Getting the version of {version_keyword}")

def create_bar(bar_str, bar_length):
	if not bar_str == "" and bar_length > 0:
		return bar_str * bar_length

def console_display(message):
	if not message == "":
		print(f"\n{YELLOW}[Console]{END} {GREEN}{get_time()}{END} : {CYAN}{message}{END}", end="")

def logging(_file, message):
	if not message == "" and not _file == "":
		with open(get_file(_file), "a") as f:
			f.writelines(f"[Console] {get_time()} : {message}\n")

def get_started():
	print(f"\n{GREEN}: Type{END} {YELLOW}\"help\"{END} {GREEN}to get started.{END}")

def wait(n):
	if n > 0:
		time.sleep(n)








# -----------------<  Custom functions  >----------------- #

def newline():
	print("\n", end="")

def chk_cmd(cmdio, cmd):
	if not cmdio == "" and not cmd == "":
		if cmdio == cmd:
			return True

def get_repo_desc():
	repo_desc = f"""
	{BOLD}{YELLOW}# QyVern - PY{END}

	A Shell Interface & and fork of {ITALIC}{CYAN}@Equinoxtic{END}'s QyVern.

	This fork is completely made in Python and has 
	exclusive new features that completely seperate it 
	from the original.

	{ITALIC}Requires Python (3.X){END}

	; {ITALIC}Larixssa. <3{END}

	{GREEN}Repository Link:{END} {CYAN}{ITALIC}https://github.com/Larixssa/QyVern-PY{END}
	"""
	return repo_desc

def get_help():
	command_list = []

	create_command("exit", "Exit out of the client.", command_list)
	create_command("clear", "Clear the screen.", command_list)
	create_command("get-repo", "Get the repository's info & link.", command_list)
	create_command("help", "Shows a list of commands and their usage.", command_list)
	create_command("clear-log-file", "Clears the log file.", command_list)
	create_command("get-version / get-client-version", "Get the version of the client.", command_list)
	create_command("get-console-version", "Get the version of the command line console.", command_list)
	create_command("get-python-version / get-py-version", "Get the version of the python programming language", command_list)
	create_command("open-link", "Open a certain link within the console.", command_list)

	print(f"\n{GREEN}-------< Available Commands >-------{END}")

	for i in range(0, len(command_list)):
		print(f"\n{command_list[i]}", end="")
	newline()

def get_time():
	time_now = datetime.datetime.now()
	return time_now.strftime("%H:%M:%S")

def add_fake_loading_path(_fpath, _ttable=None):
	if not _fpath == "":
		file_path = _fpath.replace(".", "/")
		if _ttable is None:
			_ttable = []
		_ttable.append(file_path)
		return _ttable

def write_to_file(_file, content, mode):
	if not _file is None or not _file == "":
		with open(get_file(_file), mode) as f:
			f.write(content)

def read_file(_file):
	rfile = open(get_file(_file), "r")
	return rfile.read()

def os_exec(command, mode):
	if not command == "":
		if mode == "ps":
			system(f"powershell -command {command}")
		elif mode == "default":
			system(command)

def logfile_clearer():
	if path.exists("logs/logfile.txt"):
		print(f"\n{GREEN}> Successfully cleared the logfile.{END}")
	else:
		print(f"\n{RED}[ERROR]: Cannot be cleared. Logfile is either missing or corrupted.{END}")

def process_out(stdprocess):
	if not stdprocess == "":
		if stdprocess == "cancelled_operation":
			return f"\n{RED}-- PROCESS CANCELLED --{END}"







# -----------------<  GUI types  >----------------- #

def open_link_gui():
	https_prot = "https://"

	def prompt():
		guide = """
\t\b\b\b\b\b\b-- GUIDE --
\t\b\b\b\b\b\b* Input the link you want in the prompt.
\t\b\b\b\b\b\b* Type in \"cancel\" or \"exit\" if you want to exit the process.
		"""
		print(f"\n[ Open Link GUI. ]\n{guide}")

	def id_link(link_str):

		link_prefixes = [
			"youtube.com",
			"discord.com",
			"twitter.com",
			"facebook.com",
			"github.com"
		]

		link_names = ["YouTube", "Discord", "Twitter", "FaceBook", "GitHub"]

		parse = False
		_parse = None

		for i in range(0, len(link_prefixes)):
			
			if not link_str.find(link_prefixes[i]) == -1:
				parse = True
				if _parse is None:
					_parse = f"{link_names[i]} / {link_prefixes[i]}"
		if parse:
			print(f"\nOpened Link: {link_str}\nWebsite: {_parse}")
		else:
			print(f"\nOpened Link: {link_str}")
		logging(get_file("logs/logfile.txt"), f"Opened Link: {link_str} | Site: {_parse}")

	prompt()

	print("[URL]: ", end="")
	clink = input()
	if not clink == "":
		if clink == "cancel" or clink == "exit":
			print(f"{process_out('cancelled_operation')}")
		else:
			if clink.startswith(https_prot):
				webbrowser.open_new_tab(f"{clink}")
				id_link(clink)
			else:
				webbrowser.open_new_tab(f"{https_prot}{clink}")
				id_link(clink)








# -----------------<  Parser functions  >----------------- #

def parse_cmd(cmd_io):
	if not cmd_io == "":

		command_list = []

		add_command("exit", command_list)
		add_command("clear", command_list)
		add_command("get-repo", command_list)
		add_command("help", command_list)
		add_command("clear-log-file", command_list)
		add_command("get-version", command_list)
		add_command("get-client-version", command_list)
		add_command("get-console-version", command_list)
		add_command("get-python-version", command_list)
		add_command("get-py-version", command_list)
		add_command("open-link", command_list)

		parse = False

		for i in range(0, len(command_list)):
			if cmd_io == command_list[i]:
				parse = True
		
		if parse == True:
			command_parser(cmd_io)
		else:
			print(f"{RED}\n[ERROR] - Unavailable command: {YELLOW}{cmd_io}{END}")
			init(False, False, False, False)

	else:
		init(False, False, False, False)

def command_parser(command_to_parse):

	logging(get_file("logs/logfile.txt"), f"Ran command > {command_to_parse}")

	if not command_to_parse == "":

		log_cmd(command_to_parse)
	
		if chk_cmd(command_to_parse, "clear"):
			os_exec("clear", "ps")

		elif chk_cmd(command_to_parse, "exit"):
			os_exec("exit", "default")
			os_exec("clear", "ps")

		elif chk_cmd(command_to_parse, "get-repo"):
			print(f"{get_repo_desc()}", end="")

		elif chk_cmd(command_to_parse, "help"):
			write_to_file("config/set_get_started.txt", "False", "w")
			get_help()

		elif chk_cmd(command_to_parse, "get-version") or chk_cmd(command_to_parse, "get-client-version"):
			display_version_of("client")

		elif chk_cmd(command_to_parse, "get-console-version"):
			display_version_of("console")

		elif chk_cmd(command_to_parse, "get-python-version") or chk_cmd(command_to_parse, "get-py-version"):
			display_version_of("python")

		elif chk_cmd(command_to_parse, "clear-log-file"):
			write_to_file("logs/logfile.txt", "", "w")
			logfile_clearer()

		elif chk_cmd(command_to_parse, "open-link"):
			open_link_gui()

		# Prevents re-initialization.
		if not chk_cmd(command_to_parse, "exit"):
			init(False, False, False, False)

def log_cmd(pcmd):

	default_log_file = get_file("logs/logfile.txt")

	if not pcmd == "":

		if pcmd == "help":
			logging(default_log_file, "Getting commands...")

		elif pcmd == "exit":
			logging(default_log_file, "Exiting out of the client...")

		elif pcmd == "clear":
			logging(default_log_file, "Screen cleared.")

		elif pcmd == "get-repo":
			logging(default_log_file, "Getting repository info & link...")

		elif pcmd == "get-version" or pcmd == "get-client-version":
			logging(default_log_file, "Showing client version.")

		elif pcmd == "get-console-version":
			logging(default_log_file, "Displaying console version. ~ Sweet Civil Co. <3")
		
		elif pcmd == "get-python-version" or pcmd == "get-py-version":
			s = "s" * randint(5, 13)
			logging(default_log_file, f"S{s}.")








# -----------------<  Command functions  >----------------- #

def add_command(command_name, table_append=None):
	if not command_name == "":
		if table_append is None:
			table_append = []
		table_append.append(command_name)
		return table_append

def create_command(command_name, description, table_append=None):
	if not command_name == "" and not description == "":
		full_command = f"{BLUE}[{command_name}]{END} : {CYAN}{description}{END}"
		if table_append is None:
			table_append = []
		table_append.append(f"{full_command}")
		return table_append








# -----------------<  Main function  >----------------- #

def main():
	set_compile = read_file("config/set_compile.txt")
	set_get_started = read_file("config/set_get_started.txt")
	def_val = True
	if set_compile == "True":
		load_state(1, 2, True)
	else:
		init(def_val, def_val, def_val, set_get_started)
	
if __name__ == '__main__':
	main()