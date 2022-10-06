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
	local console_display = require("src.modules.display.console_displayer")
	local prompt = require("src.modules.display.prompt")
	local errorutils = require("src.modules.qyvern_errorutils")
	local init = require("src.modules.init.init_client")
	local thread = require("src.modules.qylib.thread")
	local logfile = "logs/logfile.txt"
	local read = io.read
	local username
	oututils.lnOutStr("\n[ Username Sign Up GUI. ]", true)
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
			console_display.displayConsoleMessage("Successfully created account: \"" .. username .. ".\"", "wf", logfile)
		else
			errorutils.localUserProfileExists(username)
		end
	else
		oututils.lnOutStr("")
	end
	oututils.lnOutStr(getSCursor() .. " Returning to menu...", true)
	console_display.displayConsoleMessage("Returning to main...", "wf", logfile)
	thread.sleep(500)
	init.InitClient(true, true, false, false)
end

return user_signup
