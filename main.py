import os
from os import path
from platform import python_version, system
from random import randint
from re import search, findall
from decimal import *
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
		if path.exists(file):
			return file
		else:
			print(f"{process_out('file_warning_exists')}")

def generate_credits():
	cred = f"\n{CYAN}By: {get_credits()} - Version: {get_version()}{END}"
	print(cred)

def get_user():
	user_name = read_file("config/username.txt")
	return user_name

def get_user_id():
	user_id = read_file("config/userid.txt")
	return user_id

def generate_title():
	title = f"""{PURPLE}{BOLD}
┌─┐ ┬ ┬┬  ┬┌─┐┬─┐┌┐┌
│─┼┐└┬┘└┐┌┘├┤ ├┬┘│││
└─┘└ ┴  └┘ └─┘┴└─┘└┘
	{END}"""
	print(title, end="")
	print(f"\n{create_bar('-', 65)}")

def init(gen_title, gen_creds, clear_screen, gen_get_started):

	user_password = get_user_data("password")

	if user_password == "":
		set_password_now()

	if clear_screen == True:
		os_exec("clear", "ps")
	if gen_title == True:
		logging(get_file("logs/logfile.txt"), "Client Loaded.")
		generate_title()
	if gen_creds == True:
		generate_credits()
	if gen_get_started == True or gen_get_started == "True":
		get_started()

	username_content = get_user()
	userid_content = get_user_id()
	if path.exists("config/username.txt"):
		if path.exists("config/userid.txt"):
			if not userid_content == "":
				if username_content == "":
					print(f"\n{BLUE}[Guest@{get_user_id()}]{END}{GREEN} ~ {END}{YELLOW}{get_cursor('cursor')}{END}", end="")
				else:
					print(f"\n{BLUE}[{get_user()}@{get_user_id()}]{END}{GREEN} ~ {END}{YELLOW}{get_cursor('cursor')}{END}", end="")
			else:
				if not username_content == "":
					print(f"\n{BLUE}[{get_user()}]{END}{GREEN} ~ {END}{YELLOW}{get_cursor('cursor')}{END}", end="")
				else:
					print(f"\n{YELLOW}{get_cursor('cursor')}{END}", end="")

	prompt = input()
	if not prompt == "":
		logging(get_file("logs/logfile.txt"), f"Parsed string > \"{prompt}\".")
		parse_cmd(prompt.lower())
	else:
		print(f"{process_out_val('failed_operation', 'NO COMMAND INPUTTED.')}")
		init(False, False, False, False)

def init_log_files():
	if system() == "Windows":
		os_exec("mkdir logs", "ps")
		os_exec("ni logs/logfile.txt", "ps")
	elif system() == "Linux":
		os_exec("mkdir logs", "default")
		os_exec("touch logs/logfile.txt", "default")

def load_state(wait_time_a, wait_time_b, _compile):
	loading_files = []
	set_get_started = read_file("config/set_get_started.txt")
	if _compile == True:
		init_log_files()
		os_exec("clear", "ps")
		print(f"{BLUE}[ Compiling QyVern - {get_version()} ]{END}")

		add_fake_loading_path("display.create_bar", loading_files)
		add_fake_loading_path("display.get_version", loading_files)
		add_fake_loading_path("display.get_credits", loading_files)
		add_fake_loading_path("display.get_cursor", loading_files)
		add_fake_loading_path("display.get_version_of", loading_files)
		add_fake_loading_path("display.dislay_version_of", loading_files)
		add_fake_loading_path("states.loading", loading_files)
		add_fake_loading_path("logging.console_display", loading_files)
		add_fake_loading_path("logging.logging_std", loading_files)
		add_fake_loading_path("misc.newline", loading_files)
		add_fake_loading_path("misc.chk_cmd", loading_files)
		add_fake_loading_path("misc.chk_cmd_startswith", loading_files)
		add_fake_loading_path("misc.repo_desc", loading_files)
		add_fake_loading_path("misc.get_guidelines", loading_files)
		add_fake_loading_path("misc.get_detailed_client_parser", loading_files)
		add_fake_loading_path("misc.get_help", loading_files)
		add_fake_loading_path("misc.get_time", loading_files)
		add_fake_loading_path("misc.process_out", loading_files)
		add_fake_loading_path("misc.process_out_val", loading_files)
		add_fake_loading_path("parser.cmd_parse", loading_files)
		add_fake_loading_path("parser.os_exec", loading_files)
		add_fake_loading_path("parser.command_parser", loading_files)
		add_fake_loading_path("cl.add_command", loading_files)
		add_fake_loading_path("cl.create_command", loading_files)
		add_fake_loading_path("cl.chk_flag", loading_files)
		add_fake_loading_path("gui.open_link", loading_files)
		add_fake_loading_path("gui.set_profile", loading_files)
		add_fake_loading_path("gui.set_username", loading_files)
		add_fake_loading_path("gui.set_userid", loading_files)
		add_fake_loading_path("gui.set_password", loading_files)
		add_fake_loading_path("usr.password_required", laoding_files)
		add_fake_loading_path("usr.password_handler", loading_files)
		add_fake_loading_path("usr.password_message_handler", loading_files)

		for i in range(0, len(loading_files)):
			console_display(f"Compiling {loading_files[i]}...")
			logging(get_file("logs/logfile.txt"), f"Compiling file > {loading_files[i]}")
			wait(randint(wait_time_a, wait_time_b))

		write_to_file("config/set_compile.txt", "False", "w")
	logging(get_file("logs/logfile.txt"), "Successfully loaded in!")
	init(True, True, True, set_get_started)








# -----------------<  Display functions  >----------------- #

def get_credits():
	creds_f = open(get_file("client_env/credits.txt"), "r")
	return creds_f.read()

def get_owner():
	owner_f = open(get_file("client_env/og_owner.txt"), "r")
	return owner_f.read()

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

def get_user_data(user_data_file):
	if not user_data_file == "":
		cur_file = read_file(f"config/{user_data_file}.txt")
		return cur_file

def display_version_of(version_of):
	if not version_of == "" or not version_of is None:

		version_keyword = None

		if version_of == "client" or version_of == "main":
			print(f"\n{PURPLE}[Client Version]{END} : {BLUE}{get_version()}{END}")
			version_keyword = "Client"

		elif version_of == "console" or version_of == "cl":
			print(f"\n{BLUE}[Console Version]{END}\n{CYAN}{get_console_version()}{END}")
			version_keyword = "Console"

		elif version_of == "python" or version_of == "py":
			print(f"\n{LIGHT_GREEN}[Python Version]{END} : {YELLOW}{python_version()}{END}")
			version_keyword = "Python"

		logging(get_file("logs/logfile.txt"), f"Getting the version of {version_keyword}")

def get_version_of(version_of):
	if not version_of == "" or not version_of is None:

		version_content = None

		if version_content is None:
			if version_of == "client" or version_of == "main":
				version_content = f"\n{PURPLE}[Client Version]{END} : {CYAN}{get_version()}{END}"

			elif version_of == "console" or version_of == "cl":
				version_content = f"\n{PURPLE}[Console Version]{END}\n{CYAN}{get_console_version()}{END}"

			elif version_of == "python" or version_of == "py":
				version_content = f"\n{LIGHT_GREEN}[Python Version]{END} : {YELLOW}{python_version()}{END}"

		return version_content

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

def get_guidelines():
	guidelines = f"""
	{BOLD}{YELLOW}Guidelines when modifying PyVern{END}:

	{BLUE}* NEVER distribute illegal / malicious copies of PyVern.{END}
		{GREEN}- It is illegal to make such stuff like that.{END}
		{GREEN}- I will take action once a copy is reported to me.{END}
		{GREEN}- This can go the same with forks of the repository.{END}

	{BLUE}* NEVER request a PR for insert malicious payloads / malware.{END}
		{GREEN}- Every PR in this repository gets researched and looked into.{END}
		{GREEN}- Once malicious payloads are found, we will decline / close the PR.{END}	
	"""
	return guidelines

def get_detailed_client_version():
	client_version = f"""
	{BLUE}\n[ QyVern - {get_version()} > Version Details. ]{END}
	{get_version_of('client')}
	{get_version_of('console')}
	{BLUE}\n\n---- EXTRAS ----{END}
	{get_version_of('python')}
	"""
	print(f"{client_version}")

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

def logfile_clearer():
	if path.exists("logs/logfile.txt"):
		print(f"\n{GREEN}> Successfully cleared the logfile.{END}")
	else:
		print(f"\n{RED}[ERROR]: Cannot be cleared. Logfile is either missing or corrupted.{END}")

def process_out(stdprocess):
	if not stdprocess == "":
		if stdprocess == "cancelled_operation":
			return f"\n{RED}-- PROCESS CANCELLED --{END}"
		elif stdprocess == "file_warning_exists":
			return f"\n{RED}-- FILE DATA ERROR --{END}"

def process_out_val(stdprocess, processval):
	if not stdprocess == "" and not processval == "":
		if stdprocess == "failed_operation":
			return f"\n{GREEN}@{END} {YELLOW}{get_time()}{END} > {RED}[ERROR]{END} : {YELLOW}FAILED OPERATION{END}.\n{RED}[REASON]{END} : {YELLOW}{processval}{END}"

def open_link(link_content):
	if not link_content == "":
		logging(get_file("logs/logfile.txt"), f"Opened Link: {link_content}")
		webbrowser.open_new_tab(link_content)








# -----------------<  GUI types  >----------------- #

DEFAULT_GUIDE_MESSAGE = f"\t\b\b\b\b\b\b{GREEN}-- GUIDE --{END}"

def create_guide(inserted_guide):
	if not inserted_guide == "":
		return f"\t\b\b\b\b\b\b{BLUE}* {inserted_guide}{END}"

def open_link_gui():
	https_prot = "https://"

	def prompt():
		guide = f"""
{DEFAULT_GUIDE_MESSAGE}
{create_guide(f'Input the link you want in the prompt.')}
{create_guide(f'Type in {ITALIC}{YELLOW}cancel{END} {BLUE}or {ITALIC}{YELLOW}exit{END} {BLUE}if you want to exit the process.')}
		"""
		print(f"\n{YELLOW}[ Open Link GUI. ]{END}\n{guide}")

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
			print(f"\n{GREEN}Opened Link{END} : {BLUE}{link_str}{END}\n{YELLOW}Website{END} : {CYAN}{_parse}{END}")
		else:
			print(f"\nOpened Link: {link_str}")
		logging(get_file("logs/logfile.txt"), f"Opened Link: {link_str} | Site: {_parse}")

	prompt()

	print(f"{CYAN}[URL]{END} : ", end="")
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
	else:
		print(f"{process_out_val('failed_operation', 'LINK NOT FOUND IN THE INPUT.')}")

def set_username():

	username = None

	username_file = read_file("config/username.txt")

	def uname_prompt():
		minimal_guide = f"{YELLOW}> Set your desired username.{END}"
		print(f"\n{BLUE}[ Profile Settings > Username. ]{END}\n{minimal_guide}")

	uname_prompt()

	print(f"{CYAN}[New Username]{END} : ", end="")
	iuname = input()
	if not iuname == "":
		if username is None:
			username = iuname
		if not username == username_file:
			print(f"\n{GREEN}> New Username{END} : {CYAN}\"{iuname}\"{END}")
			write_to_file(get_file("config/username.txt"), username, "w")
			logging(get_file("logs/logfile.txt"), f"Username set to: {iuname}")
		else:
			print(f"\n{RED}[ERROR]{END} : {YELLOW}Local User \"{username}\" already exists, please try again with a different username.{END}")
	else:
		print(f"{process_out_val('failed_operation', 'USERNAME INPUT IS EMPTY.')}")

def set_userid():

	userid = None

	def uid_prompt():
		minimal_guide = f"{YELLOW}> Randomly generate a User ID.{END}"
		print(f"\n{BLUE}[ Profile Settings > User ID. ]{END}\n{minimal_guide}")

	uid_prompt()

	print(f"{CYAN}[Generate New ID?]{END} : (Y/N) {GREEN}~{END} ", end="")
	ioption = input()
	if not ioption == "":
		if ioption == "Y":
			if userid is None:
				userid = randint(1000, 9999)
			print(f"\n{GREEN}> New generated ID{END} : {CYAN}{userid}{END}")
			write_to_file(get_file("config/userid.txt"), str(userid), "w")
			logging(get_file("logs/logfile.txt"), f"Set User ID / Tag to: {str(userid)}")
		elif ioption == "N":
			print(f"{process_out('cancelled_operation')}")
	else:
		print(f"{process_out_val('failed_operation', 'EMPTY OPTION INPUT.')}")

def set_password():

	pw_content = None

	pw_file = read_file("config/password.txt")

	def prompt():
		minimal_guide = f"{BLUE}> Create a new password.{END}"
		print(f"\n{YELLOW}[ Password settings GUI. ]{END}\n{minimal_guide}")
	
	prompt()

	print(f"{CYAN}\n[Input new password]{END} {GREEN}~{END} ", end="")
	pw_input = input()
	if len(pw_input) <= 3:
		print(f"{YELLOW}[WARNING]{END} : {GREEN}Having a password that is 3 characters in length has risks for someone getting into your local account easily.{END}")
	if not pw_input == "":
		if pw_input == pw_file:
			print(f"\n{RED}[ERROR]{END} : {YELLOW}Local Password already exists, please try again with a different password.{END}")
		else:
			print(f"{BLUE}\n[Confirm new password]{END} {GREEN}~{END} ", end="")
			confirm_pw_input = input()
			if not confirm_pw_input == "":
				write_to_file(get_file("config/password.txt"), str(confirm_pw_input), "w")
				if not get_user() == "":
					print(f"{GREEN}\nCreated new password for user{END} : {YELLOW}\"{get_user_data('username')}\"{END}")
					logging(get_file("logs/logfile.txt"), f"Created new password for new user: \"{get_user_data('username')}\"")
				else:
					print(f"{GREEN}\nCreated new client password.{END}")
					logging(get_file("logs/logfile.txt"), f"Created new client password.")
			else:
				print(f"{process_out_val('failed_operation', 'EMPTY PASSWORD INPUT. (CONFIRMED_PASSWORD)')}")
	else:
		print(f"{process_out_val('failed_operation', 'EMPTY PASSWORD INPUT. (PASSWORD_CONTENT)')}")

def set_profile():

	def prompt():
		guide = f"""
{DEFAULT_GUIDE_MESSAGE}
{create_guide(f'Input an option whether to set the username or ID.')}
{create_guide(f'Each data will be stored locally.')}
{create_guide(f'Type in {ITALIC}{YELLOW}cancel{END} {BLUE}or {ITALIC}{YELLOW}exit{END} {BLUE}to exit the process.')}
		"""
		print(f"\n{CYAN}[ Profile Settings GUI. ]{END}\n{guide}")
		init_options()

	def init_options():
		ui_options = ["username / name", "id / tag", "password / pass"]
		ui_descriptions = ["Set the username.", "Set the ID / Tag.", "Set the Password."]
		for i in range(0, len(ui_options) or len(ui_descriptions)):
			print(f"{GREEN}[{ui_options[i]}]{END} : {CYAN}{ui_descriptions[i]}{END}")
	
	prompt()

	print(f"\n{YELLOW}[Option]{END} {GREEN}~{END} ", end="")
	ioption = input()
	if not input == "":
		if ioption == "cancel" or ioption == "exit":
			print(f"{process_out('cancelled_operation')}")
		else:
			if ioption == "username" or ioption == "name":
				set_username()
			elif ioption == "id" or ioption == "tag":
				set_userid()
			elif ioption == "password" or ioption == "pass":
				set_password() 
	else:
		print(f"{process_out_val('failed_operation', 'EMPTY OPTION INPUT.')}")

def math_ui(param_operation, param_stdtype):
	if not param_stdtype == "":
		if not param_operation == "":
			def formula_handler():
				formula_string = None
				if param_operation == "add": formula_string = f"{CYAN}a + b{END} = {GREEN}sum{END}"
				elif param_operation == "sub": formula_string = f"{CYAN}a - b{END} = {GREEN}difference{END}"
				elif param_operation == "mult": formula_string = f"{CYAN}a * b{END} = {GREEN}product{END}"
				elif param_operation == "divi": formula_string = f"{CYAN}a / b{END} = {GREEN}quotient{END}"
				return f"\n{BLUE}[ FORMULA:{END} {formula_string} {BLUE}]{END}\n"

			def math_path_handler():
				math_title_path = None
				if param_operation == "add": math_title_path = "Addition"
				elif param_operation == "sub": math_title_path = "Subtraction"
				elif param_operation == "mult": math_title_path = "Multiplication"
				elif param_operation == "divi": math_title_path = "Division"
				return f"{BLUE}[ Math >{END} {CYAN}{math_title_path}{END} {BLUE}]{END}"

			print(f"\n{math_path_handler()}\n")

			print(f"{YELLOW}[Input first number]{END} {GREEN}~{END} ", end="")
			first_num = input()
			if first_num == "":
				print(f"{process_out_val('failed_operation', 'EMPTY NUMBER INPUT. (FIRST)')}")

			print(f"{YELLOW}[Input second number]{END} {GREEN}~{END} ", end="")
			second_num = input()
			if second_num == "":
				print(f"{process_out_val('failed_operation', 'EMPTY NUMBER INPUT. (SECOND)')}")

			if not first_num == "" and not second_num == "":

				if param_stdtype == "standard_math":

					print(f"{formula_handler()}")

					if param_operation == "add":
						local_sum = math_handler_standard("add", first_num, second_num)
						print(f"{CYAN}{first_num} + {second_num}{END} = {GREEN}{local_sum}{END}")

					elif param_operation == "sub":
						local_diff = math_handler_standard("sub", first_num, second_num)
						print(f"{CYAN}{first_num} - {second_num}{END} = {GREEN}{local_diff}{END}")

					elif param_operation == "mult":
						local_prod = math_handler_standard("mult", first_num, second_num)
						print(f"{CYAN}{first_num} * {second_num}{END} = {GREEN}{local_prod}{END}")

					elif param_operation == "divi":
						local_quot = math_handler_standard("divi", first_num, second_num)
						print(f"{CYAN}{first_num} / {second_num}{END} = {GREEN}{local_quot}{END}")

			else:

				print(f"{process_out_val('failed_operation', 'EMPTY NUMBERS.')}")

		else:
			def gen_title():
				title = f"""
{RED}---------< [REQUIRED] Math Flags [REQUIRED] >---------{END}
				"""
				return title

			math_help_table_names = ["add", "sub", "mult", "divi"]

			math_help_table_descriptions = [
				"sum of two numbers.",
				"difference of two numbers.",
				"product of two numbers.",
				"quotient of two numbers.",
			]

			print(f"{gen_title()}")

			for i in range(0, len(math_help_table_names)):
				print(f"{CYAN}[--{math_help_table_names[i]}]{END} : {YELLOW}Get the {math_help_table_descriptions[i]}{END}")

def failed_config():
	document_link = "https://github.com/Larixssa/QyVern-PY/blob/master/docs/BUILDING.md#building"

	document_desc = f"""
	{RED}[ERROR]{END} : {YELLOW}Failed to start up QyVern.{END}

	{GREEN}[REASON]{END} : {CYAN}The \"config\" directory does not exist.
	Please read BUILDING.md to know how to setup the \"config\" directory,
	so that you can fully run QyVern.{END}

	; {ITALIC}Larixssa <3{END}
	"""

	def prompt_handler(prompt_str):
		if not prompt_str == "":
			if prompt_str == "Y" or prompt_str == "y":
				open_link(document_link)
			else:
				if prompt_str == "N" or prompt_str == "n":
					print(f"{process_out('cancelled_operation')}")
				else:
					print(f"{process_out('cancelled_operation')}")
					print(f"\n{RED}[ERROR]: No such option as{END} {YELLOW}\"{prompt_str}\"{END}\n")

	print(document_desc)

	print(f"{ORANGE}[Open Link?]{END} {GREEN}~{END} (Y/N) ", end="")

	str_option = input()

	prompt_handler(str_option)

def set_password_now():
	def question_prompt():
		question = f"{YELLOW}[WARNING]{END} : {GREEN}You currently don't have a password set up. Please set up a password now to reduce the risk of someone getting access to your local account.{END}"
		print(f"\n{question}")
	question_prompt()
	print(f"{BLUE}[Create a new password?]{END} (Y/N) {GREEN}~{END} ", end="")
	i_option = input()
	if not i_option == "":
		if i_option == "Y" or i_option == "y":
			set_password()
		else:
			print(f"{process_out('cancelled_operation')}")
	else:
		print(f"{process_out_val('failed_process', 'EMPTY OPTION INPUT')}")

def password_prompt():
	full_user = f"{get_user()}@{get_user_id()}"
	print(f"{PURPLE}\n[Input password for {full_user}]{END} {GREEN}~{END} ", end="")
	password_req = input()
	return password_req

def password_handler(pw_content):
	main_password_content = get_user_data("password")
	if not pw_content == "":
		if pw_content == main_password_content:
			return True
		else:
			return False
	else:
		return False

def password_message_handler(password_status, password_entered_reason):
	full_user = f"{get_user()}@{get_user_id()}"
	if not password_status == "" and not password_entered_reason == "":
		if password_status == True:
			logging(get_file("logs/logfile.txt"), f"{full_user} logged in: {password_entered_reason}")
		else:
			print(f"{RED}[ERROR]{END} : {YELLOW}Password entered is incorrect, please try again.{END}")

def reset_data():

	config_table = [
		"cursor",
		"password",
		"userid",
		"username"
	]

	print(f"{RED}\n[Reset Data?]{END} (Y/N) {YELLOW}~{END} ", end="")
	i_option = input()
	if not i_option == "":
		if i_option == "Y" or i_option == "y":
			for i in range(0, len(config_table)):
				write_to_file(get_file(f"config/{config_table[i]}"), "", "w")
		elif i_option == "N" or i_option == "n":
			print(f"{process_out('cancelled_operation')}")
		else:
			print(f"{process_out_val('failed_operation', 'EMPTY INPUT OR INCORRECT LETTER.')}")

def credits_gui():
	credits_content = f"""
\t{CYAN}{ITALIC}[ -----< QyVern Credits >----- ]{END}\n
\t{BLUE}> (Created by){END} : {PURPLE}{get_credits()}{END}
\t{RED}> (Original Project by){END} : {YELLOW}{get_owner()}{END}
\t{CYAN}> (Created in){END} : {BLUE}Python - {python_version()}{END}
	"""
	print(f"{credits_content}", end="")








# -----------------<  Parser functions  >----------------- #

def get_commands_help():

	def init_commands():
		create_command("help", "Shows a list of commands and their usage.", False, command_list)
		create_command("exit", "Exit out of the client.", False, command_list)
		create_command("clear", "Clear the screen.", False, command_list)
		create_command("get-repo", "Get the repository's info & link.", False, command_list)
		create_command("get-guidelines", "Get the guidelines for the repository.", False, command_list)
		create_command("version", "Get the version of the client, console, and python.", False, command_list)
		create_command("credits", "Show the credits for the repository.", False, command_list)
		create_command("clear-log-file", "Clears the log file.", False, command_list)
		create_command("open-link", "Open a certain link within the console.", False, command_list)
		create_command("set-profile", "Configurate the Username and User ID.", False, command_list)
		create_command("math", "Perform simple math operations.", False, command_list)
		create_command("reset-data", "Resets the data for everything. (i.e. User, Password, etc.)", True, command_list)

	command_list = []

	init_commands()

	print(f"\n{GREEN}-------< Available Commands >-------{END}")

	for i in range(0, len(command_list)):
		print(f"\n{command_list[i]}", end="")
	newline()

def parse_cmd(cmd_io):

	def init_commands():
		add_command("help", command_list)
		add_command("exit", command_list)
		add_command("clear", command_list)
		add_command("get-repo", command_list)
		add_command("get-guidelines", command_list)
		add_command("version", command_list)
		add_command("credits", command_list)
		add_command("clear-log-file", command_list)
		add_command("open-link", command_list)
		add_command("set-profile", command_list)
		add_command("math", command_list)
		add_command("reset-data", command_list)

	if not cmd_io == "":

		command_list = []

		init_commands()

		parse = False

		for i in range(0, len(command_list)):
			if cmd_io.startswith(command_list[i]) or cmd_io == command_list[i]:
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

		elif chk_cmd(command_to_parse, "get-guidelines"):
			print(f"{get_guidelines()}", end="")

		elif chk_cmd(command_to_parse, "help"):
			write_to_file("config/set_get_started.txt", "False", "w")
			get_commands_help()

		elif chk_cmd(command_to_parse, "credits"):
			credits_gui()

		elif chk_cmd_startswith(command_to_parse, "version"):
			if chk_flag("/client", command_to_parse, "client"):
				display_version_of("client")
			elif chk_flag("/console", command_to_parse, "console"):
				display_version_of("console")
			elif chk_flag("/python", command_to_parse, "python"):
				display_version_of("python")
			else:
				get_detailed_client_version()

		elif chk_cmd(command_to_parse, "clear-log-file"):
			write_to_file("logs/logfile.txt", "", "w")
			logfile_clearer()

		elif chk_cmd(command_to_parse, "open-link"):
			open_link_gui()

		elif chk_cmd_startswith(command_to_parse, "set-profile"):
			if chk_flag("--set-username", command_to_parse, "set-username"):
				set_username()
			elif chk_flag("--set-userid", command_to_parse, "set-userid"):
				set_userid()
			elif chk_flag("--set-password", command_to_parse, "set-password"):
				set_password()
			else:
				set_profile()

		elif chk_cmd_startswith(command_to_parse, "math"):
			default_math_stdtype_val = "standard_math"
			if chk_flag("--add", command_to_parse, "add"):
				math_ui("add", default_math_stdtype_val)
			elif chk_flag("--sub", command_to_parse, "sub"):
				math_ui("sub", default_math_stdtype_val)
			elif chk_flag("--mult", command_to_parse, "mult"):
				math_ui("mult", default_math_stdtype_val)
			elif chk_flag("--divi", command_to_parse, "divi"):
				math_ui("divi", default_math_stdtype_val)
			else:
				math_ui("", default_math_stdtype_val)

		elif chk_cmd(command_to_parse, "reset-data"):
			# New password input system.
			password_req = password_prompt()
			chkd_pw = password_handler(password_req)
			password_message_handler(chkd_pw, "Resetting data.")
			if chkd_pw == True: reset_data()

		# Prevents re-initialization.
		if not chk_cmd(command_to_parse, "exit"):
			init(False, False, False, False)

def log_cmd(pcmd):

	default_log_file = get_file("logs/logfile.txt")

	if not pcmd == "":

		if chk_cmd(pcmd, "help"):
			logging(default_log_file, "Getting commands...")

		elif chk_cmd(pcmd, "exit"):
			logging(default_log_file, "Exiting out of the client...")

		elif chk_cmd(pcmd, "clear"):
			logging(default_log_file, "Screen cleared.")

		elif chk_cmd(pcmd, "get-repo"):
			logging(default_log_file, "Getting repository info & link...")

		elif chk_cmd(pcmd, "credits"):
			logging(default_log_file, "Getting the credits...")

		if pcmd.startswith("version"):
			if chk_flag("/client", pcmd, "client"):
				logging(default_log_file, "Showing client version.")
			elif chk_flag("/console", pcmd, "console"):
				logging(default_log_file, "Displaying console version. ~ Sweet Civil Co. <3")
			elif chk_flag("/python", pcmd, "python"):
				s = "s" * randint(5, 13)
				logging(default_log_file, f"S{s}.")

		elif chk_cmd(pcmd, "open-link"):
			logging(default_log_file, "Browsing through the web in the console...")

		elif pcmd.startswith("set-profile"):
			if chk_flag("--set-username", pcmd, "set-username"):
				logging(default_log_file, "Setting / Changing the username...")
			elif chk_flag("--set-userid", pcmd, "set-userid"):
				logging(default_log_file, "Generating a new user ID...")
			elif chk_flag("--set-password", pcmd, "set-password"):
				logging(default_log_file, "Creating a new password...")
			else:
				logging(default_log_file, "Going to profile settings.")

		elif pcmd.startswith("math"):
			if chk_flag("--add", pcmd, "add"):
				logging(default_log_file, "Getting the sum of two numbers.")
			elif chk_flag("--sub", pcmd, "sub"):
				logging(default_log_file, "Getting the difference of two numbers.")
			elif chk_flag("--mult", pcmd, "mult"):
				logging(default_log_file, "Getting the product of two numbers.")
			elif chk_flag("--divi", pcmd, "divi"):
				logging(default_log_file, "Getting the quotient of two numbers.")
			else:
				logging(default_log_file, "Performing math operations...")

		elif chk_cmd(pcmd, "reset-data"):
			logging(default_log_file, "Entering data reset...")








# -----------------<  Math functions  >----------------- #

def math_handler_standard(operation, na, nb):
	result_object = None
	if not operation == "":
		if result_object is None:
			if operation == "add":
				result_object = return_sum_of(float(na), float(nb))
			elif operation == "sub":
				result_object = return_diff_of(float(na), float(nb))
			elif operation == "mult":
				result_object = return_prod_of(float(na), float(nb))
			elif operation == "divi":
				result_object = return_quot_of(float(na), float(nb))
		return result_object

def return_sum_of(a, b):
	sum_var = a + b
	return sum_var

def return_diff_of(a, b):
	diff_var = a - b
	return diff_var

def return_prod_of(a, b):
	prod_var = a * b
	return prod_var

def return_quot_of(a, b):
	quot_var = a / b
	return quot_var








# -----------------<  Command functions  >----------------- #

def chk_cmd(cmdio, cmd):
	if not cmdio == "" and not cmd == "":
		if cmdio == cmd:
			return True

def chk_cmd_startswith(cmdio, cmd):
	if not cmdio == "" and not cmd == "":
		if cmdio.startswith(cmd):
			return True

def add_command(command_name, table_append=None):
	if not command_name == "":
		if table_append is None:
			table_append = []
		table_append.append(command_name)
		return table_append

def create_command(command_name, description, dangerous_command, table_append=None):
	if not command_name == "" and not description == "":
		full_command = None
		if full_command is None:
			full_command = ""
		if not dangerous_command:
			full_command = f"{BLUE}[{command_name}]{END} : {CYAN}{description}{END}"
		else:
			full_command = f"{RED}[{command_name}]{END} : {YELLOW}{description}{END}"
		if table_append is None:
			table_append = []
		table_append.append(f"{full_command}")
		return table_append

def chk_flag(pflag, search_str, vflag):
	ppflag = search(r'%s' %pflag, search_str)
	if ppflag:
		if not vflag == "":
			if ppflag.group() == f"--{vflag}" or ppflag.group() == f"/{vflag}":
				return True








# -----------------<  Main function  >----------------- #

def main():
	if path.exists("config/"):
		set_compile = read_file("config/set_compile.txt")
		set_get_started = read_file("config/set_get_started.txt")
		def_val = True
		if set_compile == "True":
			load_state(1, 2, True)
		else:
			init(def_val, def_val, def_val, set_get_started)
	else:
		failed_config()
	
if __name__ == '__main__':
	main()
