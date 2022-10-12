local init_client = {}

-- MAIN initialization file

function init_client.InitClient(doClearScreen, showOptions, showTitle, execLoad)
	-- NOTE: Write code in this function here

	local options_handler = require("src.modules.options_api.options_handler")
	local parser = require("src.modules.cl.parser")
	local command_parser = require("src.modules.cl.command_parser")
	local strutils = require("src.modules.io.qystrutils")
	local oututils = require("src.modules.io.qyoututils")
	local errorutils = require("src.modules.error_handlers.qyerrorutils")
	local sys = require("src.modules.sys.qysys")
	local cursor = require("src.modules.display.cursor")
	local file = require("src.modules.qylib.file")
	local loading_state = require("src.modules.states.loading")
	local title = require("src.modules.display.title")
	local version = require("src.modules.display.version")
	local paths = require("src.modules.cl.paths")
	local profile = file.readFile("config/profile.txt")
	local id = file.readFile(paths.getConfigProperty("id"))
	local title_display = title.create("QyVern") .. " - " .. version.create(file.readFile(paths.getFile("version.txt")), true) .. "\n"
	local id_str

	if (doClearScreen) then sys.clearScreen() end

	if (execLoad) then loading_state.openLoadingState() end

	if (showTitle) then oututils.writeStr(title_display) end

	if (showOptions) then options_handler.initOptions() end

	if not (strutils.checkEmpty(id)) then id_str = id else id_str = "" end

	if not (strutils.checkEmpty(profile)) then
		local profile_str
		if (strutils.checkStringEquals(profile, "Guest")) then
			profile_str = "Guest#" .. math.random(1, 9999)
		else
			profile_str = profile .. " " .. id_str
		end
		cursor.createCursor(profile_str .. " " .. file.readFile("config/cursor.txt"))
	else
		cursor.createCursor(file.readFile("config/cursor.txt"))
	end

	local cmd_io = io.read()

	if not (strutils.checkEmpty(cmd_io)) then
		local parse_command = false
		if not (strutils.startsWith(cmd_io, "-")) then
			for i = 1, #parser.availablecommands do
				if cmd_io == parser.availablecommands[i] then parse_command = true end
			end
			if (parse_command) then
				parser.parseCommand(cmd_io) else errorutils.invalidCommandError(cmd_io)
				init_client.InitClient(false, false, false)
			end
		else
			for i = 1, #command_parser.commands do
				if strutils.startsWith(cmd_io, command_parser.commands[i]) then parse_command = true end
			end
			if (parse_command) then
				command_parser.parseCommand(cmd_io) else errorutils.invalidCommandError(cmd_io)
				init_client.InitClient(false, false, false)
			end
		end
	else
		errorutils.execThrowError("missing", "command")
		init_client.InitClient(false, false, false)
	end
end

return init_client
