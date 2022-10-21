-- Code and implement commands here

local parser = {}

parser.availablecommands = {
	"exit",
	"clear",
	"get-repo",
	"make-logs-dir",
	"new-log-file",
	"clear-log-file",
	"set-profile",
	"set-cursor",
	"get-guidelines",
	"list-commands",
	"get-client-version",
	"get-lua-version",
	"get-luajit-version"
}

local function console_writefile(msg, logfile)
	local strutils = require("src.modules.io.qystrutils")
	local console_displayer = require("src.modules.display.console_displayer")
	if not (strutils.checkNil(msg) and strutils.checkNil(logfile)) then
		console_displayer.displayConsoleMessage(msg, "wf", logfile)
	end
end

local function commandLog(cmd)
	local strutils = require("src.modules.io.qystrutils")
	local s_equals = strutils.checkStringEquals
	local logfile = "logs/logfile.txt"
	if not (strutils.checkNil(cmd)) then
		if (s_equals(cmd, "exit")) then console_writefile("Client closed.", logfile) end
		if (s_equals(cmd, "clear")) then console_writefile("Screen cleared.", logfile) end
		if (s_equals(cmd, "get-repo")) then console_writefile("Repository link created.", logfile) end
		if (s_equals(cmd, "make-logs-dir")) then console_writefile("Created \"logs\" directory.", logfile) end
		if (s_equals(cmd, "new-log-file")) then console_writefile("Created new \"logfile.\"", logfile) end
		-- if (strutils.checkStringEquals(cmd, "clear-log-file")) then console_writefile("Cleared logfile.", logfile) end
		if (s_equals(cmd, "set-profile")) then console_writefile("Entered to profile settings.", logfile) end
		if (s_equals(cmd, "set-cursor")) then console_writefile("Customizing Cursor...", logfile) end
		if (s_equals(cmd, "get-guidelines")) then console_writefile("Getting and Reading the Guidelines...", logfile) end
		if (s_equals(cmd, "list-commands")) then console_writefile("Listing available commands.", logfile) end
		if (s_equals(cmd, "get-client-version")) then console_writefile("Getting Client version.", logfile) end
		if (s_equals(cmd, "get-lua-version")) then console_writefile("Getting Lua version.", logfile) end
		if (s_equals(cmd, "get-luajit-version")) then console_writefile("Getting LuaJIT version.", logfile) end
	end
end

local function getVersionOf(_type)
	local strutils = require("src.modules.io.qystrutils")
	local file = require("src.modules.qylib.file")
	local version_type
	if (strutils.typeCheck(_type, "string")) then
		if not (strutils.checkNil(_type)) then
			if (strutils.checkStringEquals(_type, "client")) then
				version_type = file.readFile("version.txt") .. " - " .. file.readFile("build.txt")
			elseif (strutils.checkStringEquals(_type, "lua")) then
				version_type = file.readFile("lua-version.txt")
			elseif (strutils.checkStringEquals(_type, "luajit")) then
				version_type =  file.readFile("luajit-version.txt")
			end
		end
	end
	return version_type
end

function parser.parseCommand(cmd)
	local strutils = require("src.modules.io.qystrutils")
	local oututils = require("src.modules.io.qyoututils")
	local sys = require("src.modules.sys.qysys")
	local ps_exec = require("src.modules.sys.ps_exec")
	local init = require("src.modules.init.init_client")
	local file = require("src.modules.qylib.file")
	local console_displayer = require("src.modules.display.console_displayer")
	local set_prof = require("src.modules.gui.set_profile")
	local set_cursor = require("src.modules.gui.set_cursor")
	local command_handler = require("src.modules.cl.command_handler")
	local command_properties = require("src.modules.cl.command_parser")
	local s_equals = strutils.checkStringEquals
	local logfile = "logs/logfile.txt"
	local def_init_val = true

	if not (strutils.checkNil(cmd)) then

		console_displayer.displayConsoleMessage("\"" .. cmd .. "\" command successfully executed.", "wf", logfile)

		commandLog(cmd)

		-- Exits the program
		if (s_equals(cmd, "exit")) then
			sys.exitProgram()
			sys.clearScreen()
			def_init_val = false
		end

		-- Clears the screen
		if (s_equals(cmd, "clear")) then
			sys.clearScreen()
		end

		-- Get QyVern repo link
		if (s_equals(cmd, "get-repo")) then
			local _link = "https://github.com/Equinoxtic/QyVern"
			oututils.writeStr(
				"\n" .. file.readFile("config/repo-desc.txt") .. "\n\n- Repository link: " .. _link .. oututils.writeEscSeq("\n\n")
			)
		end

		-- Make a logs directory
		if (s_equals(cmd, "make-logs-dir")) then
			ps_exec.exec_common_action("make-directory", "logs")
		end

		-- Make a log file for console logging
		if (s_equals(cmd, "new-log-file")) then
			file.createFile("logs/logfile", "txt")
		end

		-- Clear log file
		if (s_equals(cmd, "clear-log-file")) then
			file.clearFile("logs/logfile.txt")
			oututils.writeStr("Successfully cleared the log file.\n")
		end

		-- Enter account creation
		if (s_equals(cmd, "set-profile")) then
			set_prof.init()
		end

		-- Enter cursor customization
		if (s_equals(cmd, "set-cursor")) then
			set_cursor.init()
		end

		-- Get QyVern's Guidelines
		if (s_equals(cmd, "get-guidelines")) then
			local src_guidelines_link = "https://github.com/Equinoxtic/QyVern/blob/master/GUIDELINES.txt"
			oututils.writeStr(
				"\n" .. file.readFile("GUIDELINES.txt") .. oututils.writeEscSeq("\n") .. "(Guidelines Source): " .. src_guidelines_link .. oututils.writeEscSeq("\n\n")
			)
		end

		-- Get the client version
		if (s_equals(cmd, "get-client-version")) then
			oututils.lnOutStr(getVersionOf("client"), true)
		end

		-- Get the version of Lua
		if (s_equals(cmd, "get-lua-version")) then
			oututils.lnOutStr(getVersionOf("lua"), true)
		end

		-- Get the version of LuaJIT
		if (s_equals(cmd, "get-luajit-version")) then
			oututils.lnOutStr(getVersionOf("luajit"), true)
		end

		-- Get the list of commands
		if (s_equals(cmd, "list-commands")) then
			command_handler.initCommands()
		end

		command_properties.do_init = def_init_val

		if (command_properties.do_init) then
			init.InitClient(command_properties.clear, command_properties.show_options, command_properties.show_title, command_properties.show_load)
		end
	end
end

return parser
