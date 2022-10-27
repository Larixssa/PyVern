local command_handler = {}

function command_handler.initCommands()
	local command = require("src.modules.cl.command")
	local oututils = require("src.modules.io.qyoututils")
	local text_divider = require("src.modules.display.text_divider")

	local names = {
		"List command.",
		"Version command.",
		"Math command.",
		"Create a script.",
		"Create a module.",
		"Open a Link."
	}

	local prefixes = {
		"list",
		"version",
		"math",
		"-create-script",
		"-create-module",
		"-open-link"
	}

	local descriptions = {
		"List all available commands.",
		"Shows version of the Client, Lua, and LuaJIT",
		"Perform simple math calculations / operations.",
		"Create a Custom Script for the client",
		"Create a Built-in or External module for the client.",
		"Open a link from the console."
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
	text_divider.createTextDivider(73, "-", true, false)
	oututils.createEscSeq("\n", true)
end

return command_handler
