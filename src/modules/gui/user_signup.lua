local user_signup = {}

local function getSCursor()
	local cursor = require("src.modules.display.cursor")
	local paths = require("src.modules.cl.paths")
	return cursor.getSelectionCursor(paths.getConfigProperty("selection-cursor"))
end

function user_signup.init()
	local strutils = require("src.modules.qyvern_strutils")
	local oututils = require("src.modules.qyvern_oututils")
	local file = require("src.modules.qylib.file")
	local init = require("src.modules.init.init_client")
	local console_display = require("src.modules.display.console_displayer")
	local thread = require("src.modules.qylib.thread")
	local prompt = require("src.modules.display.prompt")
	local errorutils = require("src.modules.qyvern_errorutils")
	local logfile = "logs/logfile.txt"
	local read = io.read
	local username
	oututils.lnOutStr("\n[ Username Sign Up GUI. ]", true)
	oututils.writeStr(getSCursor() .. " Enter Username: ")
	username = read()
	if not (strutils.checkNil(username) or strutils.checkEmpty(username)) then
		if not (strutils.checkStringEquals(username, file.readFile("config/profile.txt"))) then
			local io_option
			local uname_str
			prompt.createPrompt(getSCursor() .. " Include border around username?", "yx", "parenthesis")
			io_option = read()
			if (strutils.checkStringEquals(io_option, "y") or strutils.checkStringEquals(io_option, "Y")) then
				uname_str = "[" .. username .. "]"
			else
				uname_str = username
			end
			file.writeFileBytes("config/profile.txt", uname_str)
			oututils.lnOutStr(getSCursor() .. " Created Account: \"" .. username .. ".\"", true)
			console_display.displayConsoleMessage("Successfully created account: \"" .. username .. ".\"", "wf", logfile)
		else
			errorutils.localUserProfileExists(username)
		end
	end
	oututils.lnOutStr(getSCursor() .. " Returning to menu...", true)
	console_display.displayConsoleMessage("Returning to main...", "wf", logfile)
	thread.sleep(500)
	init.InitClient(true, true, false, false)
end

return user_signup