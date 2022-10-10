local console_displayer = {}

--- Displays a message for the console.
---
---	Modes:
---		| "wf" -> Write to file
---		| "std" -> Standard message output
function console_displayer.displayConsoleMessage(msg, mode, file_path)
	local console_message = require("src.modules.display.console_message")
	local strutils = require("src.modules.io.qystrutils")
	local oututils = require("src.modules.io.qyoututils")
	local file = require("src.modules.qylib.file")
	if not (strutils.checkNil(msg) and strutils.checkNil(file_path) and strutils.checkNil(mode)) then
		local cmsg = console_message.create() .. msg
		if (strutils.checkStringEquals(mode, "std")) then
			oututils.lnOutStr(cmsg, true)
		elseif (strutils.checkStringEquals(mode, "wf")) then
			file.writeFile(file_path, cmsg)
		end
	end
end

return console_displayer
