local module_init = {}

local function getExternalModulePath()
	return "src/ext_modules/"
end

local function getModuleFile(f, ext)
	local strutils = require("src.modules.io.qystrutils")
	local parsed
	if not (strutils.checkNil(f) and strutils.checkNil(ext)) then
		parsed = f .. ext
	end
	return parsed
end

function module_init.initModule(module_file)
	local strutils = require("src.modules.io.qystrutils")
	local errorutils = require("src.modules.error_handlers.qyerrorutils")
	local script = require("src.modules.qylib.script")
	local paths = require("src.modules.cl.paths")
	if not (strutils.checkNil(module_file)) then
		if (strutils.typeCheck(module_file, "string")) then
			script.execute(paths.getFile(getExternalModulePath() .. getModuleFile(module_file, ".txt")))
		end
	else
		errorutils.execThrowError("missing", "module file")
	end
end

function module_init.getModuleData(module_file)
	local strutils = require("src.modules.io.qystrutils")
	local errorutils = require("src.modules.error_handlers.qyerrorutils")
	local oututils = require("src.modules.io.qyoututils")
	local file = require("src.modules.qylib.file")
	local paths = require("src.modules.cl.paths")
	if not (strutils.checkNil(module_file)) then
		if (strutils.typeCheck(module_file, "string")) then
			oututils.lnOutStr(file.readFile(paths.getFile(getExternalModulePath() .. getModuleFile(module_file, ".txt"))), true)
		end
	else
		errorutils.execThrowError("missing", "module file")
	end
end

return module_init
