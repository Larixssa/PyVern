local command = {}

--- Creates a new command.
function command.new(name, cmd_pref, description)
	local strutils = require("src.modules.io.qystrutils")
	local oututils = require("src.modules.io.qyoututils")
	local errorutils = require("src.modules.error_handlers.qyerrorutils")
	local new_cmd_pref
	if not (strutils.checkNil(name) and strutils.checkNil(cmd_pref)) then
		new_cmd_pref = strutils.lowerStr(cmd_pref)
		if (strutils.typeCheck(name, "string") and strutils.typeCheck(cmd_pref, "string")) then
			oututils.writeStr("[-" .. new_cmd_pref .. "] : " .. name .. "\n> " .. description)
		end
	else
		errorutils.execThrowError("missing", "name and command prefix")
	end
end

--- Execute a command with a hardcoded function.
function command.execute(fn)
	local strutils = require("src.modules.io.qystrutils")
	local errorutils = require("src.modules.error_handlers.qyerrorutils")
	if not (strutils.checkNil(fn)) then
		if (strutils.typeCheck(fn, "function")) then
			fn()
		end
	else
		errorutils.execThrowError("missing", "function callback")
	end
end

--- Execute a command with a script. (script.txt)
function command.execute_from_script(file)
	local strutils = require("src.modules.io.qystrutils")
	local errorutils = require("src.modules.error_handlers.qyerrorutils")
	local script = require("src.modules.qylib.script")
	if not (strutils.checkNil(file)) then
		if (strutils.typeCheck(file, "string")) then
			script.execute(file)
		end
	else
		errorutils.execThrowError("missing", "script.txt file")
	end
end

-- Executes a flag for a certain command.
function command.flag_execute(cmd, flag_str, flag_table, callback)
	local strutils = require("src.modules.io.qystrutils")
	local errorutils = require("src.modules.error_handlers.qyerrorutils")
	local do_callback = false
	if not (strutils.checkNil(cmd) and strutils.checkNil(flag_str)) then
		if (strutils.typeCheck(cmd, "string") and strutils.typeCheck(flag_str, "string")) then
			for i = 1, #flag_table do
				if (strutils.findString(flag_str, flag_table[i])) then
					do_callback = true
				end
			end
			if (do_callback) then
				if not (strutils.checkNil(callback)) then
					if (strutils.typeCheck(callback, "function")) then
						callback()
					end
				else
					errorutils.execThrowError("missing", "function callback")
				end
			end
		else
			errorutils.execThrowError("missing", "command and flag string values")
		end
	end
end

return command
