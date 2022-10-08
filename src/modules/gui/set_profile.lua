local set_profile = {}

local function getSCursor()
	local cursor = require("src.modules.display.cursor")
	local paths = require("src.modules.cl.paths")
	return cursor.getSelectionCursor(paths.getConfigProperty("selection-cursor"))
end

local function initialize_options()
	local oututils = require("src.modules.qyvern_oututils")
	local options = {
		"[username] - Set the username.",
		"[id] - Set the ID for the profile."
	}
	oututils.lnOutStr("\n[ Profile Settings GUI. ]", true)
	for i = 1, #options do
		oututils.lnOutStr(options[i], true)
	end
	oututils.writeEscSeq("\n")
end

local function set_username()
	local strutils = require("src.modules.qyvern_strutils")
	local prompt = require("src.modules.display.prompt")
	local file = require("src.modules.qylib.file")
	local errorutils = require("src.modules.qyvern_errorutils")
	local oututils = require("src.modules.qyvern_oututils")
	local console_display = require("src.modules.display.console_displayer")
	local paths = require("src.modules.cl.paths")
	local read = io.read
	local username
	oututils.lnOutStr("\n[ Username Settings GUI. ]", true)
	oututils.writeStr(getSCursor() .. " Enter Username: ")
	username = read()
	if not (strutils.checkNilOrEmpty(username)) then
		if not (strutils.checkStringEquals(username, file.readFile("config/profile.txt"))) then
			local io_option
			local uname_str
			prompt.createPrompt(getSCursor() .. " Include border around username?", "yx", "parenthesis")
			io_option = read()
			prompt.promptCallback(io_option, "y", "Y",
				function()
					uname_str = "[" .. username .. "]"
				end,
				function()
					uname_str = username
				end)
			file.writeFileBytes("config/profile.txt", uname_str)
			oututils.lnOutStr(getSCursor() .. " Created Account: \"" .. username .. ".\"", true)
			console_display.displayConsoleMessage("Successfully created account: \"" .. username .. ".\"", "wf", paths.getLogfilePath())
		else
			errorutils.localUserProfileExists(username)
		end
	else
		errorutils.execThrowError("missing", "username")
	end
end

local function set_id()
	local strutils = require("src.modules.qyvern_strutils")
	local prompt = require("src.modules.display.prompt")
	local file = require("src.modules.qylib.file")
	local errorutils = require("src.modules.qyvern_errorutils")
	local oututils = require("src.modules.qyvern_oututils")
	local console_display = require("src.modules.display.console_displayer")
	local paths = require("src.modules.cl.paths")
	local convert = require("src.modules.qylib.convert")
	local thread = require("src.modules.qylib.thread")
	local init = require("src.modules.init.init_client")
	local read = io.read
	local id
	local option
	oututils.lnOutStr("\n[ ID Settings GUI. ]", true)
	prompt.createPrompt(getSCursor() .. " Create a new ID?", "yx", "parenthesis")
	option = read()
	if not (strutils.checkNil(option)) then
		local id_num = math.random(1, 9999)
		prompt.promptCallback(option, "y", "Y", function()
			id = "@ " .. convert.toString(id_num)
		end, function()
			id = ""
		end)
		file.writeFileBytes(paths.getConfigProperty("id"), id)
	else
		errorutils.execThrowError("missing", "option value")
	end
	oututils.lnOutStr(getSCursor() .. " Set ID to: " .. id, true)
	console_display.displayConsoleMessage("Set ID to: " .. id, "wf", paths.getLogfilePath())
	oututils.lnOutStr(getSCursor() .. " Returning to menu...", true)
	console_display.displayConsoleMessage("Returning to main...", "wf", paths.getLogfilePath())
	thread.sleep(500)
	init.InitClient(false, true, false, false)
end

function set_profile.init()
	local strutils = require("src.modules.qyvern_strutils")
	local oututils = require("src.modules.qyvern_oututils")
	local console_display = require("src.modules.display.console_displayer")
	local init = require("src.modules.init.init_client")
	local thread = require("src.modules.qylib.thread")
	local paths = require("src.modules.cl.paths")
	local file = require("src.modules.qylib.file")
	local cursor = require("src.modules.display.cursor")
	initialize_options()
	local read = io.read
	cursor.createCursor("\n" .. file.readFile(paths.getConfigProperty("cursor")))
	local option = read()
	if (strutils.typeCheck(option, "string")) then
		if not (strutils.checkNil(option)) then
			if (strutils.checkStringEquals(option, "username")) then
				set_username()
			elseif (strutils.checkStringEquals(option, "id")) then
				set_id()
			end
		end
	end
	oututils.lnOutStr(getSCursor() .. " Returning to menu...", true)
	console_display.displayConsoleMessage("Returning to main...", "wf", paths.getLogfilePath())
	thread.sleep(500)
	init.InitClient(true, true, false, false)
end

return set_profile
