local command_handler = {}

function command_handler.initCommands()
	local command = require("src.modules.cl.command")
	local oututils = require("src.modules.qyvern_oututils")
	local text_divider = require("src.modules.display.text_divider")

	local names = {
		"List command."
	}

	local prefixes = {
		"list"
	}

	local descriptions = {
		"List all available commands."
	}

	oututils.createEscSeq("\n", true)
	text_divider.createTextDivider(73, "-", true, false)
	oututils.createEscSeq("\n", true)
	for i = 1, #names or #prefixes or #descriptions do
		command.new(
			names[i], prefixes[i], descriptions[i]
		)
		oututils.createEscSeq("\n", true)
	end
	text_divider.createTextDivider(73, "-", true, true)
	oututils.createEscSeq("\n", true)
end

return command_handler
