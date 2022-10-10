local loading = {}

local text = {
	"Initializing UI...",
	"Creating hyperlinks...",
	"Loading modules...",
	"Unpacking options...",
	"Making configuration files...",
	"Finished!"
}

function loading.openLoadingState()
	local thread = require("src.modules.qylib.thread")
	local sys = require("src.modules.sys.qysys")
	local console_displayer = require("src.modules.display.console_displayer")
	local logfile = "logs/logfile.txt"
	local table_hash = #text
	for i = 1, table_hash do
		console_displayer.displayConsoleMessage(text[i], "std", "-")
		console_displayer.displayConsoleMessage(text[i], "wf", logfile)
		thread.sleep(math.random(500, 750))
		if (i >= table_hash) then
			sys.clearScreen()
			console_displayer.displayConsoleMessage("Successfully loaded!", "wf", logfile)
		end
	end
end

return loading