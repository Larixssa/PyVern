local set_cursor = {}

local function getSCursor()
	local cursor = require("src.modules.display.cursor")
	local paths = require("src.modules.cl.paths")
	return cursor.getSelectionCursor(paths.getConfigProperty("selection-cursor"))
end

function set_cursor.init()
	local strutils = require("src.modules.io.qystrutils")
	local oututils = require("src.modules.io.qyoututils")
	local file = require("src.modules.qylib.file")
	local init = require("src.modules.init.init_client")
	local console_display = require("src.modules.display.console_displayer")
	local thread = require("src.modules.qylib.thread")
	local logfile = "logs/logfile.txt"
	local cancel = false
	local read = io.read
	local cursor
	local cursor_types = {
		file.readFile("config/cursor.txt"), file.readFile("config/selection-cursor.txt")
	}
	local cursor_names = {
		"Regular Cursor", "Selection Cursor"
	}
	local cursor_cmds = {
		"cursor", "select-cursor"
	}
	oututils.lnOutStr("\n[ Cursor customization GUI. ]", true)
	for i = 1, #cursor_types do
		oututils.lnOutStr("(" .. cursor_types[i] .. ") - " .. cursor_names[i] .. " [" .. cursor_cmds[i] .. "]", true)
	end
	oututils.lnOutStr("(Type in \"close\" to cancel operation.)", true)
	oututils.writeStr(getSCursor() .. " Select cursor type: ")
	cursor = read()
	if not (strutils.checkNil(cursor) or strutils.checkEmpty(cursor)) then
		local cursor_io
		local cursor_str
		local cursor_f
		if (strutils.checkStringEquals(cursor, "cancel")) then cancel = true end
		if not (cancel) then
			console_display.displayConsoleMessage("Selected cursor type: \"" .. cursor .. ".\"", "wf", logfile)
			if (strutils.checkStringEquals(cursor, "cursor")) then
				cursor_f = "cursor.txt"
				cursor_str = "Cursor"
			elseif (strutils.checkStringEquals(cursor, "select-cursor")) then
				cursor_f = "selection-cursor.txt"
				cursor_str = "Selection cursor"
			end
			oututils.writeStr(getSCursor() .. " Input new " .. cursor_str .. ": ")
			cursor_io = read()
			file.writeFileBytes("config/" .. cursor_f, cursor_io)
			oututils.lnOutStr(getSCursor() .. " Set " .. cursor_str .. " to: " .. cursor_io, true)
			console_display.displayConsoleMessage("Successfully changed " .. cursor_str .. " to " .. cursor_io, "wf", logfile)
		else
			console_display.displayConsoleMessage("Cursor customization cancelled.", "wf", logfile)
			oututils.lnOutStr("> Cancelled operation.", true)
		end
	end
	oututils.lnOutStr(getSCursor() .. " Returning to menu...", true)
	console_display.displayConsoleMessage("Returning to main...", "wf", logfile)
	thread.sleep(500)
	init.InitClient(true, true, false, false)
end

return set_cursor
