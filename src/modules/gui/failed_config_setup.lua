local failed_config_setup = {}

function failed_config_setup.create()
	local oututils = require("src.modules.io.qyoututils")
	local link = require("src.modules.qylib.link")
	local prompt = require("src.modules.display.prompt")
	local doc_link = "https://github.com/Equinoxtic/QyVern/blob/master/docs/CONFIGURATION.md"
	oututils.writeStr("\nError starting up QyVern.\n\nThe \"config\" directory does not exist.\nPlease read this markdown document to fully set up and start up QyVern.\nLink: " .. doc_link)
	prompt.createPrompt("\n\n> Open Link?", "yx", "parenthesis")
	local opt = io.read()
	prompt.promptCallback(opt, "y", "Y", function()
		link.open(doc_link)
	end, function()
		oututils.writeStr("SETUP FAILED.")
	end)
end

return failed_config_setup