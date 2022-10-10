local command_parser = {}

command_parser.commands = {
	"-list",
	"-manual"
}

command_parser.flags = {
	"/options"
}

local function console_writefile(message, logfile)
	local strutils = require("src.modules.io.qystrutils")
	local console_displayer = require("src.modules.display.console_displayer")
	if not (strutils.checkNil(message) and strutils.checkNil(logfile)) then
		console_displayer.displayConsoleMessage(message, "wf", logfile)
	end
end

local function commandLog(cmd)
	local strutils = require("src.modules.qyvern_strutils")
	local logfile = "logs/logfile.txt"
	if not (strutils.checkNil(cmd)) then
		if (strutils.checkStringEquals(cmd, "-list")) then console_writefile("Listing commands, objects and flags.", logfile) end
		if (strutils.checkStringEquals(cmd, "-manual")) then console_writefile("Opening the Client Manual.", logfile) end
	end
end

function command_parser.parseCommand(cmd)
	local init = require("src.modules.init.init_client")
	local strutils = require("src.modules.io.qystrutils")
	local command = require("src.modules.cl.command")
	local console_displayer = require("src.modules.display.console_displayer")
	local command_properties = require("src.modules.cl.command_properties")
	local paths = require("src.modules.cl.paths")
	local logfile = "logs/logfile.txt"
	local def_init_val = true

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

			if (strutils.startsWith(cmd, "-list")) then
				if (strutils.findString(cmd, "/options")) then
					command.flag_execute(cmd, "/options", command_parser.flags, function()
						local opts_handler = require("src.modules.options_api.options_handler")
						local oututils = require("src.modules.qyvern_oututils")
						oututils.lnOutStr("\n[ Available options. ]", true)
						opts_handler.initOptions()
					end)
				else
					command.execute(function()
						local cmd_handler = require("src.modules.cl.command_handler")
						local oututils = require("src.modules.qyvern_oututils")
						oututils.lnOutStr("\n[ Available commands. ]", true)
						cmd_handler.initCommands()
					end)
				end
			end

			if (strutils.startsWith(cmd, "-manual")) then
				if (strutils.findString(cmd, "/create-script")) then
					command.flag_execute(cmd, "/options", command_parser.flags, function()
					end)
				else
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
