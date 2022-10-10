local options_handler = {}

function options_handler.initOptions()
	local option = require("src.modules.options_api.option")
	local oututils = require("src.modules.io.qyoututils")
	local text_divider = require("src.modules.display.text_divider")

	local short_names = {
		"exit",
		"clear",
		"get-repo",
		"set-profile",
		"set-cursor"
	}

	local names = {
		"Exit the program.",
		"Clear the screen.",
		"Get the official repo (link) for QyVern.",
		"Create a profile for QyVern.",
		"Customize the client's cursor."
	}

	oututils.createEscSeq("\n", true)

	text_divider.createTextDivider(73, "-", true, false)
	oututils.createEscSeq("\n", true)
	for i = 1, #short_names or #names do
		option.createOption(
			short_names[i], names[i], false, nil
		)
		oututils.createEscSeq("\n", true)
	end
	text_divider.createTextDivider(73, "-", true, true)

	oututils.createEscSeq("\n", true)
end

return options_handler
