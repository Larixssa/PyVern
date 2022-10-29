import argparse
from os import system, path
from random import randint
from termcolor import cprint
from pyfiglet import figlet_format
import argparse


# -----------------<  Text Utilities  >----------------- #

# Text Colors
RED = "\033[0;31m"
ORANGE = "\033[0;38m"
GREEN = "\033[0;32m"
CYAN = "\033[0;36m"
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
		cursor_str = open(get_file("config/" + cursor_file + ".txt"), "r")
		return cursor_str.read() + " "

def create_bar(bar_str, bar_length):
	if not bar_str == "" and bar_length > 0:
		return bar_str * bar_length

# -----------------<  Parser functions  >----------------- #

def parse_cmd(cmd_io):
	if not cmd_io == "":
		command_parser(cmd_io)

def chk_cmd(cmdio, cmd):
	if not cmdio == "" and not cmd == "":
		if cmdio == cmd:
			return True

def command_parser(command_to_parse):
	if not command_to_parse == "":
		if chk_cmd(command_to_parse, "hi"):
			def callback():
				print("Hello World!")
			callback()
		main(False, False)


# -----------------<  General functions  >----------------- #

def get_file(file):
	if not file == "":
		return file

def generate_credits():
	cred = "\nBy - " + get_credits() + " - Version: " + get_version()
	print(cred)

def generate_title():
	title = f"""{PURPLE}{BOLD}
┌─┐ ┬ ┬┬  ┬┌─┐┬─┐┌┐┌
│─┼┐└┬┘└┐┌┘├┤ ├┬┘│││
└─┘└ ┴  └┘ └─┘┴└─┘└┘
	{END}"""
	print(title, end="")
	print("\n" + create_bar("=", 75))

def init(gen_title, gen_creds):
	if gen_title == True:
		generate_title()
	if gen_creds == True:
		generate_credits()
	print("\n" + get_cursor("cursor"), end="")
	prompt = input()
	parse_cmd(prompt)

# -----------------<  Main function  >----------------- #

def main(__title, __creds):
	init(__title, __creds)
	
if __name__ == '__main__':
	main(True, True)