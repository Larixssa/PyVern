import argparse
from os import system, path
from random import randint
import subprocess
import os
import argparse


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
LIGHT_GRAY = "\033[0;37m"

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

# -----------------<  Display functions  >----------------- #

def get_credits():
	creds_f = open(get_file("client_env/credits.txt"), "r")
	return creds_f.read()

def get_version():
	version_f = open(get_file("client_env/version.txt"), "r")
	return version_f.read()

def get_cursor(cursor_file):
	if not cursor_file == "":
		cursor_str = open(get_file(f"config/{cursor_file}.txt"), "r")
		return f"{cursor_str.read()} "

def create_bar(bar_str, bar_length):
	if not bar_str == "" and bar_length > 0:
		return bar_str * bar_length

# -----------------<  Custom functions  >----------------- #

def chk_cmd(cmdio, cmd):
	if not cmdio == "" and not cmd == "":
		if cmdio == cmd:
			return True

def get_repo_desc():
	repo_desc = f"""
	{BOLD}{YELLOW}# PyVern{END}

	A Shell Interface & and fork of {ITALIC}{CYAN}@Equinoxtic{END}'s QyVern.

	This fork is completely made in Python and has 
	exclusive new features that completely seperate it 
	from the original.

	{ITALIC}Requires Python (3.X){END}

	; {ITALIC}Larixssa. <3{END}

	{GREEN}Repository Link:{END} {CYAN}{ITALIC}https://github.com/Larixssa/QyVern-PY{END}
	"""
	return repo_desc

# -----------------<  Parser functions  >----------------- #

def parse_cmd(cmd_io):
	if not cmd_io == "":

		command_list = [ # Add custom commands here.
			"exit",
			"clear",
			"get-repo"
		]

		parse = False

		for i in range(0, len(command_list)):
			if cmd_io ==  command_list[i]:
				parse = True
		
		if parse == True:
			command_parser(cmd_io)
		else:
			print(f"{RED}\n[ERROR] - Unavailable command: {cmd_io}{END}")
			main(False, False)

def os_exec(command, mode):
	if not command == "":
		if mode == "ps":
			os.system(f"powershell -command {command}")
		elif mode == "default":
			os.system(command)

def command_parser(command_to_parse):

	if not command_to_parse == "":
	
		if chk_cmd(command_to_parse, "clear"):
			os_exec("clear", "ps")

		elif chk_cmd(command_to_parse, "exit"):
			os_exec("exit", "default")
			os_exec("clear", "ps")

		elif chk_cmd(command_to_parse, "get-repo"):
			print(f"\n{get_repo_desc()}")

		if not chk_cmd(command_to_parse, "exit"):
			main(False, False)


# -----------------<  General functions  >----------------- #

def generate_credits():
	cred = f"\nBy - {get_credits()} - Version: {get_version()}"
	print(cred)

def generate_title():
	title = f"""{PURPLE}{BOLD}
┌─┐ ┬ ┬┬  ┬┌─┐┬─┐┌┐┌
│─┼┐└┬┘└┐┌┘├┤ ├┬┘│││
└─┘└ ┴  └┘ └─┘┴└─┘└┘
	{END}"""
	print(title, end="")
	print(f"\n{create_bar('-', 75)}")

def init(gen_title, gen_creds):
	if gen_title == True:
		generate_title()
	if gen_creds == True:
		generate_credits()
	print(f"\n{get_cursor('cursor')}", end="")
	prompt = input()
	parse_cmd(prompt)

# -----------------<  Main function  >----------------- #

def main(__title, __creds):
	init(__title, __creds)
	
if __name__ == '__main__':
	main(True, True)
