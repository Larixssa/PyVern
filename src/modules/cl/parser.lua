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
	"list-commands"
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
	local logfile = "logs/logfile.txt"
	if not (strutils.checkNil(cmd)) then
		if (strutils.checkStringEquals(cmd, "exit")) then console_writefile("Client closed.", logfile) end
		if (strutils.checkStringEquals(cmd, "clear")) then console_writefile("Screen cleared.", logfile) end
		if (strutils.checkStringEquals(cmd, "get-repo")) then console_writefile("Repository link created.", logfile) end
		if (strutils.checkStringEquals(cmd, "make-logs-dir")) then console_writefile("Created \"logs\" directory.", logfile) end
		if (strutils.checkStringEquals(cmd, "new-log-file")) then console_writefile("Created new \"logfile.\"", logfile) end
		-- if (strutils.checkStringEquals(cmd, "clear-log-file")) then console_writefile("Cleared logfile.", logfile) end
		if (strutils.checkStringEquals(cmd, "set-profile")) then console_writefile("Entered to profile settings.", logfile) end
		if (strutils.checkStringEquals(cmd, "set-cursor")) then console_writefile("Customizing Cursor...", logfile) end
		if (strutils.checkStringEquals(cmd, "get-guidelines")) then console_writefile("Getting and Reading the Guidelines...", logfile) end
		if (strutils.checkStringEquals(cmd, "list-commands")) then console_writefile("Listing available commands.", logfile) end
	end
end

function parser.parseCommand(cmd)
	local strutils = require("src.modules.io.qystrutils")
	local oututils = require("src.modules.io.qyoututils")
	local sys = require("src.modules.sys.qysys")
	local init = require("src.modules.init.init_client")
	local file = require("src.modules.qylib.file")
	local console_displayer = require("src.modules.display.console_displayer")
	local set_prof = require("src.modules.gui.set_profile")
	local set_cursor = require("src.modules.gui.set_cursor")
	local command_handler = require("src.modules.cl.command_handler")
	local command_properties = require("src.modules.cl.command_parser")
	local logfile = "logs/logfile.txt"
	local def_init_val = true

	if not (strutils.checkNil(cmd)) then

		console_displayer.displayConsoleMessage("\"" .. cmd .. "\" command successfully executed.", "wf", logfile)

		commandLog(cmd)

		-- Exits the program
		if (strutils.checkStringEquals(cmd, "exit")) then
			sys.exitProgram()
			sys.clearScreen()
			def_init_val = false
		end

		-- Clears the screen
		if (strutils.checkStringEquals(cmd, "clear")) then
			sys.clearScreen()
		end

		-- Get QyVern repo link
		if (strutils.checkStringEquals(cmd, "get-repo")) then
			local _link = "https://github.com/Equinoxtic/QyVern"
			oututils.writeStr(
				"\n" .. file.readFile("config/repo-desc.txt") .. "\n\n- Repository link: " .. _link .. oututils.writeEscSeq("\n\n")
			)
		end

		-- Make a logs directory
		if (strutils.checkStringEquals(cmd, "make-logs-dir")) then
			sys.osExecute("mkdir logs")
		end

		-- Make a log file for console logging
		if (strutils.checkStringEquals(cmd, "new-log-file")) then
			file.createFile("logs/logfile", "txt")
		end

		-- Clear log file
		if (strutils.checkStringEquals(cmd, "clear-log-file")) then
			file.clearFile("logs/logfile.txt")
			oututils.writeStr("Successfully cleared the log file.\n")
		end

		-- Enter account creation
		if (strutils.checkStringEquals(cmd, "set-profile")) then
			set_prof.init()
		end

		-- Enter cursor customization
		if (strutils.checkStringEquals(cmd, "set-cursor")) then
			set_cursor.init()
		end

		-- Get QyVern's Guidelines
		if (strutils.checkStringEquals(cmd, "get-guidelines")) then
			local src_guidelines_link = "https://github.com/Equinoxtic/QyVern/blob/master/GUIDELINES.txt"
			oututils.writeStr(
				"\n" .. file.readFile("GUIDELINES.txt") .. oututils.writeEscSeq("\n") .. "(Guidelines Source): " .. src_guidelines_link .. oututils.writeEscSeq("\n\n")
			)
		end

		-- Get the list of commands
		if (strutils.checkStringEquals(cmd, "list-commands")) then
			command_handler.initCommands()
		end

		command_properties.do_init = def_init_val

		if (command_properties.do_init) then
			init.InitClient(command_properties.clear, command_properties.show_options, command_properties.show_title, command_properties.show_load)
		end
	end
end

return parser
