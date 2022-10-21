local command_parser = {}

command_parser.commands = {
	"-list",
	"-version",
	"-math",
	"--create-script",
	"--create-module"
}

command_parser.flags = {
	"/options",
	"/client",
	"/lua",
	"/luajit",
	"-addition",
	"-subtraction",
	"-multiplication",
	"-division",
	"/built-in",
	"/external"
}

local function console_writefile(message, logfile)
	local strutils = require("src.modules.io.qystrutils")
	local console_displayer = require("src.modules.display.console_displayer")
	if not (strutils.checkNil(message) and strutils.checkNil(logfile)) then
		console_displayer.displayConsoleMessage(message, "wf", logfile)
	end
end

local function commandLog(cmd)
	local strutils = require("src.modules.io.qystrutils")
	local logfile = "logs/logfile.txt"
	if not (strutils.checkNil(cmd)) then
		if (strutils.checkStringEquals(cmd, "-list")) then console_writefile("Listing commands, objects and flags.", logfile) end
		if (strutils.checkStringEquals(cmd, "-manual")) then console_writefile("Opening the Client Manual.", logfile) end
	end
end

function command_parser.parseCommand(cmd)
	local init = require("src.modules.init.init_client")
	local strutils = require("src.modules.io.qystrutils")
	local oututils = require("src.modules.io.qyoututils")
	local command = require("src.modules.cl.command")
	local console_displayer = require("src.modules.display.console_displayer")
	local command_properties = require("src.modules.cl.command_properties")
	local create_gui = require("src.modules.gui.create_gui")
	local math_gui = require("src.modules.gui.math_ui")
	local paths = require("src.modules.cl.paths")
	local file = require("src.modules.qylib.file")
	local logfile = "logs/logfile.txt"
	local def_init_val = true
	local flag_exec = command.flag_execute
	local find_str = strutils.findString
	local str_starts = strutils.startsWith

	if (strutils.startsWith(cmd, "-")) then
		if not (strutils.checkNil(cmd)) then

			console_displayer.displayConsoleMessage("\"" .. cmd .. "\" command successfully executed.", "wf", logfile)

			commandLog(cmd)

			--[[ Test command as an example for making commands.
			if (strutils.checkStringEquals(cmd, "-test")) then
				command.execute(function()
					print("Hello World!")
				end)
				properties.clear = true
				properties.show_load = false
				properties.show_options = false
			end
			]]

			if (str_starts(cmd, "-list")) then
				if (find_str(cmd, "/options")) then
					flag_exec(cmd, "/options", command_parser.flags, function()
						local opts_handler = require("src.modules.options_api.options_handler")
						local oututils = require("src.modules.io.qyoututils")
						oututils.lnOutStr("\n[ Available options. ]", true)
						opts_handler.initOptions()
					end)
				else
					local cmd_handler = require("src.modules.cl.command_handler")
					local oututils = require("src.modules.io.qyoututils")
					oututils.lnOutStr("\n[ Available commands. ]", true)
					cmd_handler.initCommands()
				end
			end

			if (str_starts(cmd, "-version")) then
				local version_str
				if (find_str(cmd, "/client")) then
					flag_exec(cmd, "/client", command_parser.flags, function()
						version_str = file.readFile("version.txt") .. " - " .. file.readFile("build.txt")
					end)
				elseif (find_str(cmd, "/lua")) then
					flag_exec(cmd, "/lua", command_parser.flags, function()
						version_str = file.readFile("lua-version.txt")
					end)
				elseif (find_str(cmd, "/luajit")) then
					flag_exec(cmd, "/luajit", command_parser.flags, function()
						version_str = file.readFile("luajit-version.txt")
					end)
				end
				oututils.lnOutStr(version_str, true)
			end

			if (str_starts(cmd, "-math")) then
				if (find_str(cmd, "-addition")) then
					math_gui.init_math_ui("addition")
				elseif (find_str(cmd, "-subtraction")) then
					math_gui.init_math_ui("subtraction")
				elseif (find_str(cmd, "-multiplication")) then
					math_gui.init_math_ui("multiplication")
				elseif (find_str(cmd, "-division")) then
					math_gui.init_math_ui("division")
				end
			end

			if (str_starts(cmd, "--create-script")) then
				create_gui.initGui("create-script")
			end

			if (str_starts(cmd, "--create-module")) then
				if (find_str(cmd, "/built-in")) then
					flag_exec(cmd, "/built-in", command_parser.flags, function()
						create_gui.initGui("create-module")
					end)
				elseif (find_str(cmd, "/external")) then
					flag_exec(cmd, "/external", command_parser.flags, function()
						create_gui.initGui("create-ext-module")
					end)
				end
			end

			command_properties.do_init = def_init_val

			if (command_properties.do_init) then
				init.InitClient(command_properties.clear, command_properties.show_options, command_properties.show_title, command_properties.show_load)
			end
		end
	end
end

return command_parser
