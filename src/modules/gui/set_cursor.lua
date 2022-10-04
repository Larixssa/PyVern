local set_cursor = {}

function set_cursor.init()
	local strutils = require("src.modules.qyvern_strutils")
	local oututils = require("src.modules.qyvern_oututils")
	local file = require("src.modules.qylib.file")
	local init = require("src.modules.init.init_client")
	local console_display = require("src.modules.display.console_displayer")
	local thread = require("src.modules.qylib.thread")
	local logfile = "logs/logfile.txt"
	local cancel = false
	local read = io.read
	local cursor
	local cursor_types = {
		file.readFile("config/cursor.txt"),
		file.readFile("config/selection-cursor.txt")
	}
	local cursor_names = {
		"Regular Cursor",
		"Selection Cursor"
	}
	local cursor_cmds = {
		"cursor",
		"select-cursor"
	}
	oututils.lnOutStr("\n[ Cursor customization GUI. ]", true)
	for i = 1, #cursor_types do
		oututils.lnOutStr("(" .. cursor_types[i] .. ") - " .. cursor_names[i] .. " [" .. cursor_cmds[i] .. "]", true)
	end
	oututils.lnOutStr("(Type in \"close\" to cancel operation.)", true)
	oututils.writeStr("> Select cursor type: ")
	cursor = read()
	if not (strutils.checkNil(cursor) or strutils.checkEmpty(cursor)) then
		local cursor_io
		local cursor_str
		local cursor_f
		if (strutils.checkStringEquals(cursor, "cancel")) then cancel = true end
		if not (cancel) then
			console_display.displayConsoleMessage("Selected cursor type: \"" .. cursor .. ".\"")
			if (strutils.checkStringEquals(cursor, "cursor")) then
				cursor_f = "cursor.txt"
				cursor_str = "Cursor"
			elseif (strutils.checkStringEquals(cursor, "select-cursor")) then
				cursor_f = "selection-cursor.txt"
				cursor_str = "Selection cursor"
			end
			oututils.writeStr("> Input new " .. cursor_str .. ": ")
			cursor_io = read()
			file.writeFileBytes("config/" .. cursor_f, cursor_io)
			oututils.lnOutStr("> Set " .. cursor_str .. " to: " .. cursor_io, true)
			console_display.displayConsoleMessage("Successfully changed " .. cursor_str .. " to " .. cursor_io, "wf", logfile)
		else
			console_display.displayConsoleMessage("Cursor customization cancelled.", "wf", logfile)
			oututils.lnOutStr("> Cancelled operation.", true)
		end
	end
	oututils.lnOutStr("> Returning to menu...", true)
	console_display.displayConsoleMessage("Returning to main...", "wf", logfile)
	thread.sleep(500)
	init.InitClient(true, true, false, false)
end

return set_cursor
