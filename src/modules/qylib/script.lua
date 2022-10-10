local script = {}

function script.execute(script_file)
	local file = require("src.modules.qylib.file")
	local strutils = require("src.modules.io.qystrutils")
	local scr
	if not (strutils.checkNil(script_file)) then
		scr = load(file.readFile("src/scripts/" .. script_file .. ".txt"))
	end
	scr()
end

return script